"""Compile the real Android-test ART classification rule; no device or private files are read."""
from pathlib import Path
import json
import os
import subprocess

ROOT = Path(__file__).resolve().parents[1]
JDK = Path(os.environ.get('JAVA_HOME', r'C:/Program Files/Android/openjdk/jdk-21.0.8'))
OUT = ROOT / 'audit-output/total-reset-art-cache-tests'
OUT.mkdir(parents=True, exist_ok=True)
TEST = r'''
package ls.augment.com;
public final class TestTotalResetArtCacheRule {
 static int checks;
 static final String CACHE="/data/user/0/ls.augment.com/cache",PATH="oat_primary/arm64/base.art";
 static final byte[] MAGIC={'a','r','t','\n','1','1','8',0};
 static void check(boolean value,String label){checks++;if(!value)throw new AssertionError(label);}
 static boolean accepts(String root,String path,long reset,long modified,int owner,long links,boolean regular,int mode,long size,byte[] header){
  return TotalResetArtCacheRule.accepts(root,CACHE,path,true,reset,modified,3000,owner,10515,links,regular,mode,size,header);
 }
 public static void main(String[] args){
  check(accepts(CACHE,PATH,1000,2000,10515,1,true,0600,50000,MAGIC),"Fresh actual cache ART accepted");
  for(String root:new String[]{null,CACHE+"x","/data/user/0/ls.augment.com/files","/data/user/0/ls.augment.com/code_cache","/storage/emulated/0/Android/data/ls.augment.com/cache"})
   check(!accepts(root,PATH,1000,2000,10515,1,true,0600,50000,MAGIC),"Same filename outside private cache rejected");
  for(String path:new String[]{null,"base.art","oat_primary/arm/base.art","oat_primary/x86/base.art","oat_primary/arm64/config.json","oat_primary/arm64/base.art.bak","oat_primary/arm64/base.dex","oat_primary/../arm64/base.art","oat_primary/arm64/base.art/extra","oat_primary/arm64/./base.art"})
   check(!accepts(CACHE,path,1000,2000,10515,1,true,0600,50000,MAGIC),"Other paths/extensions/architectures rejected");
  for(long modified:new long[]{0,999,1000,3001})check(!accepts(CACHE,PATH,1000,modified,10515,1,true,0600,50000,MAGIC),"Stale/equal/future date rejected");
  check(!accepts(CACHE,PATH,0,2000,10515,1,true,0600,50000,MAGIC),"Missing reset timestamp rejected");
  check(!accepts(CACHE,PATH,1000,2000,10516,1,true,0600,50000,MAGIC),"Wrong UID rejected");
  check(!accepts(CACHE,PATH,1000,2000,10515,2,true,0600,50000,MAGIC),"Hard link rejected");
  check(!accepts(CACHE,PATH,1000,2000,10515,1,false,0600,50000,MAGIC),"Nonregular/symlink object rejected");
  check(!accepts(CACHE,PATH,1000,2000,10515,1,true,0644,50000,MAGIC),"Unexpected runtime image permissions rejected");
  check(!accepts(CACHE,PATH,1000,2000,10515,1,true,0600,7,MAGIC),"Too-short file rejected");
  check(!accepts(CACHE,PATH,1000,2000,10515,1,true,0600,50000,null),"No header rejected");
  check(!accepts(CACHE,PATH,1000,2000,10515,1,true,0600,50000,new byte[7]),"Truncated header rejected");
  byte[] xml="<?xml ve".getBytes(java.nio.charset.StandardCharsets.UTF_8);
  check(!accepts(CACHE,PATH,1000,2000,10515,1,true,0600,50000,xml),"Fresh configuration renamed to ART rejected");
  for(int index=0;index<8;index++){
   byte[] changed=MAGIC.clone();changed[index]=(byte)(index>=4&&index<=6?'x':'z');
   check(!accepts(CACHE,PATH,1000,2000,10515,1,true,0600,50000,changed),"Wrong ART magic/version/terminator rejected");
  }
  byte[] zero={'a','r','t','\n','0','0','0',0};check(!accepts(CACHE,PATH,1000,2000,10515,1,true,0600,50000,zero),"Invalid all-zero image version rejected");
  check(!TotalResetArtCacheRule.accepts(CACHE,CACHE,PATH,false,1000,2000,3000,10515,10515,1,true,0600,50000,MAGIC),"Non-ARM64 device rejected");
  System.out.println("{\"success\":true,\"assertions\":"+checks+",\"deviceActions\":false}");
 }
}
'''
source = OUT / 'TestTotalResetArtCacheRule.java'
source.write_text(TEST, encoding='utf-8')
rule = ROOT / 'android/app/src/androidTest/java/ls/augment/com/TotalResetArtCacheRule.java'
subprocess.run([str(JDK / 'bin/javac.exe'), '-encoding', 'UTF-8', '-d', str(OUT), str(rule), str(source)], check=True)
result = subprocess.run([str(JDK / 'bin/java.exe'), '-cp', str(OUT), 'ls.augment.com.TestTotalResetArtCacheRule'],
                        capture_output=True, text=True, check=True)
report = json.loads(result.stdout.strip())
(OUT / 'result.json').write_text(json.dumps(report, indent=2), encoding='utf-8')
print(json.dumps(report, indent=2))
