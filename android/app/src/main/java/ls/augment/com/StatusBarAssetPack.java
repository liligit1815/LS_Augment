package ls.augment.com;

import android.content.Context;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.security.MessageDigest;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipOutputStream;
import org.json.JSONObject;
import org.json.JSONTokener;

/** Portable artwork only: inspecting a package never writes assets or configuration. */
public final class StatusBarAssetPack {
    public static final String REPOSITORY_URL = "https://github.com/liligit1815/RedMagicDuo-Assets";
    public static final String SUBMIT_URL = REPOSITORY_URL + "/issues/new?template=asset-submission.yml";
    public static final String FORMAT = "RedMagicDuo.StatusBarAssets";
    public static final int MAX_ZIP_BYTES = 20 * 1024 * 1024;
    public static final int MAX_EXPANDED_BYTES = 64 * 1024 * 1024;
    private static final int MAX_FILES = 512;
    private static final int MAX_MANIFEST_BYTES = 256 * 1024;
    private static final int MAX_NOTICES_BYTES = 2 * 1024 * 1024;
    private StatusBarAssetPack() { }

    public static final class Preview {
        public final String name, author, license, theme, fonts;
        public final int imageCount, fontCount, animatedCount, uncompressedBytes;
        private final Map<String, byte[]> images, fontFiles;
        private final String attribution;
        private Preview(String name, String author, String license, String theme, String fonts,
                Map<String, byte[]> images, Map<String, byte[]> fontFiles, int animated, int bytes,String attribution) {
            this.name=name;this.author=author;this.license=license;this.theme=theme;this.fonts=fonts;
            this.images=Collections.unmodifiableMap(images);this.fontFiles=Collections.unmodifiableMap(fontFiles);
            imageCount=images.size();fontCount=fontFiles.size();animatedCount=animated;uncompressedBytes=bytes;
            this.attribution=attribution;
        }
        public String summary() {
            return name+"\n作者："+author+"\n许可："+license+"\n图标素材 "+imageCount+" 个（动画 "+animatedCount
                    +" 个），字体 "+fontCount+" 个\n仅覆盖包内涉及的图标和明确指定的字体，保留其他素材、显隐、位置与布局。";
        }
    }

    /** Must run off the UI thread. The caller owns the stream. */
    public static Preview inspect(InputStream input) throws Exception {
        byte[] archive=readBounded(input,MAX_ZIP_BYTES,"素材包超过 20 MiB");
        if(archive.length<4||archive[0]!='P'||archive[1]!='K'||archive[2]!=3||archive[3]!=4)
            throw new IOException("请选择 ZIP 素材包");
        Set<String> directory=zipDirectory(archive);
        Map<String,byte[]> entries=new LinkedHashMap<>();int expanded=0;
        try(ZipInputStream zip=new ZipInputStream(new ByteArrayInputStream(archive))) {
            ZipEntry entry;
            while((entry=zip.getNextEntry())!=null) {
                String path=entry.getName();
                if(entry.isDirectory()||!validPath(path)||entries.containsKey(path)||entries.size()>=MAX_FILES)
                    throw new IOException("素材包含重复、不支持或不安全的文件路径");
                int limit="manifest.json".equals(path)?MAX_MANIFEST_BYTES:Math.min(path.startsWith("images/")?StatusBarAssetStore.MAX_BYTES:ManagedFont.MAX_BYTES,MAX_EXPANDED_BYTES-expanded);
                byte[] bytes=readBounded(zip,limit,"素材包文件过大");
                expanded+=bytes.length;if(expanded>MAX_EXPANDED_BYTES)throw new IOException("素材包解压后超过 64 MiB");
                entries.put(path,bytes);zip.closeEntry();
            }
        }
        if(!directory.equals(entries.keySet()))throw new IOException("ZIP 文件目录不一致");
        byte[] manifestBytes=entries.remove("manifest.json");
        if(manifestBytes==null)throw new IOException("缺少 manifest.json");
        String manifestText=StandardCharsets.UTF_8.newDecoder().onMalformedInput(java.nio.charset.CodingErrorAction.REPORT)
                .onUnmappableCharacter(java.nio.charset.CodingErrorAction.REPORT).decode(java.nio.ByteBuffer.wrap(manifestBytes)).toString();
        new StrictJson(manifestText).validate();
        JSONTokener tokener=new JSONTokener(manifestText);
        Object root=tokener.nextValue();if(!(root instanceof JSONObject)||tokener.nextClean()!=0)throw new IOException("素材清单格式无效");
        JSONObject manifest=(JSONObject)root;
        onlyKeys(manifest,"format","version","metadata","theme","fonts","images","fontFiles");
        if(!FORMAT.equals(string(manifest,"format"))||!(manifest.get("version") instanceof Integer)||manifest.getInt("version")!=1)
            throw new IOException("不支持的素材包版本");
        JSONObject metadata=manifest.getJSONObject("metadata");
        onlyKeys(metadata,"name","author","license","licenseText","source","description");
        String name=metadata(metadata,"name",100),author=metadata(metadata,"author",100),license=metadata(metadata,"license",200);
        for(String key:new String[]{"licenseText","source","description"})if(metadata.has(key))metadata(metadata,key,"licenseText".equals(key)?65536:2048);
        String theme=string(manifest,"theme"),fonts=string(manifest,"fonts");
        validateSpecs(theme,fonts);
        Map<String,String> settings=settings(theme,fonts);
        Map<String,byte[]> images=readResources(manifest.getJSONObject("images"),entries,true);
        Map<String,byte[]> fontFiles=readResources(manifest.getJSONObject("fontFiles"),entries,false);
        if(!entries.isEmpty())throw new IOException("素材包包含清单之外的文件");
        if(!images.keySet().equals(StatusBarAssetReferences.statusbarIcons(settings))||!fontFiles.keySet().equals(StatusBarAssetReferences.fonts(settings)))
            throw new IOException("素材引用与文件清单不一致");
        int animated=0;
        for(Map.Entry<String,byte[]> item:images.entrySet()) {
            if(StatusBarAssetStore.validate(item.getKey(),item.getValue()).animated)animated++;
        }
        for(Map.Entry<String,byte[]> item:fontFiles.entrySet())ManagedFont.validate(item.getKey(),item.getValue());
        return new Preview(name,author,license,theme,fonts,images,fontFiles,animated,expanded,metadata.toString());
    }

    /** Saves verified content, returns two appearance keys, and never commits settings itself. */
    public static Map<String,String> install(Context context,Preview preview)throws Exception {
        if(preview==null)throw new IOException("请先预检素材包");
        for(Map.Entry<String,byte[]> item:preview.images.entrySet())StatusBarAssetStore.store(context,item.getKey(),item.getValue());
        for(Map.Entry<String,byte[]> item:preview.fontFiles.entrySet())ManagedFont.store(context,item.getKey(),item.getValue());
        for(String hash:preview.images.keySet())saveAttribution(context,hash,preview.attribution);
        for(String hash:preview.fontFiles.keySet())saveAttribution(context,hash,preview.attribution);
        return settings(preview.theme,preview.fonts);
    }

    /** Merge into the editor's current draft after confirmation, preserving unrelated artwork. */
    public static Map<String,String> merge(Map<String,String> current,Preview preview)throws IOException {
        if(current==null||preview==null)throw new IOException("缺少当前设置或素材预检结果");
        StatusBarThemeSpec theme=StatusBarThemeSpec.parse(current.getOrDefault(StatusBarThemeSpec.KEY,""));
        StatusBarFontSpec fonts=StatusBarFontSpec.parse(current.getOrDefault(StatusBarFontSpec.KEY,""));
        StatusBarThemeSpec incoming=StatusBarThemeSpec.parse(preview.theme);StatusBarFontSpec incomingFonts=StatusBarFontSpec.parse(preview.fonts);
        if(theme==null||fonts==null||incoming==null||incomingFonts==null)throw new IOException("当前素材配置无效，请先修复或恢复对应素材");
        try {
            Set<String> ids=new LinkedHashSet<>();for(StatusBarThemeSpec.Binding binding:incoming.entries())ids.add(binding.surface+","+binding.id);
            for(String id:ids){String[] target=id.split(",",2);theme=theme.without(target[1],target[0]);}
            for(StatusBarThemeSpec.Binding binding:incoming.entries())theme=theme.with(binding);
            for(String surface:StatusBarSurfaceSpec.SCOPES)for(String role:new String[]{"global","clock","network","metrics","battery","bluetooth","other"})
                if(!incomingFonts.get(role,surface).equals("inherit"))fonts=fonts.with(role,incomingFonts.get(role,surface),surface);
            return settings(theme.serialize(),fonts.serialize());
        }catch(IllegalArgumentException error){throw new IOException("合并素材超过配置限制",error);}
    }

    /** Backup only the notices for resource hashes actually referenced by that backup. */
    public static JSONObject exportNotices(Context context,Set<String> hashes)throws Exception {
        JSONObject output=new JSONObject();int total=0;
        if(hashes==null||hashes.size()>MAX_FILES)throw new IOException("素材授权条目过多");
        for(String hash:hashes) {
            checkNoticeHash(hash);File file=noticeFile(context,hash);if(!file.isFile())continue;
            byte[] bytes;try(InputStream input=Files.newInputStream(file.toPath())){bytes=readBounded(input,MAX_MANIFEST_BYTES,"素材授权信息过大");}
            total+=bytes.length;if(total>MAX_NOTICES_BYTES)throw new IOException("素材授权信息合计超过 2 MiB");
            JSONObject value=new JSONObject(new String(bytes,StandardCharsets.UTF_8));validateMetadata(value);output.put(hash,value);
        }
        return output;
    }

    /** No writes: validate backup notices and deny metadata for any unrelated asset. */
    public static Map<String,String> parseNotices(JSONObject object,Set<String> allowed)throws Exception {
        Map<String,String> output=new LinkedHashMap<>();if(object==null)return output;
        if(allowed==null||object.length()>MAX_FILES)throw new IOException("素材授权条目过多");
        int total=0;Iterator<String> iterator=object.keys();
        while(iterator.hasNext()) {
            String hash=iterator.next();checkNoticeHash(hash);if(!allowed.contains(hash))throw new IOException("素材授权包含未引用的资源");
            Object raw=object.get(hash);if(!(raw instanceof JSONObject))throw new IOException("素材授权信息必须为对象");
            JSONObject metadata=(JSONObject)raw;validateMetadata(metadata);String record=metadata.toString();int size=record.getBytes(StandardCharsets.UTF_8).length;
            if(size>MAX_MANIFEST_BYTES||(total+=size)>MAX_NOTICES_BYTES)throw new IOException("素材授权信息过大");output.put(hash,record);
        }
        return output;
    }

    /** Resource-level atomic files; existing provenance survives a backup with alternate declarations. */
    public static void restoreNotices(Context context,Map<String,String> notices)throws Exception {
        if(notices==null)return;
        JSONObject object=new JSONObject();for(Map.Entry<String,String> entry:notices.entrySet()) {
            new StrictJson(entry.getValue()).validate();object.put(entry.getKey(),new JSONObject(entry.getValue()));
        }
        Map<String,String> validated=parseNotices(object,notices.keySet());
        for(Map.Entry<String,String> entry:validated.entrySet())saveAttribution(context,entry.getKey(),entry.getValue());
    }

    /** Creates a package containing only the two appearance settings and their referenced resources. */
    public static void export(Context context,Map<String,String> snapshot,String name,String author,String license,OutputStream output)throws Exception {
        String theme=snapshot.getOrDefault(StatusBarThemeSpec.KEY,""),fonts=snapshot.getOrDefault(StatusBarFontSpec.KEY,"");
        validateSpecs(theme,fonts);Map<String,String> selected=settings(theme,fonts);
        JSONObject meta=new JSONObject().put("name",name).put("author",author).put("license",license);
        metadata(meta,"name",100);metadata(meta,"author",100);metadata(meta,"license",200);
        JSONObject imageManifest=new JSONObject(),fontManifest=new JSONObject();Map<String,byte[]> resources=new LinkedHashMap<>();
        Set<String> attributions=new LinkedHashSet<>();int resourceBytes=0;
        for(String hash:StatusBarAssetReferences.statusbarIcons(selected)) {
            byte[] bytes;
            try(InputStream input=Files.newInputStream(StatusBarAssetStore.file(context,hash).toPath())){bytes=readBounded(input,StatusBarAssetStore.MAX_BYTES,"图标文件过大");}
            StatusBarAssetStore.validate(hash,bytes);resourceBytes+=bytes.length;
            if(resourceBytes>MAX_EXPANDED_BYTES)throw new IOException("素材超过 64 MiB，请减少素材后分享");
            String path="images/"+hash+imageExtension(bytes);imageManifest.put(hash,path);resources.put(path,bytes);readAttribution(context,hash,attributions);
        }
        for(String hash:StatusBarAssetReferences.fonts(selected)) {
            byte[] bytes;
            try(InputStream input=Files.newInputStream(ManagedFont.file(context,hash).toPath())){bytes=readBounded(input,ManagedFont.MAX_BYTES,"字体文件过大");}
            ManagedFont.validate(hash,bytes);resourceBytes+=bytes.length;
            if(resourceBytes>MAX_EXPANDED_BYTES)throw new IOException("素材超过 64 MiB，请减少素材后分享");
            String path="fonts/"+hash+".font";fontManifest.put(hash,path);resources.put(path,bytes);readAttribution(context,hash,attributions);
        }
        if(resources.size()+1>MAX_FILES)throw new IOException("素材文件数量超过限制");
        if(!attributions.isEmpty()) {
            StringBuilder notices=new StringBuilder("Imported resource notices / 导入素材的原始授权声明\n");
            for(String record:attributions) {
                JSONObject source=new JSONObject(record);
                notices.append("\n---\n").append(source.optString("name")).append("\nAuthor: ").append(source.optString("author"))
                        .append("\nLicense: ").append(source.optString("license")).append("\n").append(source.optString("source"))
                        .append("\n").append(source.optString("licenseText")).append('\n');
            }
            if(notices.length()>65536)throw new IOException("素材授权信息过长，请拆分分享包");meta.put("licenseText",notices.toString());
        }
        JSONObject manifest=new JSONObject().put("format",FORMAT).put("version",1).put("metadata",meta)
                .put("theme",theme).put("fonts",fonts).put("images",imageManifest).put("fontFiles",fontManifest);
        ByteArrayOutputStream packed=new ByteArrayOutputStream();int total=0;
        try(ZipOutputStream zip=new ZipOutputStream(packed)) {
            byte[] bytes=manifest.toString(2).getBytes(StandardCharsets.UTF_8);total+=bytes.length;
            if(bytes.length>MAX_MANIFEST_BYTES)throw new IOException("素材清单过大");
            writeEntry(zip,"manifest.json",bytes);
            for(Map.Entry<String,byte[]> item:resources.entrySet()) {
                total+=item.getValue().length;if(total>MAX_EXPANDED_BYTES)throw new IOException("素材超过 64 MiB，请减少素材后分享");
                writeEntry(zip,item.getKey(),item.getValue());
                if(packed.size()>MAX_ZIP_BYTES)throw new IOException("素材包超过 20 MiB，请减少素材后分享");
            }
        }
        if(packed.size()>MAX_ZIP_BYTES)throw new IOException("素材包超过 20 MiB，请减少素材后分享");
        output.write(packed.toByteArray());
    }

    private static void validateSpecs(String theme,String fonts)throws IOException {
        StatusBarThemeSpec themeSpec=StatusBarThemeSpec.parse(theme);StatusBarFontSpec fontSpec=StatusBarFontSpec.parse(fonts);
        if(themeSpec==null||fontSpec==null||!themeSpec.serialize().equals(theme)||!fontSpec.serialize().equals(fonts))
            throw new IOException("素材映射或字体设置无效，请使用应用导出的规范格式");
    }
    private static Map<String,String> settings(String theme,String fonts) {
        Map<String,String> result=new LinkedHashMap<>();result.put(StatusBarThemeSpec.KEY,theme);result.put(StatusBarFontSpec.KEY,fonts);return result;
    }
    private static Map<String,byte[]> readResources(JSONObject list,Map<String,byte[]> entries,boolean image)throws Exception {
        Map<String,byte[]> result=new LinkedHashMap<>();Iterator<String> keys=list.keys();
        while(keys.hasNext()) {
            String hash=keys.next(),path=string(list,hash);
            if(!hash.matches("[0-9a-f]{64}")||!validPath(path)||!path.startsWith((image?"images/":"fonts/")+hash+"."))
                throw new IOException("素材路径与校验值不匹配");
            byte[] bytes=entries.remove(path);if(bytes==null||!hash.equals(digest(bytes)))throw new IOException("素材缺失或校验失败");
            result.put(hash,bytes);
        }
        return result;
    }
    private static boolean validPath(String path) {
        return path!=null&&("manifest.json".equals(path)||path.matches("images/[0-9a-f]{64}\\.(png|jpg|jpeg|gif|webp)")
                ||path.matches("fonts/[0-9a-f]{64}\\.(ttf|otf|ttc|font)"));
    }
    private static void onlyKeys(JSONObject object,String... allowed)throws IOException {
        Set<String> keys=new LinkedHashSet<>();Collections.addAll(keys,allowed);Iterator<String> iterator=object.keys();
        while(iterator.hasNext())if(!keys.contains(iterator.next()))throw new IOException("素材清单含不支持的字段，不能导入全量设置或脚本");
    }
    private static String metadata(JSONObject object,String key,int limit)throws Exception {
        Object raw=object.get(key);if(!(raw instanceof String))throw new IOException("素材信息格式无效");String text=(String)raw;
        if(text.trim().isEmpty()||text.length()>limit||text.indexOf('\0')>=0)throw new IOException("请填写有效的素材名称、作者与许可");return text;
    }
    private static void validateMetadata(JSONObject object)throws Exception {
        onlyKeys(object,"name","author","license","licenseText","source","description");
        metadata(object,"name",100);metadata(object,"author",100);metadata(object,"license",200);
        for(String key:new String[]{"licenseText","source","description"})if(object.has(key))metadata(object,key,"licenseText".equals(key)?65536:2048);
    }
    private static String string(JSONObject object,String key)throws Exception {
        Object value=object.get(key);if(!(value instanceof String))throw new IOException("素材字段必须为文本："+key);return (String)value;
    }
    private static byte[] readBounded(InputStream input,int limit,String message)throws IOException {
        ByteArrayOutputStream bytes=new ByteArrayOutputStream();byte[] buffer=new byte[8192];int count;
        while((count=input.read(buffer))!=-1){if(count>limit-bytes.size())throw new IOException(message);bytes.write(buffer,0,count);}return bytes.toByteArray();
    }
    private static String digest(byte[] bytes)throws Exception {
        StringBuilder result=new StringBuilder();for(byte b:MessageDigest.getInstance("SHA-256").digest(bytes))result.append(String.format(java.util.Locale.ROOT,"%02x",b&255));return result.toString();
    }
    private static String imageExtension(byte[] bytes)throws IOException {
        if(bytes.length>8&&bytes[0]==(byte)0x89&&bytes[1]=='P'&&bytes[2]=='N'&&bytes[3]=='G')return ".png";
        if(bytes.length>6&&bytes[0]=='G'&&bytes[1]=='I'&&bytes[2]=='F')return ".gif";
        if(bytes.length>3&&bytes[0]==(byte)0xff&&bytes[1]==(byte)0xd8&&bytes[2]==(byte)0xff)return ".jpg";
        if(bytes.length>12&&bytes[0]=='R'&&bytes[1]=='I'&&bytes[2]=='F'&&bytes[3]=='F'&&bytes[8]=='W'&&bytes[9]=='E'&&bytes[10]=='B'&&bytes[11]=='P')return ".webp";
        throw new IOException("分享包只支持 PNG、JPEG、GIF 和 WebP 图标");
    }
    private static void writeEntry(ZipOutputStream zip,String name,byte[] bytes)throws IOException {
        ZipEntry entry=new ZipEntry(name);entry.setTime(0);zip.putNextEntry(entry);zip.write(bytes);zip.closeEntry();
    }
    private static synchronized void saveAttribution(Context context,String hash,String record)throws IOException {
        File folder=new File(context.getFilesDir(),"statusbar-pack-notices");
        if(!folder.isDirectory()&&!folder.mkdirs())throw new IOException("无法保存素材授权说明");
        checkNoticeHash(hash);File target=new File(folder,hash+".json");if(target.isFile())return;
        android.util.AtomicFile file=new android.util.AtomicFile(target);FileOutputStream out=file.startWrite();
        try{out.write(record.getBytes(StandardCharsets.UTF_8));file.finishWrite(out);}catch(IOException error){file.failWrite(out);throw error;}
    }
    private static void readAttribution(Context context,String hash,Set<String> records)throws IOException {
        File file=noticeFile(context,hash);
        if(file.isFile())try(InputStream input=Files.newInputStream(file.toPath())){records.add(new String(readBounded(input,MAX_MANIFEST_BYTES,"素材授权信息过大"),StandardCharsets.UTF_8));}
    }
    private static File noticeFile(Context context,String hash)throws IOException {checkNoticeHash(hash);return new File(new File(context.getFilesDir(),"statusbar-pack-notices"),hash+".json");}
    private static void checkNoticeHash(String hash)throws IOException {if(hash==null||!hash.matches("[0-9a-f]{64}"))throw new IOException("素材授权标识无效");}

    /** ZipInputStream alone accepts some truncated files; require a complete, matching central directory. */
    private static Set<String> zipDirectory(byte[] data)throws IOException {
        int end=-1;
        for(int at=data.length-22;at>=Math.max(0,data.length-65557);at--)
            if(u32(data,at)==0x06054b50L&&at+22+u16(data,at+20)==data.length){end=at;break;}
        if(end<0||u16(data,end+4)!=0||u16(data,end+6)!=0)throw new IOException("ZIP 文件不完整或不支持分卷");
        int count=u16(data,end+10);long size=u32(data,end+12),offset=u32(data,end+16);
        if(count<1||count>MAX_FILES||u16(data,end+8)!=count||offset+size!=end||offset>data.length)
            throw new IOException("ZIP 文件目录无效");
        int at=(int)offset;Set<String> names=new LinkedHashSet<>();
        for(int i=0;i<count;i++) {
            if(at+46>end||u32(data,at)!=0x02014b50L)throw new IOException("ZIP 文件目录损坏");
            int flags=u16(data,at+8),method=u16(data,at+10),length=u16(data,at+28),extra=u16(data,at+30),comment=u16(data,at+32);
            long local=u32(data,at+42),mode=u32(data,at+38)>>>16;
            int next=at+46+length+extra+comment;
            if(next>end||(flags&1)!=0||(method!=0&&method!=8)||u16(data,at+34)!=0||(mode&0170000)==0120000
                    ||local+30>offset||u32(data,(int)local)!=0x04034b50L)
                throw new IOException("ZIP 含加密、链接或不支持的文件");
            String name=new String(data,at+46,length,StandardCharsets.UTF_8);
            int localName=u16(data,(int)local+26);
            if(!validPath(name)||!names.add(name)||localName!=length||local+30+localName>offset
                    ||!name.equals(new String(data,(int)local+30,localName,StandardCharsets.UTF_8)))throw new IOException("ZIP 文件名不一致或重复");
            at=next;
        }
        if(at!=end)throw new IOException("ZIP 文件目录长度不一致");return names;
    }
    private static int u16(byte[] bytes,int at){return (bytes[at]&255)|((bytes[at+1]&255)<<8);}
    private static long u32(byte[] bytes,int at){if(at<0||at+4>bytes.length)return -1;return (bytes[at]&255L)|((bytes[at+1]&255L)<<8)|((bytes[at+2]&255L)<<16)|((bytes[at+3]&255L)<<24);}

    /** Android JSONTokener is intentionally lenient; this guard enforces JSON and rejects duplicate keys. */
    private static final class StrictJson {
        private final String text;private int at;
        StrictJson(String text){this.text=text;}
        void validate()throws IOException {value(0);space();if(at!=text.length())bad();}
        private void space(){while(at<text.length()&&" \r\n\t".indexOf(text.charAt(at))>=0)at++;}
        private boolean take(char ch){space();if(at<text.length()&&text.charAt(at)==ch){at++;return true;}return false;}
        private void require(char ch)throws IOException {if(!take(ch))bad();}
        private void value(int depth)throws IOException {
            if(depth>16)bad();space();if(at>=text.length())bad();char c=text.charAt(at);
            if(c=='{') {at++;Set<String> keys=new LinkedHashSet<>();if(take('}'))return;
                do {space();String key=quoted();if(!keys.add(key))throw new IOException("素材清单含重复字段");require(':');value(depth+1);}while(take(','));require('}');
            } else if(c=='['){at++;if(take(']'))return;do{value(depth+1);}while(take(','));require(']');}
            else if(c=='"')quoted();
            else if(text.startsWith("true",at))at+=4;
            else if(text.startsWith("false",at))at+=5;
            else if(text.startsWith("null",at))at+=4;
            else {int start=at;while(at<text.length()&&"0123456789+-.eE".indexOf(text.charAt(at))>=0)at++;
                if(start==at||!text.substring(start,at).matches("-?(0|[1-9][0-9]*)(\\.[0-9]+)?([eE][+-]?[0-9]+)?"))bad();}
        }
        private String quoted()throws IOException {
            if(at>=text.length()||text.charAt(at++)!='"') {bad();return "";}StringBuilder out=new StringBuilder();
            while(at<text.length()) {char c=text.charAt(at++);if(c=='"')return out.toString();if(c<32)bad();
                if(c=='\\') {if(at>=text.length())bad();char escape=text.charAt(at++);
                    switch(escape){case '"':case '\\':case '/':out.append(escape);break;case 'b':out.append('\b');break;case 'f':out.append('\f');break;
                        case 'n':out.append('\n');break;case 'r':out.append('\r');break;case 't':out.append('\t');break;
                        case 'u':if(at+4>text.length())bad();String code=text.substring(at,at+4);if(!code.matches("[0-9a-fA-F]{4}"))bad();out.append((char)Integer.parseInt(code,16));at+=4;break;
                        default:bad();}
                } else out.append(c);
            }bad();return "";
        }
        private void bad()throws IOException {throw new IOException("素材清单不是有效的 JSON");}
    }
}
