package ls.augment.com.hook;

/** Audited NX819J OEM code; resource/signing changes cannot alter the screen predicate order. */
final class FanOemContract {
    private static final String[] CODE_HASHES={
        "710fea361d6aaad46061c3c407ebf6726a7aa35d0567d91f43d33df3dceb8d41",
        "0c16d48a339ded48f16bdb3408ec9f7cb3618952f8424f23e37ad0f611560a0a"
    };
    static boolean screenGate(String source) {
        if(source==null)return false;
        try {
            java.io.File file=new java.io.File(source);
            if(file.length()<1||file.length()>64*1024*1024)return false;
            java.security.MessageDigest digest=java.security.MessageDigest.getInstance("SHA-256");
            try(java.io.InputStream input=new java.io.FileInputStream(file)) {
                byte[] buffer=new byte[65536];int n;
                while((n=input.read(buffer))>=0)if(n>0)digest.update(buffer,0,n);
            }
            StringBuilder hash=new StringBuilder();for(byte b:digest.digest())hash.append(String.format(java.util.Locale.ROOT,"%02x",b&255));
            if(hash.toString().equals("c9bdd50517ce301426e1b9ef903ec2d7f760df8c3afa6eedfff22fb97c25786c"))return true;
            // The complete executable DEX set must match, not just names/signatures.
            // Reject duplicate, additional, missing or changed code; bound decompression.
            try(java.util.zip.ZipFile zip=new java.util.zip.ZipFile(file)) {
                boolean[] seen=new boolean[CODE_HASHES.length];
                java.util.Enumeration<? extends java.util.zip.ZipEntry> entries=zip.entries();
                while(entries.hasMoreElements()) {
                    java.util.zip.ZipEntry entry=entries.nextElement();
                    if(!entry.getName().endsWith(".dex"))continue;
                    int index="classes.dex".equals(entry.getName())?0:"classes2.dex".equals(entry.getName())?1:-1;
                    if(index<0||seen[index]||entry.getSize()<1||entry.getSize()>16*1024*1024)return false;
                    seen[index]=true;digest.reset();long total=0;
                    try(java.io.InputStream input=zip.getInputStream(entry)) {
                        byte[] buffer=new byte[65536];int n;
                        while((n=input.read(buffer))!=-1) {
                            total+=n;if(total>16*1024*1024)return false;
                            digest.update(buffer,0,n);
                        }
                    }
                    if(total!=entry.getSize())return false;
                    hash.setLength(0);
                    for(byte b:digest.digest())hash.append(String.format(java.util.Locale.ROOT,"%02x",b&255));
                    if(!CODE_HASHES[index].contentEquals(hash))return false;
                }
                for(boolean present:seen)if(!present)return false;
                return true;
            }
        }catch(Exception unavailable){return false;}
    }
    private FanOemContract(){}
}
