package ls.augment.com;

/** Only a freshly generated, verified ARM64 startup image in the private cache is runtime output. */
final class TotalResetArtCacheRule {
    private TotalResetArtCacheRule() { }
    static boolean accepts(String scanRoot,String privateCacheRoot,String relativePath,boolean arm64Device,
            long resetStartedAt,long modifiedAt,long observedAt,int ownerUid,int expectedUid,
            long links,boolean regular,int mode,long size,byte[] header) {
        if(scanRoot==null||!scanRoot.equals(privateCacheRoot)||!arm64Device
                ||!"oat_primary/arm64/base.art".equals(relativePath)
                ||resetStartedAt<=0||modifiedAt<=resetStartedAt||modifiedAt>observedAt
                ||expectedUid<10000||ownerUid!=expectedUid||links!=1||!regular
                ||(mode&0777)!=0600||size<8||header==null||header.length!=8)return false;
        if(header[0]!='a'||header[1]!='r'||header[2]!='t'||header[3]!='\n'||header[7]!=0)return false;
        for(int i=4;i<=6;i++)if(header[i]<'0'||header[i]>'9')return false;
        return header[4]!='0'||header[5]!='0'||header[6]!='0';
    }
}
