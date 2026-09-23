package ls.augment.com.hook;

import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

/** Bounded, read-only semantic lookup. Called on a worker, never in a HOME hook. */
final class HomeCandidateDexResolver {
    private static final String FRAGMENT =
            "Lcom/android/permissioncontroller/role/ui/DefaultAppChildFragment;";
    private static final String LIST = "(Landroidx/preference/PreferenceGroup;Ljava/util/List;"
            + "Landroid/util/ArrayMap;Landroid/content/Context;)V";
    private static final String ROLE_LIST = "(Ljava/util/List;)V";
    private static final String APP_FILTER = "(Landroid/content/pm/ApplicationInfo;)Z";
    private static final int MAX_DEX = 64 * 1024 * 1024;

    static final class Target {
        final String owner, name, signature;
        Target(String owner, String name, String signature) {
            this.owner = owner; this.name = name; this.signature = signature;
        }
        String key() { return owner + "->" + name + signature; }
        String className() { return owner.substring(1, owner.length() - 1).replace('/', '.'); }
    }

    static Target find(String[] archives) throws IOException {
        return find(archives, null);
    }

    static Target find(String[] archives, String listName) throws IOException {
        if (archives == null || archives.length == 0 || archives.length > 32)
            throw new IOException("invalid APK set");
        if (listName != null && !listName.equals("addApplicationPreferences")
                && !listName.equals("onRoleChanged")) throw new IOException("unknown HOME list contract");
        List<Target> candidates = new ArrayList<>();
        List<HomeCalls> homeCalls = new ArrayList<>();
        Map<String,Set<String>> filters = new HashMap<>();
        long budget = 0;
        for (String path : archives) try (ZipFile zip = new ZipFile(path)) {
            int dexCount = 0;
            var entries = zip.entries();
            while (entries.hasMoreElements()) {
                ZipEntry entry = entries.nextElement();
                if (!entry.getName().matches("classes(?:[2-9]|[1-9][0-9]+)?\\.dex")) continue;
                if (++dexCount > 32 || entry.getSize() < 112 || entry.getSize() > MAX_DEX
                        || (budget += entry.getSize()) > 256L * 1024 * 1024)
                    throw new IOException("DEX budget exceeded");
                byte[] bytes;
                try (InputStream input = zip.getInputStream(entry)) {
                    bytes = input.readNBytes(MAX_DEX + 1);
                }
                if (bytes.length != entry.getSize()) throw new IOException("DEX length changed");
                new Dex(bytes).collect(candidates, homeCalls, filters, listName);
            }
        }
        Target selected = null;
        for (Target candidate : candidates) for (HomeCalls home : homeCalls) {
            if (!home.calls.contains(candidate.key())) continue;
            // The 15.x list uses the predicate both to qualify third-party apps
            // through an ApplicationInfo filter and to compute its CTS dialog flag.
            if (home.roleList && home.calls.stream().noneMatch(call ->
                    filters.containsKey(call) && filters.get(call).contains(candidate.key()))) continue;
            if (selected != null) throw new IOException("ambiguous HOME qualification methods");
            selected = candidate;
        }
        if (selected == null) throw new IOException("HOME qualification pattern not found");
        return selected;
    }

    private static final class HomeCalls {
        final boolean roleList;
        final Set<String> calls;
        HomeCalls(boolean roleList, Set<String> calls) {this.roleList=roleList;this.calls=calls;}
    }

    private static final class Dex {
        final byte[] data;
        final int stringCount, strings, typeCount, types, protoCount, protos, methodCount, methods;
        final Map<Integer,String> stringCache = new HashMap<>();
        Dex(byte[] data) throws IOException {
            this.data = data;
            range(0,112);
            String magic = new String(data,0,8,StandardCharsets.US_ASCII);
            if (!magic.matches("dex\\n0(35|37|38|39|40)\u0000")
                    || u32(32) != data.length || u32(36) != 112 || u32(40) != 0x12345678)
                throw new IOException("unsupported DEX header");
            stringCount=u32(56); strings=u32(60); table(strings,stringCount,4);
            typeCount=u32(64); types=u32(68); table(types,typeCount,4);
            protoCount=u32(72); protos=u32(76); table(protos,protoCount,12);
            methodCount=u32(88); methods=u32(92); table(methods,methodCount,8);
        }
        void collect(List<Target> candidates, List<HomeCalls> homeCalls,
                Map<String,Set<String>> filters, String listName) throws IOException {
            int count=u32(96), offset=u32(100); table(offset,count,32);
            for (int n=0;n<count;n++) {
                int pos=u32(offset+n*32+24);
                if (pos==0) continue;
                Cursor cursor=new Cursor(pos);
                int statics=cursor.uleb(), instances=cursor.uleb(), direct=cursor.uleb(), virtual=cursor.uleb();
                if ((long)statics+instances>65536 || (long)direct+virtual>methodCount)
                    throw new IOException("invalid class data");
                for (int f=0;f<statics+instances;f++) {cursor.uleb();cursor.uleb();}
                for (int group : new int[]{direct,virtual}) {
                    int index=0;
                    for (int m=0;m<group;m++) {
                        index=Math.addExact(index,cursor.uleb());
                        int access=cursor.uleb(), code=cursor.uleb();
                        Target target=method(index);
                        boolean roleList="onRoleChanged".equals(target.name) && ROLE_LIST.equals(target.signature);
                        boolean home=FRAGMENT.equals(target.owner) && (access&8)==0
                                && (listName==null || listName.equals(target.name))
                                && (roleList || ("addApplicationPreferences".equals(target.name)
                                        && LIST.equals(target.signature)));
                        boolean possible=(access&8)!=0 && "(Ljava/lang/String;)Z".equals(target.signature);
                        boolean filter=(access&8)!=0 && APP_FILTER.equals(target.signature);
                        if (code==0 || (!home && !possible && !filter)) continue;
                        Set<String> literals=new HashSet<>();
                        Set<String> calls=new HashSet<>();
                        code(code,literals,calls);
                        if (home && literals.contains("android.app.role.HOME")) homeCalls.add(new HomeCalls(roleList,calls));
                        if (filter) filters.put(target.key(),calls);
                        // The CTS predicate's meaning, not its obfuscated name or APK hash.
                        if (possible && literals.contains("android.") && literals.contains(".cts.")
                                && literals.contains("persist.sys.stc")) candidates.add(target);
                    }
                }
            }
        }
        void code(int offset, Set<String> literals, Set<String> calls) throws IOException {
            range(offset,16); int size=u32(offset+12), start=offset+16;
            table(start,size,2);
            for (int pc=0;pc<size;) {
                int value=u16(start+pc*2), op=value&255;
                int width=width(value,start,pc,size);
                if (width<1 || width>size-pc) throw new IOException("invalid instruction");
                if (op==0x1a) literals.add(string(u16(start+(pc+1)*2)));
                if (op==0x1b) literals.add(string(u32(start+(pc+1)*2)));
                if (op==0x71 || op==0x77) calls.add(method(u16(start+(pc+1)*2)).key());
                pc+=width;
            }
        }
        int width(int value,int start,int pc,int size) throws IOException {
            int op=value&255;
            if (op==0 && value!=0) {
                if (pc+2>size) throw new IOException("truncated payload");
                int count=u16(start+(pc+1)*2);
                long width;
                if (value==0x100) width=4L+2L*count;
                else if(value==0x200) width=2L+4L*count;
                else if(value==0x300) {
                    if(pc+4>size) throw new IOException("truncated array payload");
                    width=4L+((long)count*u32(start+(pc+2)*2)+1)/2;
                } else throw new IOException("unknown payload");
                if(width>size-pc) throw new IOException("payload overflow");
                return (int)width;
            }
            if(op==0x18)return 5;
            if(op==0xfa||op==0xfb)return 4;
            if(op==3||op==6||op==9||op==0x14||op==0x17||op==0x1b
                    ||(op>=0x24&&op<=0x26)||(op>=0x2a&&op<=0x2c)
                    ||(op>=0x6e&&op<=0x72)||(op>=0x74&&op<=0x78)||op==0xfc||op==0xfd)return 3;
            if(op==2||op==5||op==8||op==0x13||op==0x15||op==0x16||op==0x19
                    ||op==0x1a||op==0x1c||op==0x1f||op==0x20||op==0x22||op==0x23||op==0x29
                    ||(op>=0x2d&&op<=0x3d)||(op>=0x44&&op<=0x6d)
                    ||(op>=0x90&&op<=0xaf)||(op>=0xd0&&op<=0xe2)||op>=0xfe)return 2;
            if(op<=0x12||op==0x1d||op==0x1e||op==0x21||op==0x27||op==0x28
                    ||(op>=0x7b&&op<=0x8f)||(op>=0xb0&&op<=0xcf))return 1;
            throw new IOException("unsupported opcode "+op);
        }
        Target method(int index)throws IOException {
            index(index,methodCount);int pos=methods+index*8;
            int proto=u16(pos+2);index(proto,protoCount);int p=protos+proto*12;
            StringBuilder signature=new StringBuilder("(");int params=u32(p+8);
            if(params!=0){int count=u32(params);table(params+4,count,2);
                if(count>255)throw new IOException("invalid parameters");
                for(int i=0;i<count;i++)signature.append(type(u16(params+4+i*2)));}
            signature.append(')').append(type(u32(p+4)));
            return new Target(type(u16(pos)),string(u32(pos+4)),signature.toString());
        }
        String type(int index)throws IOException {index(index,typeCount);return string(u32(types+index*4));}
        String string(int index)throws IOException {
            index(index,stringCount);String found=stringCache.get(index);if(found!=null)return found;
            Cursor cursor=new Cursor(u32(strings+index*4));cursor.uleb();int start=cursor.pos,end=start;
            while(end<data.length&&data[end]!=0&&end-start<=65536)end++;
            if(end>=data.length||end-start>65536)throw new IOException("invalid string");
            found=new String(data,start,end-start,StandardCharsets.UTF_8);stringCache.put(index,found);return found;
        }
        void index(int index,int count)throws IOException {if(index<0||index>=count)throw new IOException("bad index");}
        void table(int start,int count,int width)throws IOException {
            if(count<0||(long)count*width>data.length)throw new IOException("bad table");range(start,count*width);
        }
        void range(int start,int bytes)throws IOException {
            if(start<0||bytes<0||(long)start+bytes>data.length)throw new IOException("truncated DEX");
        }
        int u16(int pos)throws IOException {range(pos,2);return(data[pos]&255)|((data[pos+1]&255)<<8);}
        int u32(int pos)throws IOException {
            range(pos,4);int result=u16(pos)|(u16(pos+2)<<16);
            if(result<0)throw new IOException("oversized DEX value");return result;
        }
        final class Cursor {
            int pos;Cursor(int pos){this.pos=pos;}
            int uleb()throws IOException {
                long result=0;
                for(int n=0;n<5;n++){range(pos,1);int next=data[pos++]&255;result|=(long)(next&127)<<(7*n);
                    if((next&128)==0){if(result>Integer.MAX_VALUE)break;return(int)result;}}
                throw new IOException("invalid uleb128");
            }
        }
    }
    private HomeCandidateDexResolver() { }
}
