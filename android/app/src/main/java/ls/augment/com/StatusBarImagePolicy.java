package ls.augment.com;

import java.io.IOException;

/** Cheap container checks before native decoding. Frames are decoded lazily by Android. */
public final class StatusBarImagePolicy {
    public static final int MAX_FRAMES=240;
    private StatusBarImagePolicy() { }
    public static int validate(byte[] data)throws IOException {
        if(data==null||data.length<8)throw new IOException("素材文件不完整");
        if(ascii(data,0,"GIF87a")||ascii(data,0,"GIF89a"))return gif(data);
        if(ascii(data,0,"RIFF")&&ascii(data,8,"WEBP"))return webp(data);
        if(data[0]==(byte)0x89&&ascii(data,1,"PNG\r\n\u001a\n")){
            int p=8;while(p+12<=data.length){long length=be32(data,p);if(length>data.length-p-12)throw new IOException("PNG 文件不完整");
                if(ascii(data,p+4,"acTL"))throw new IOException("APNG 暂不支持，请使用 GIF 或动态 WebP");p+=(int)length+12;}
        }
        return 1;
    }
    private static int gif(byte[] data)throws IOException {
        need(data,0,13);int width=u16(data,6),height=u16(data,8),flags=data[10]&255,p=13;
        if((flags&128)!=0)p+=3*(1<<((flags&7)+1));need(data,0,p);int frames=0;
        while(p<data.length){int kind=data[p++]&255;
            if(kind==0x3b){if(frames==0)throw new IOException("GIF 没有图像帧");return frames;}
            if(kind==0x21){need(data,p,1);p++;p=blocks(data,p);continue;}
            if(kind!=0x2c)throw new IOException("GIF 数据块无效");need(data,p,9);
            int x=u16(data,p),y=u16(data,p+2),w=u16(data,p+4),h=u16(data,p+6),local=data[p+8]&255;p+=9;
            if(w==0||h==0||x+w>width||y+h>height)throw new IOException("GIF 帧尺寸超出画布");
            if((local&128)!=0)p+=3*(1<<((local&7)+1));need(data,p,1);p++;p=blocks(data,p);
            if(++frames>MAX_FRAMES)throw new IOException("动画不能超过 240 帧");
        }throw new IOException("GIF 文件不完整");
    }
    private static int blocks(byte[] data,int p)throws IOException {while(true){need(data,p,1);int size=data[p++]&255;if(size==0)return p;need(data,p,size);p+=size;}}
    private static int webp(byte[] data)throws IOException {
        need(data,0,12);long end=le32(data,4)+8;if(end!=data.length)throw new IOException("WebP 文件长度无效");int p=12,frames=0;
        while(p+8<=data.length){long size=le32(data,p+4);if(size>data.length-p-8)throw new IOException("WebP 数据块不完整");
            if(ascii(data,p,"ANMF")){if(size<16)throw new IOException("WebP 动画帧无效");if(++frames>MAX_FRAMES)throw new IOException("动画不能超过 240 帧");}
            long next=p+8L+size+(size&1);if(next>data.length)throw new IOException("WebP 数据块不完整");p=(int)next;
        }if(p!=data.length)throw new IOException("WebP 文件不完整");return Math.max(1,frames);
    }
    private static boolean ascii(byte[] data,int p,String value){if(p<0||p+value.length()>data.length)return false;for(int i=0;i<value.length();i++)if((data[p+i]&255)!=value.charAt(i))return false;return true;}
    private static void need(byte[] data,int p,int count)throws IOException {if(p<0||count<0||p>data.length-count)throw new IOException("素材文件不完整");}
    private static int u16(byte[] data,int p){return (data[p]&255)|((data[p+1]&255)<<8);}
    private static long le32(byte[] data,int p){return (data[p]&255L)|((data[p+1]&255L)<<8)|((data[p+2]&255L)<<16)|((data[p+3]&255L)<<24);}
    private static long be32(byte[] data,int p){return ((data[p]&255L)<<24)|((data[p+1]&255L)<<16)|((data[p+2]&255L)<<8)|(data[p+3]&255L);}
}
