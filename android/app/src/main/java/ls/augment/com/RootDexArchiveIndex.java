package ls.augment.com;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Path;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

/** Pinned DEX039 archive index. No Android, native pointers, hooks or admission. */
final class RootDexArchiveIndex {
    static final long MAX_ARCHIVE_BYTES=96L*1024*1024, MAX_TOTAL_OUTPUT=128L*1024*1024;
    static final int MAX_ENTRIES=1024, MAX_DEX_BYTES=16*1024*1024, MAX_DEX_ENTRIES=16;
    static final int MAX_ENTRY_OUTPUT=32*1024*1024, MAX_CLASS_DEFS=65536, MAX_STRINGS=1_000_000;
    static final int MAX_ARCHIVE_CLASSES=65536, MAX_DESCRIPTOR_CHARS=4*1024*1024;
    private static final byte[] MAGIC={'d','e','x','\n','0','3','9',0};
    final String archiveSha256;
    private final Map<String,DexIndex> dexes;

    private RootDexArchiveIndex(String hash,Map<String,DexIndex> dexes) {
        archiveSha256=hash;this.dexes=Collections.unmodifiableMap(new LinkedHashMap<>(dexes));
    }
    static boolean canonicalDexEntry(String name) {
        if("classes.dex".equals(name))return true;
        if(name==null || !name.matches("classes(?:[2-9]|1[0-6])\\.dex"))return false;
        return true;
    }
    static String entryFromLocation(String location,String pinnedPath,String expectedEntry)throws IOException {
        if(!canonicalDexEntry(expectedEntry))throw invalid("noncanonical expected entry");
        if(pinnedPath.equals(location) && "classes.dex".equals(expectedEntry))return expectedEntry;
        if((pinnedPath+"!"+expectedEntry).equals(location))return expectedEntry;
        throw invalid("runtime cache location differs from pinned archive/entry");
    }

    /** One file handle, one bounded hash stream; successful publication follows full EOF+SHA. */
    static RootDexArchiveIndex read(Path path,String expectedHash)throws IOException {
        if(expectedHash==null || !expectedHash.matches("[0-9a-f]{64}"))throw invalid("bad expected hash");
        Map<String,DexIndex> indices=new LinkedHashMap<>();Set<String> names=new HashSet<>();
        IndexBudget budget=new IndexBudget();
        byte[] scratch=new byte[64*1024];long totalOutput=0;int entries=0;
        try(HashStream source=new HashStream(new FileInputStream(path.toFile()));
            ZipInputStream zip=new ZipInputStream(source)) {
            ZipEntry entry;
            while((entry=zip.getNextEntry())!=null) {
                if(++entries>MAX_ENTRIES)throw invalid("too many ZIP entries");
                String name=entry.getName();
                if(name==null || name.length()>512 || !names.add(name))throw invalid("invalid/duplicate ZIP name");
                boolean dex=canonicalDexEntry(name);
                byte[] bytes=null;
                if(dex) {
                    if(indices.size()>=MAX_DEX_ENTRIES || entry.isDirectory() || entry.getMethod()!=ZipEntry.STORED
                            || entry.getSize()<112 || entry.getSize()>MAX_DEX_BYTES)
                        throw invalid("DEX entry not within pinned stored-DEX bounds");
                    bytes=new byte[(int)entry.getSize()];
                }
                int count=0,n;
                while((n=zip.read(scratch))!=-1) {
                    if(n==0)throw invalid("ZIP reader made no progress");
                    count+=n;totalOutput+=n;
                    if(count>MAX_ENTRY_OUTPUT || totalOutput>MAX_TOTAL_OUTPUT)throw invalid("ZIP output bound exceeded");
                    if(bytes!=null) {
                        if(count>bytes.length)throw invalid("DEX declared length exceeded");
                        System.arraycopy(scratch,0,bytes,count-n,n);
                    }
                }
                if(bytes!=null) {
                    if(count!=bytes.length)throw invalid("DEX declared length truncated");
                    indices.put(name,DexIndex.parse(bytes,budget)); // No raw DEX retained by the index.
                }
                zip.closeEntry(); // Entry has already been explicitly bounded and exhausted.
            }
            // ZipInputStream may stop before central-directory/trailing bytes. Any
            // read-ahead was already hashed below it; continue that SAME hash stream.
            while(source.read(scratch)!=-1) { }
            String observed=source.finish();
            if(!expectedHash.equals(observed))throw invalid("whole archive SHA256 mismatch");
            if(indices.isEmpty() || !indices.containsKey("classes.dex"))throw invalid("missing primary DEX");
            for(int i=2;i<=indices.size();i++)if(!indices.containsKey("classes"+i+".dex"))throw invalid("noncontiguous DEX sequence");
            return new RootDexArchiveIndex(observed,indices);
        }
    }

    void require(String entry,int classDefIndex,int typeIndex,String descriptor)throws IOException {
        DexIndex dex=dexes.get(entry);
        if(dex==null)throw invalid("expected DEX absent");
        dex.require(classDefIndex,typeIndex,descriptor);
    }
    int dexCount(){return dexes.size();}

    static final class DexIndex {
        private final int[] typeIndices;
        private final String[] descriptors;
        private DexIndex(int[] indices,String[] descriptors){this.typeIndices=indices;this.descriptors=descriptors;}
        static DexIndex parse(byte[] bytes)throws IOException {return parse(bytes,new IndexBudget());}
        private static DexIndex parse(byte[] bytes,IndexBudget budget)throws IOException {
            if(bytes==null || bytes.length<112 || bytes.length>MAX_DEX_BYTES
                    || !Arrays.equals(Arrays.copyOf(bytes,8),MAGIC))throw invalid("unsupported DEX magic/version");
            if(u32(bytes,32)!=bytes.length || u32(bytes,36)!=112 || u32(bytes,40)!=0x12345678L)
                throw invalid("DEX length/header/endian mismatch");
            int stringCount=count(bytes,56,MAX_STRINGS),strings=table(bytes,60,stringCount,4);
            int typeCount=count(bytes,64,65536),types=table(bytes,68,typeCount,4);
            int classCount=count(bytes,96,MAX_CLASS_DEFS),classes=table(bytes,100,classCount,32);
            budget.classes+=classCount;
            if(budget.classes>MAX_ARCHIVE_CLASSES)throw invalid("archive class index budget exceeded");
            long dataSize=u32(bytes,104),dataOff=u32(bytes,108);
            if(dataOff<112 || (dataOff&3)!=0 || dataSize==0 || dataOff+dataSize!=bytes.length)throw invalid("DEX data range invalid");
            if((long)strings+stringCount*4L>dataOff || (long)types+typeCount*4L>dataOff
                    || (long)classes+classCount*32L>dataOff)throw invalid("DEX index overlaps data");
            if((long)strings+stringCount*4L>types || (long)types+typeCount*4L>classes)
                throw invalid("DEX index tables overlap/out of order");
            int[] indices=new int[classCount];String[] descriptors=new String[classCount];
            boolean[] seen=new boolean[typeCount];
            for(int i=0;i<classCount;i++) {
                long type=u32(bytes,classes+i*32);
                if(type>=typeCount || seen[(int)type])throw invalid("class type index invalid/duplicate");
                seen[(int)type]=true;indices[i]=(int)type;
                long string=u32(bytes,types+(int)type*4);
                if(string>=stringCount)throw invalid("type descriptor string index invalid");
                long offset=u32(bytes,strings+(int)string*4);
                if(offset<dataOff || offset>=bytes.length)throw invalid("descriptor outside DEX data");
                descriptors[i]=descriptor(bytes,(int)offset,budget);
            }
            return new DexIndex(indices,descriptors);
        }
        void require(int classIndex,int typeIndex,String descriptor)throws IOException {
            if(classIndex<0 || classIndex>=typeIndices.length || typeIndex<0 || descriptor==null
                    || typeIndices[classIndex]!=typeIndex || !descriptors[classIndex].equals(descriptor))
                throw invalid("runtime classDef/type/descriptor chain mismatch");
        }
        private static int count(byte[] b,int offset,int max)throws IOException {
            long value=u32(b,offset);if(value==0 || value>max)throw invalid("DEX table count outside bounds");return (int)value;
        }
        private static int table(byte[] b,int offset,int count,int width)throws IOException {
            long value=u32(b,offset),end=value+(long)count*width;
            if(value<112 || (value&3)!=0 || end>b.length)throw invalid("DEX table range invalid");return (int)value;
        }
        private static String descriptor(byte[] b,int offset,IndexBudget budget)throws IOException {
            int cursor=offset;long length=0;boolean terminated=false;
            for(int i=0;i<5;i++) {
                if(cursor>=b.length)throw invalid("truncated ULEB128");int value=b[cursor++]&255;
                if(i==4 && (value&0xf0)!=0)throw invalid("overflow ULEB128");
                length|=(long)(value&127)<<(i*7);
                if((value&128)==0) {if(i>0 && value==0)throw invalid("noncanonical ULEB128");terminated=true;break;}
            }
            if(!terminated || length<3 || length>2048 || cursor+length>=b.length)throw invalid("descriptor length outside bounds");
            budget.chars+=length;
            if(budget.chars>MAX_DESCRIPTOR_CHARS)throw invalid("archive descriptor character budget exceeded");
            char[] chars=new char[(int)length];
            for(int i=0;i<chars.length;i++) {
                int value=b[cursor+i]&255;
                if(value<33 || value>126)throw invalid("descriptor is not exact supported ASCII");chars[i]=(char)value;
            }
            if(b[cursor+chars.length]!=0)throw invalid("descriptor lacks exact NUL termination");
            String text=new String(chars);
            if(!text.matches("L[A-Za-z0-9_$-]+(?:/[A-Za-z0-9_$-]+)*;"))throw invalid("unsupported class descriptor");
            return text;
        }
    }
    private static final class IndexBudget {int classes;long chars;}
    private static long u32(byte[] b,int offset)throws IOException {
        if(offset<0 || offset>b.length-4)throw invalid("DEX u32 out of range");
        return (b[offset]&255L)|((b[offset+1]&255L)<<8)|((b[offset+2]&255L)<<16)|((b[offset+3]&255L)<<24);
    }
    private static IOException invalid(String reason){return new IOException(reason);}
    private static final class HashStream extends InputStream {
        private final InputStream input;private final MessageDigest digest;private long count;private boolean eof,finished;
        HashStream(InputStream input)throws IOException {
            this.input=input;
            try{digest=MessageDigest.getInstance("SHA-256");}catch(NoSuchAlgorithmException e){try{input.close();}catch(IOException ignored){}throw new IOException(e);}
        }
        @Override public int read()throws IOException {byte[] one=new byte[1];return read(one,0,1)==-1?-1:one[0]&255;}
        @Override public int read(byte[] b,int off,int len)throws IOException {
            if(finished)throw invalid("read after hash finalized");
            int n=input.read(b,off,len);
            if(n==-1){eof=true;return -1;}
            count+=n;if(count>MAX_ARCHIVE_BYTES)throw invalid("archive read bound exceeded");digest.update(b,off,n);return n;
        }
        // InputStream.skip uses this class's read; no skipped byte bypasses hash.
        String finish()throws IOException {
            if(!eof || finished)throw invalid("archive hash before EOF or twice");finished=true;
            StringBuilder hex=new StringBuilder(64);for(byte value:digest.digest())hex.append(String.format(java.util.Locale.ROOT,"%02x",value&255));return hex.toString();
        }
        @Override public void close()throws IOException {input.close();}
    }
}
