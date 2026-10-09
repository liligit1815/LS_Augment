package ls.augment.com;

import android.content.Context;
import android.graphics.ImageDecoder;
import android.graphics.drawable.AnimatedImageDrawable;
import android.graphics.drawable.Drawable;
import android.util.AtomicFile;
import org.json.JSONObject;
import java.io.*;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.security.MessageDigest;
import java.util.*;

/** Immutable, content-addressed source files. Importing never grants an external URI to SystemUI. */
public final class StatusBarAssetStore {
    public static final int MAX_BYTES=8*1024*1024,MAX_DECODE_SIDE=256;
    private static final Object STORE_LOCK=new Object();
    public static final class Asset {
        public final String hash,name,mime;
        public final int width,height;
        public final boolean animated;
        Asset(String hash,String name,String mime,int width,int height,boolean animated){this.hash=hash;this.name=name;this.mime=mime;this.width=width;this.height=height;this.animated=animated;}
    }
    private StatusBarAssetStore() { }
    public static File directory(Context context){return new File(context.getFilesDir(),"statusbar-assets");}
    public static File file(Context context,String hash){checkHash(hash);return new File(directory(context),hash+".asset");}
    private static File metadataFile(Context context,String hash){checkHash(hash);return new File(directory(context),hash+".json");}
    private static void checkHash(String hash){if(hash==null||!hash.matches("[0-9a-f]{64}"))throw new IllegalArgumentException("素材标识无效");}
    public static byte[] read(Context context,String hash)throws IOException {try(InputStream in=new FileInputStream(file(context,hash))){return read(in);}}
    public static byte[] read(InputStream input)throws IOException {
        if(input==null)throw new IOException("无法读取素材");
        ByteArrayOutputStream output=new ByteArrayOutputStream();byte[] block=new byte[8192];int n;
        while((n=input.read(block))!=-1){if(output.size()+n>MAX_BYTES)throw new IOException("素材不能超过 8 MiB");output.write(block,0,n);}return output.toByteArray();
    }
    public static String hash(byte[] bytes)throws Exception {StringBuilder value=new StringBuilder();for(byte b:MessageDigest.getInstance("SHA-256").digest(bytes))value.append(String.format(Locale.ROOT,"%02x",b&255));return value.toString();}
    public static String importFile(Context context,InputStream input,String name)throws Exception {
        byte[] bytes=read(input);String hash=hash(bytes);Asset asset=inspect(hash,bytes,name);save(context,asset,bytes);return hash;
    }
    public static void store(Context context,String hash,byte[] bytes)throws Exception {save(context,validate(hash,bytes),bytes);}
    public static Asset validate(String hash,byte[] bytes)throws Exception {
        checkHash(hash);if(bytes==null||!hash.equals(hash(bytes)))throw new IOException("素材校验失败");return inspect(hash,bytes,hash.substring(0,12));
    }
    private static Asset inspect(String hash,byte[] bytes,String name)throws IOException {
        final Asset[] info=new Asset[1];Drawable drawable=decodeInternal(bytes,64,(mime,w,h,animated)->info[0]=new Asset(hash,safeName(name,hash),mime,w,h,animated));
        if(drawable instanceof AnimatedImageDrawable)((AnimatedImageDrawable)drawable).stop();drawable.setCallback(null);return info[0];
    }
    private static String safeName(String name,String hash){String safe=name==null?"":name.replaceAll("[\\p{Cntrl}/\\\\]","_").trim();return safe.isEmpty()?hash.substring(0,12):safe.substring(0,Math.min(100,safe.length()));}
    public static Drawable decode(byte[] bytes,int maxSide)throws IOException {return decodeInternal(bytes,maxSide,null);}
    private interface Header {void accept(String mime,int width,int height,boolean animated);}
    private static Drawable decodeInternal(byte[] bytes,int maxSide,Header header)throws IOException {
        if(bytes==null||bytes.length<8||bytes.length>MAX_BYTES)throw new IOException("素材文件大小无效");
        StatusBarImagePolicy.validate(bytes);
        int side=Math.max(1,Math.min(MAX_DECODE_SIDE,maxSide));
        try{return ImageDecoder.decodeDrawable(ImageDecoder.createSource(ByteBuffer.wrap(bytes)),(decoder,info,source)->{
            String mime=info.getMimeType();if(!Arrays.asList("image/png","image/jpeg","image/webp","image/gif").contains(mime))throw new IllegalArgumentException("请选择 PNG、JPEG、WebP 或 GIF");
            int w=info.getSize().getWidth(),h=info.getSize().getHeight(),limit=info.isAnimated()?1024:4096;
            if(w<1||h<1||w>limit||h>limit)throw new IllegalArgumentException("素材尺寸超过限制："+limit+" 像素");
            float scale=Math.min(1f,side/(float)Math.max(w,h));decoder.setTargetSize(Math.max(1,Math.round(w*scale)),Math.max(1,Math.round(h*scale)));
            decoder.setAllocator(ImageDecoder.ALLOCATOR_SOFTWARE);decoder.setOnPartialImageListener(error->false);
            if(header!=null)header.accept(mime,w,h,info.isAnimated());
        });}catch(IllegalArgumentException error){throw new IOException(error.getMessage(),error);}
    }
    private static void save(Context context,Asset asset,byte[] bytes)throws Exception {
        synchronized(STORE_LOCK){
            File folder=directory(context);if(!folder.isDirectory()&&!folder.mkdirs())throw new IOException("无法创建素材目录");
            write(file(context,asset.hash),bytes);
            // An import of the same bytes should retain an existing user-visible name.
            File meta=metadataFile(context,asset.hash);
            if(!meta.isFile())write(meta,new JSONObject().put("hash",asset.hash).put("name",asset.name).put("mime",asset.mime).put("width",asset.width).put("height",asset.height).put("animated",asset.animated).toString().getBytes(StandardCharsets.UTF_8));
        }
    }
    private static void write(File target,byte[] bytes)throws IOException {AtomicFile atomic=new AtomicFile(target);FileOutputStream output=atomic.startWrite();try{output.write(bytes);atomic.finishWrite(output);}catch(IOException error){atomic.failWrite(output);throw error;}}
    public static List<Asset> list(Context context){
        List<Asset> result=new ArrayList<>();File[] files=directory(context).listFiles((dir,name)->name.matches("[0-9a-f]{64}\\.json"));if(files==null)return result;
        Arrays.sort(files,Comparator.comparingLong(File::lastModified).reversed());
        for(File meta:files){if(result.size()>=512)break;try{if(meta.length()>4096)continue;JSONObject value=new JSONObject(new String(Files.readAllBytes(meta.toPath()),StandardCharsets.UTF_8));String hash=meta.getName().substring(0,64);if(!file(context,hash).isFile())continue;
            result.add(new Asset(hash,safeName(value.optString("name"),hash),value.getString("mime"),value.getInt("width"),value.getInt("height"),value.optBoolean("animated")));
        }catch(Exception ignored){ }}return result;
    }
    public static boolean deleteUnused(Context context,String hash)throws IOException {
        synchronized(STORE_LOCK){if(StatusBarAssetReferences.statusbarIcons(new AppConfig(context).snapshot()).contains(hash))throw new IOException("素材正在使用，请先恢复对应图标");
            File asset=file(context,hash),metadata=metadataFile(context,hash);if(asset.isFile()&&!asset.delete())throw new IOException("无法删除素材");if(metadata.isFile()&&!metadata.delete())throw new IOException("无法删除素材信息");return true;}
    }
}
