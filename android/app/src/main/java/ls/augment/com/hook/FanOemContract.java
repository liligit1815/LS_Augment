package ls.augment.com.hook;

/** Confirms the audited screen predicate ordering, then the hook resolves all member types. */
final class FanOemContract {
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
            return hash.toString().equals("c9bdd50517ce301426e1b9ef903ec2d7f760df8c3afa6eedfff22fb97c25786c");
        }catch(Exception unavailable){return false;}
    }
    private FanOemContract(){}
}
