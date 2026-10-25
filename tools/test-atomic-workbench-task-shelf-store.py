"""Execute production ShelfStore against real temporary files and controlled Unix syscall boundaries.

Serialization, CAS, file bytes, locks, FileDescriptor IO, file fsync and recovery records are
production methods. UID/inode/NOFOLLOW and failure injection are OS doubles; no phone claims.
"""
from pathlib import Path
import os
import runpy
import subprocess
import tempfile

MODELS = runpy.run_path(str(Path(__file__).with_name("test-atomic-workbench-task-models.py")))
ROOT = MODELS["ROOT"]
SYSTEM = {
    "android/content/Context.java": "package android.content;public class Context {public final android.content.pm.PackageManager pm=new android.content.pm.PackageManager();public android.content.pm.PackageManager getPackageManager(){return pm;}}",
    "android/content/pm/ApplicationInfo.java": "package android.content.pm;public class ApplicationInfo{public int uid=10055;public String dataDir;}",
    "android/content/pm/PackageManager.java": "package android.content.pm;public class PackageManager{public final ApplicationInfo info=new ApplicationInfo();public ApplicationInfo getApplicationInfo(String pkg,int flags){if(!pkg.equals(\"ls.augment.com\"))throw new AssertionError(pkg);return info;}}",
    "android/system/ErrnoException.java": "package android.system;public class ErrnoException extends Exception{public final int errno;public ErrnoException(String name,int errno){super(name+\":\"+errno);this.errno=errno;}}",
    "android/system/StructStat.java": "package android.system;public class StructStat{public int st_uid,st_mode;public long st_dev=1,st_ino,st_size,st_nlink=1;}",
    "android/system/OsConstants.java": r'''package android.system;public class OsConstants {
 public static final int O_RDONLY=0,O_WRONLY=1,O_RDWR=2,O_CREAT=64,O_EXCL=128,O_CLOEXEC=256,O_NOFOLLOW=512;
 public static final int ENOENT=2,EEXIST=17,EIO=5;
 public static boolean S_ISREG(int mode){return (mode&0170000)==0100000;}public static boolean S_ISDIR(int mode){return (mode&0170000)==0040000;}
}''',
    "android/system/Os.java": r'''package android.system;
import java.io.*;import java.nio.file.*;import java.util.*;
public class Os {
 public static boolean failWrite,failFileSync,failRename,failDirectorySync,swapOnOpen;public static int fileSyncs,directorySyncs,renames;
 public static final Map<String,StructStat> metadata=new HashMap<>();static final Map<FileDescriptor,Handle> handles=new IdentityHashMap<>();static long next=1;
 static final class Handle{final String path;final RandomAccessFile stream;final long inode,device;Handle(String p,RandomAccessFile s,StructStat st){path=p;stream=s;inode=st.st_ino;device=st.st_dev;}}
 static String key(String p){return new File(p).getAbsolutePath();}
 public static StructStat lstat(String path)throws ErrnoException{String p=key(path);if(!Files.exists(Path.of(p),LinkOption.NOFOLLOW_LINKS))throw new ErrnoException("lstat",2);
  StructStat s=metadata.get(p);if(s==null){s=new StructStat();s.st_ino=next++;s.st_uid=0;s.st_mode=(Files.isDirectory(Path.of(p),LinkOption.NOFOLLOW_LINKS)?0040000|0700:0100000|0600);metadata.put(p,s);}s.st_size=new File(p).length();return s;}
 static StructStat copy(StructStat s){StructStat c=new StructStat();c.st_uid=s.st_uid;c.st_mode=s.st_mode;c.st_ino=s.st_ino;c.st_dev=s.st_dev;c.st_size=s.st_size;c.st_nlink=s.st_nlink;return c;}
 public static StructStat fstat(FileDescriptor fd)throws ErrnoException{Handle h=handles.get(fd);StructStat s=copy(lstat(h.path));s.st_ino=h.inode;s.st_dev=h.device;return s;}
 public static void mkdir(String path,int mode)throws ErrnoException{if(Files.exists(Path.of(path),LinkOption.NOFOLLOW_LINKS))throw new ErrnoException("mkdir",17);try{Files.createDirectory(Path.of(path));lstat(path).st_mode=0040000|mode;}catch(IOException e){throw new ErrnoException("mkdir",5);}}
 public static void chown(String path,int uid,int gid)throws ErrnoException{lstat(path).st_uid=uid;}public static void chmod(String path,int mode)throws ErrnoException{StructStat s=lstat(path);s.st_mode=(s.st_mode&0170000)|mode;}
 public static void fchown(FileDescriptor fd,int uid,int gid)throws ErrnoException{chown(handles.get(fd).path,uid,gid);}public static void fchmod(FileDescriptor fd,int mode)throws ErrnoException{chmod(handles.get(fd).path,mode);}
 public static FileDescriptor open(String path,int flags,int mode)throws ErrnoException{
  Path p=Path.of(key(path));boolean exists=Files.exists(p,LinkOption.NOFOLLOW_LINKS);if(exists&&(flags&OsConstants.O_EXCL)!=0)throw new ErrnoException("open",17);
  if(!exists&&(flags&OsConstants.O_CREAT)==0)throw new ErrnoException("open",2);
  if(exists&&(flags&OsConstants.O_NOFOLLOW)!=0&&((lstat(path).st_mode&0170000)==0120000||Files.isSymbolicLink(p)))throw new ErrnoException("nofollow",40);
  try{if(!exists){Files.createFile(p);lstat(path).st_mode=0100000|mode;}
   if(swapOnOpen&&p.getFileName().toString().equals("task-shelf.json")){swapOnOpen=false;StructStat replacement=copy(lstat(path));replacement.st_ino=next++;metadata.put(key(path),replacement);}
   StructStat s=lstat(path);if(Files.isDirectory(p)){FileDescriptor fd=new FileDescriptor();handles.put(fd,new Handle(p.toString(),null,s));return fd;}
   boolean writable=(flags&(OsConstants.O_WRONLY|OsConstants.O_RDWR))!=0;if(failWrite&&p.getFileName().toString().startsWith("task-shelf-pending-")){failWrite=false;writable=false;}
   RandomAccessFile stream=new RandomAccessFile(p.toFile(),writable?"rw":"r");FileDescriptor fd=stream.getFD();handles.put(fd,new Handle(p.toString(),stream,s));return fd;
  }catch(IOException e){throw new ErrnoException("open",5);}}
 public static void rename(String source,String target)throws ErrnoException{if(failRename){failRename=false;throw new ErrnoException("rename injected",5);}try{
  Files.move(Path.of(source),Path.of(target),StandardCopyOption.REPLACE_EXISTING,StandardCopyOption.ATOMIC_MOVE);metadata.put(key(target),metadata.remove(key(source)));renames++;
 }catch(IOException e){throw new ErrnoException("rename",5);}}
 public static void remove(String path)throws ErrnoException{try{Files.delete(Path.of(path));metadata.remove(key(path));}catch(NoSuchFileException e){throw new ErrnoException("remove",2);}catch(IOException e){throw new ErrnoException("remove",5);}}
 public static void fsync(FileDescriptor fd)throws ErrnoException{Handle h=handles.get(fd);if(h.stream==null){directorySyncs++;if(failDirectorySync){failDirectorySync=false;throw new ErrnoException("directory fsync injected",5);}}
  else {fileSyncs++;if(failFileSync){failFileSync=false;throw new ErrnoException("file fsync injected",5);}try{h.stream.getFD().sync();}catch(IOException e){throw new ErrnoException("file fsync",5);}}}
 public static void close(FileDescriptor fd)throws ErrnoException{Handle h=handles.remove(fd);try{if(h!=null&&h.stream!=null)h.stream.close();}catch(IOException e){throw new ErrnoException("close",5);}}
 public static void cleanup(){for(Handle h:handles.values())if(h.stream!=null)try{h.stream.close();}catch(IOException ignored){}handles.clear();failWrite=failFileSync=failRename=failDirectorySync=swapOnOpen=false;}
}''',
}

TEST = r'''package ls.augment.com;
import android.content.Context;import android.system.*;import java.io.*;import java.nio.file.*;import java.nio.channels.*;import java.util.*;import org.json.*;
import static ls.augment.com.AtomicWorkbenchTaskShelfStore.*;
import ls.augment.com.AtomicWorkbenchTaskShelfStore.Record;
import static ls.augment.com.AtomicWorkbenchTaskOperationRequest.Action.*;
public final class TestTaskShelfStore {
 static int cases,assertions,sequence;static Path base;
 static final String BOOT="a".repeat(32),SESSION="11111111-1111-1111-1111-111111111111",NONCE="e".repeat(32);
 interface Run{void run()throws Exception;}static void check(boolean b,String why){assertions++;if(!b)throw new AssertionError(why);}
 static void reject(Run r)throws Exception{boolean caught=false;try{r.run();}catch(Exception expected){caught=true;}check(caught,"unsafe store operation accepted");}
 static void test(String name,Run r)throws Exception{try{r.run();cases++;System.out.println("PASS task shelf store: "+name);}finally{Os.cleanup();}}
 static String hex(int number){return String.format(java.util.Locale.ROOT,"%032x",number);}
 static AtomicWorkbenchTaskOperationRequest req(int n,AtomicWorkbenchTaskOperationRequest.Action action){
  AtomicWorkbenchTaskIdentity id=new AtomicWorkbenchTaskIdentity(BOOT,hex(1000+n),42+n,42+n,true,10055,0,"same.app/.Base","same.app/.Real",88,"owned-vd","vd-unique");
  return new AtomicWorkbenchTaskOperationRequest(hex(2000+n),action,id,1,SESSION,action==END_TASK?88:0,action==END_TASK?"owned-vd":"Built-in Screen",action==END_TASK?"vd-unique":"local:0",-1,"",hex(3000+n),0,0,1000,6000,action==END_TASK?NONCE:"");
 }
 static Record record(int n,Phase phase,LeaseState lease){return record(req(n,SHELVE),phase,lease);}
 static Record record(AtomicWorkbenchTaskOperationRequest request,Phase phase,LeaseState lease){return new Record(DurableMetadata.fromRequest(request),phase,
  phase==Phase.TERMINAL?Disposition.RELEASED:phase==Phase.COMMITTED?Disposition.SHELVED_REFERENCE:Disposition.WORKSPACE_OWNED,lease,
  lease==LeaseState.NONE?"":hex(4000+request.identity.taskId),phase!=Phase.PREPARED,phase==Phase.PREPARED?-1:0,phase==Phase.PREPARED?"":"Built-in Screen",phase==Phase.PREPARED?"":"local:0");}
 static final class Fixture{final Path data,directory,file;final Context context=new Context();final AtomicWorkbenchTaskShelfStore store;
  Fixture()throws Exception{data=Files.createDirectory(base.resolve("case-"+(++sequence)));directory=data.resolve("files/atomic_workbench");file=directory.resolve("task-shelf.json");context.pm.info.dataDir=data.toString();Os.chown(data.toString(),10055,10055);store=new AtomicWorkbenchTaskShelfStore(context,10055,0);}
  byte[] bytes()throws Exception{return Files.readAllBytes(file);}JSONObject disk()throws Exception{return new JSONObject(Files.readString(file));}
  void write(String text)throws Exception{Files.writeString(file,text);Os.chown(file.toString(),10055,10055);Os.chmod(file.toString(),0600);}
 }
 static ArrayList<Record> records(int start,int count,Phase phase,LeaseState lease){ArrayList<Record> result=new ArrayList<>();for(int n=start;n<start+count;n++)result.add(record(n,phase,lease));return result;}
 public static void main(String[] args)throws Exception{base=Path.of(args[0]);
  test("missing alone is empty and multiple same-package tasks retain independent metadata",()->{Fixture f=new Fixture();check(f.store.read().revision==0&&f.store.read().records.isEmpty(),"missing not revision zero");
   ArrayList<Record> records=records(1,3,Phase.COMMITTED,LeaseState.HELD);var result=f.store.save(0,records);records.clear();var read=f.store.read();
   check(result.revision==1&&result.records.size()==3&&read.records.size()==3,"same package tasks lost");for(int n=1;n<=3;n++)check(read.find(hex(3000+n)).metadata.identity.taskId==42+n,"wrong exact task");
   reject(()->read.records.clear());check(Os.fileSyncs>0&&Os.directorySyncs>0,"durability sync skipped");
  });
  test("CAS is based on current disk across independent instances",()->{Fixture f=new Fixture();var second=new AtomicWorkbenchTaskShelfStore(f.context,10055,0);f.store.update(0,record(1,Phase.PREPARED,LeaseState.NONE));byte[] first=f.bytes();
   reject(()->second.update(0,record(2,Phase.PREPARED,LeaseState.NONE)));check(Arrays.equals(first,f.bytes()),"stale CAS wrote disk");second.update(1,record(2,Phase.PREPARED,LeaseState.NONE));check(f.store.read().revision==2&&f.store.read().records.size()==2,"separate instance lost pending record");
  });
  test("records redact END confirmation and cannot reconstruct executable authorization",()->{Fixture f=new Fixture();f.store.update(0,record(req(1,END_TASK),Phase.PREPARED,LeaseState.NONE));String bytes=Files.readString(f.file);
   check(!bytes.contains("confirmation_nonce")&&!bytes.contains(NONCE)&&!bytes.contains("IBinder")&&!bytes.contains("content://"),"authorization/payload persisted");
   Record read=f.store.read().records.get(0);check(read.metadata.action==END_TASK&&read.metadata.identity.taskId==43,"durable END metadata missing");
   for(var m:DurableMetadata.class.getDeclaredMethods())check(!m.getReturnType().equals(AtomicWorkbenchTaskOperationRequest.class),"disk metadata can mint authorization");
  });
  test("ordinary uid1000 task metadata persists without granting APP type authority",()->{Fixture f=new Fixture();var r=req(1,SHELVE);var id=new AtomicWorkbenchTaskIdentity(BOOT,hex(1001),43,43,true,1000,0,"zte.com.cn.alarmclock/.Main","zte.com.cn.alarmclock/.Main",88,"owned-vd","vd-unique");
   var request=new AtomicWorkbenchTaskOperationRequest(r.operationId,r.action,id,1,SESSION,0,"Built-in Screen","local:0",-1,"",r.shelfId,0,0,1000,6000,"");f.store.update(0,record(request,Phase.PREPARED,LeaseState.NONE));check(f.store.read().records.get(0).metadata.identity.uid==1000,"uid1000 durable task rejected");
  });
  test("actual descriptor write failure preserves old bytes and rejects preparation",()->{Fixture f=new Fixture();f.store.update(0,record(1,Phase.PREPARED,LeaseState.NONE));byte[] before=f.bytes();Os.failWrite=true;
   boolean caught=false;try{f.store.update(1,record(2,Phase.PREPARED,LeaseState.NONE));}catch(SaveException e){caught=true;check(!e.replacementVisible,"write failure marked replacement");}
   check(caught&&Arrays.equals(before,f.bytes())&&f.store.read().revision==1,"actual write failure erased old responsibility");
  });
  test("file fsync failure preserves old bytes and reports no replacement",()->{Fixture f=new Fixture();f.store.update(0,record(1,Phase.PREPARED,LeaseState.NONE));byte[] before=f.bytes();Os.failFileSync=true;
   boolean caught=false;try{f.store.update(1,record(2,Phase.PREPARED,LeaseState.NONE));}catch(SaveException e){caught=true;check(!e.replacementVisible,"file sync marked rename");}
   check(caught&&Arrays.equals(before,f.bytes())&&f.store.read().revision==1,"file sync error silently committed");
  });
  test("rename failure retains PREPARED record after external mutation",()->{Fixture f=new Fixture();f.store.update(0,record(1,Phase.PREPARED,LeaseState.NONE));byte[] prepared=f.bytes();Os.failRename=true;
   boolean caught=false;try{f.store.update(1,record(1,Phase.COMMITTED,LeaseState.HELD));}catch(SaveException e){caught=true;check(!e.replacementVisible,"failed rename certified");}
   check(caught&&Arrays.equals(prepared,f.bytes()),"failed commit erased prepared original");var read=f.store.read();check(read.revision==1&&read.records.get(0).phase==Phase.PREPARED,"failure responsibility not queryable");
   check(Files.list(f.directory).noneMatch(p->p.getFileName().toString().startsWith("task-shelf-pending-")),"failed temporary file left behind");
  });
  test("directory fsync failure retains visible replacement and requires query",()->{Fixture f=new Fixture();f.store.update(0,record(1,Phase.PREPARED,LeaseState.NONE));Os.failDirectorySync=true;
   boolean caught=false;try{f.store.update(1,record(1,Phase.COMMITTED,LeaseState.HELD));}catch(SaveException e){caught=true;check(e.replacementVisible,"post rename uncertainty lost");}
   var read=f.store.read();check(caught&&read.revision==2&&read.records.get(0).leaseState==LeaseState.HELD,"uncertain committed lease discarded");
   byte[] actual=f.bytes();reject(()->f.store.update(1,record(1,Phase.COMMITTED,LeaseState.HELD)));check(Arrays.equals(actual,f.bytes()),"stale retry repeated write");
  });
  test("64 shelves plus 16 pending is bounded and never evicts unknowns",()->{Fixture f=new Fixture();ArrayList<Record> all=records(1,64,Phase.COMMITTED,LeaseState.HELD);all.addAll(records(100,16,Phase.VERIFY_PENDING,LeaseState.UNKNOWN));f.store.save(0,all);byte[] before=f.bytes();
   all.add(record(200,Phase.PREPARED,LeaseState.NONE));reject(()->f.store.save(1,all));check(Arrays.equals(before,f.bytes())&&f.store.read().records.size()==80,"capacity evicted unknown task");
   all.remove(all.size()-1);all.remove(0);all.add(record(300,Phase.COMMITTED,LeaseState.HELD));reject(()->f.store.save(1,all));check(Arrays.equals(before,f.bytes()),"active shelf silently evicted");
  });
  test("individual shelf and pending caps refuse before disk mutation",()->{Fixture f=new Fixture();reject(()->f.store.save(0,records(1,65,Phase.COMMITTED,LeaseState.HELD)));reject(()->f.store.save(0,records(1,17,Phase.PREPARED,LeaseState.NONE)));check(!Files.exists(f.file),"over limit created file");
  });
  test("unknown responsibility cannot be removed dropped or replaced by another op",()->{Fixture f=new Fixture();var original=record(1,Phase.VERIFY_PENDING,LeaseState.UNKNOWN);f.store.update(0,original);byte[] before=f.bytes();
   reject(()->f.store.remove(1,original.shelfId));reject(()->f.store.save(1,List.of()));
   var r=req(1,SHELVE);var switched=new AtomicWorkbenchTaskOperationRequest(hex(9999),r.action,r.identity,r.sourceSlot,r.sourceWindowSession,r.targetDisplayId,r.targetDisplayName,r.targetDisplayUnique,r.targetSlot,r.targetWindowSession,r.shelfId,1,0,1000,6000,"");
   reject(()->f.store.update(1,record(switched,Phase.PREPARED,LeaseState.NONE)));check(Arrays.equals(before,f.bytes()),"unknown responsibility overwritten");
  });
  test("same operation id cannot switch its durable action or equality metadata",()->{Fixture f=new Fixture();var r=req(1,SHELVE);f.store.update(0,record(r,Phase.PREPARED,LeaseState.NONE));byte[] before=f.bytes();
   var switched=new AtomicWorkbenchTaskOperationRequest(r.operationId,MOVE_OUT,r.identity,r.sourceSlot,r.sourceWindowSession,r.targetDisplayId,r.targetDisplayName,r.targetDisplayUnique,r.targetSlot,r.targetWindowSession,r.shelfId,0,0,1000,6000,"");
   reject(()->f.store.update(1,record(switched,Phase.PREPARED,LeaseState.NONE)));check(Arrays.equals(before,f.bytes()),"same op action was rebound");
  });
  test("known released terminal may be explicitly removed with CAS",()->{Fixture f=new Fixture();var r=record(1,Phase.TERMINAL,LeaseState.RELEASED);f.store.update(0,r);var next=f.store.remove(1,r.shelfId);check(next.revision==2&&f.store.read().records.isEmpty(),"safe terminal removal failed");
  });
  test("duplicate shelf operation or live generation fails and preserves disk",()->{Fixture f=new Fixture();Record one=record(1,Phase.PREPARED,LeaseState.NONE);f.store.update(0,one);byte[] before=f.bytes();reject(()->f.store.save(1,List.of(one,one)));
   var a=req(1,SHELVE);var b=req(2,SHELVE);var sameOp=new AtomicWorkbenchTaskOperationRequest(a.operationId,b.action,b.identity,b.sourceSlot,b.sourceWindowSession,b.targetDisplayId,b.targetDisplayName,b.targetDisplayUnique,b.targetSlot,b.targetWindowSession,b.shelfId,0,0,1000,6000,"");
   reject(()->f.store.save(1,List.of(one,record(sameOp,Phase.PREPARED,LeaseState.NONE))));
   var sameTask=new AtomicWorkbenchTaskOperationRequest(b.operationId,b.action,a.identity,b.sourceSlot,b.sourceWindowSession,b.targetDisplayId,b.targetDisplayName,b.targetDisplayUnique,b.targetSlot,b.targetWindowSession,b.shelfId,0,0,1000,6000,"");
   reject(()->f.store.save(1,List.of(one,record(sameTask,Phase.PREPARED,LeaseState.NONE))));check(Arrays.equals(before,f.bytes()),"duplicate data replaced original");
  });
  test("bad old unknown duplicate and coercible JSON is preserved rather than empty",()->{Fixture f=new Fixture();f.store.update(0,record(1,Phase.PREPARED,LeaseState.NONE));String original=Files.readString(f.file);ArrayList<String> bad=new ArrayList<>();
   bad.add("{}");bad.add("");bad.add("[]");bad.add(original+" garbage");bad.add(original.substring(0,original.length()-1)+",}");
   bad.add(original.replace("\"schema\":1","\"schema\":0"));bad.add(original.replaceFirst("\\{","{\"schema\":1,"));bad.add(original.replace("\"dispatched\":false","\"dispatched\":\"false\""));
   bad.add(new JSONObject(original).put("revision",1.5).toString());bad.add(new JSONObject(original).put("owner_uid",10099).toString());
   bad.add(new JSONObject(original).put("credential","secret").toString());bad.add(new JSONObject(original).put("records",new JSONArray().put(f.disk().getJSONArray("records").getJSONObject(0)).put(f.disk().getJSONArray("records").getJSONObject(0))).toString());
   bad.add(original.replace("\"source_slot\":1","\"source_slot\":4294967297"));bad.add(original.replace("\"revision\":1","\"revision\":9223372036854775808"));
   for(String text:bad){f.write(text);byte[] before=f.bytes();reject(f.store::read);reject(()->f.store.save(0,List.of()));check(Arrays.equals(before,f.bytes()),"corruption was removed or overwritten");}
  });
  test("stored over-limit arrays are rejected without truncation",()->{Fixture f=new Fixture();f.store.update(0,record(1,Phase.PREPARED,LeaseState.NONE));JSONObject json=f.disk();JSONArray records=new JSONArray();JSONObject one=json.getJSONArray("records").getJSONObject(0);for(int i=0;i<81;i++)records.put(one);json.put("records",records);f.write(json.toString());byte[] before=f.bytes();reject(f.store::read);check(Arrays.equals(before,f.bytes()),"oversized record truncated");
  });
  test("owner mode hardlinks and symlink stat never become empty state",()->{Fixture f=new Fixture();f.store.update(0,record(1,Phase.PREPARED,LeaseState.NONE));byte[] before=f.bytes();StructStat stat=Os.lstat(f.file.toString());
   stat.st_uid=10099;reject(f.store::read);stat.st_uid=10055;stat.st_nlink=2;reject(f.store::read);stat.st_nlink=1;stat.st_mode=0100000|0644;reject(f.store::read);stat.st_mode=0120000|0600;reject(f.store::read);stat.st_mode=0100000|0600;
   check(Arrays.equals(before,f.bytes())&&f.store.read().revision==1,"unsafe private file modified");
  });
  test("pinned private directory inode and fd race identities are checked",()->{Fixture f=new Fixture();f.store.update(0,record(1,Phase.PREPARED,LeaseState.NONE));byte[] before=f.bytes();Os.swapOnOpen=true;reject(f.store::read);check(Arrays.equals(before,f.bytes()),"open race changed bytes");
   Os.lstat(f.directory.toString()).st_ino+=50000;reject(f.store::read);reject(()->f.store.update(1,record(2,Phase.PREPARED,LeaseState.NONE)));check(Arrays.equals(before,f.bytes()),"directory replacement wrote new path");
  });
  test("independent actual file lock refuses parallel disk operation",()->{Fixture f=new Fixture();f.store.update(0,record(1,Phase.PREPARED,LeaseState.NONE));byte[] before=f.bytes();Path lock=f.directory.resolve("task-shelf.lock");
   try(RandomAccessFile stream=new RandomAccessFile(lock.toFile(),"rw");FileLock held=stream.getChannel().lock()){reject(f.store::read);reject(()->f.store.update(1,record(2,Phase.PREPARED,LeaseState.NONE)));}
   check(Arrays.equals(before,f.bytes())&&f.store.read().records.size()==1,"lock conflict lost data");
  });
  test("cross-user construction and durable records are rejected",()->{Fixture f=new Fixture();reject(()->new AtomicWorkbenchTaskShelfStore(f.context,1010055,10));
   f.context.pm.info.uid=1010055;reject(()->new AtomicWorkbenchTaskShelfStore(f.context,1010055,0));f.context.pm.info.uid=10055;
   var r=req(1,SHELVE);var other=new AtomicWorkbenchTaskIdentity(BOOT,hex(999),43,43,true,1010055,10,"same.app/.Base","same.app/.Real",88,"owned-vd","vd-unique");
   var request=new AtomicWorkbenchTaskOperationRequest(r.operationId,r.action,other,1,SESSION,0,"Built-in Screen","local:0",-1,"",r.shelfId,0,0,1000,6000,"");reject(()->f.store.update(0,record(request,Phase.PREPARED,LeaseState.NONE)));check(!Files.exists(f.file),"other user record stored");
  });
  test("record states retain lease metadata and cannot terminalize unknown ownership",()->{var metadata=DurableMetadata.fromRequest(req(1,SHELVE));
   reject(()->new Record(metadata,Phase.TERMINAL,Disposition.ENDED,LeaseState.UNKNOWN,hex(1),true,0,"Built-in Screen","local:0"));
   reject(()->new Record(metadata,Phase.COMMITTED,Disposition.SHELVED_REFERENCE,LeaseState.HELD,"",true,0,"Built-in Screen","local:0"));
   reject(()->new Record(metadata,Phase.PREPARED,Disposition.WORKSPACE_OWNED,LeaseState.NONE,"",true,-1,"",""));
  });
  System.out.println("TASK SHELF STORE RESULT "+cases+" cases; "+assertions+" assertions");
 }
}'''


ALIAS_TEST = r'''package ls.augment.com;
import android.content.Context;import android.system.*;import java.io.*;import java.nio.file.*;import java.util.*;
import static ls.augment.com.TestTaskShelfStore.*;
import static ls.augment.com.AtomicWorkbenchTaskShelfStore.*;
public final class TestTaskShelfAlias {
 static Context context(Path root)throws Exception{Context c=new Context();c.pm.info.dataDir=root.toString();return c;}
 static AtomicWorkbenchTaskShelfStore open(Context c)throws Exception{return new AtomicWorkbenchTaskShelfStore(c,10055,0);}
 public static void main(String[] args)throws Exception{
  Path real=Path.of(args[0]),alias=Path.of(args[1]),leaf=Path.of(args[2]),childFiles=Path.of(args[3]),outsideFiles=Path.of(args[4]),childStore=Path.of(args[5]),outsideStore=Path.of(args[6]);
  test("real ancestor alias reopens the same existing records and revision with CAS",()->{
   Os.chown(real.toString(),10055,10055);Context canonical=context(real);var seed=open(canonical);seed.update(0,record(1,Phase.PREPARED,LeaseState.NONE));
   byte[] before=Files.readAllBytes(real.resolve("files/atomic_workbench/task-shelf.json"));
   check(Files.isSameFile(alias,real),"real filesystem alias does not name the same directory");
   check(!alias.toFile().getCanonicalFile().equals(alias.toFile().getAbsoluteFile()),"fixture did not create a real canonical alias");
   final AtomicWorkbenchTaskShelfStore throughAlias;
   try{throughAlias=open(context(alias));}catch(Exception failure){throw new AssertionError("alias normalization did not open original store",failure);}
   var initial=throughAlias.read();check(initial.revision==1&&initial.records.size()==1&&initial.find(hex(3001))!=null,"alias silently opened an empty or different store");
   reject(()->throughAlias.update(0,record(2,Phase.PREPARED,LeaseState.NONE)));check(Arrays.equals(before,Files.readAllBytes(real.resolve("files/atomic_workbench/task-shelf.json"))),"alias stale CAS changed original bytes");
   throughAlias.update(1,record(2,Phase.PREPARED,LeaseState.NONE));var reopened=open(canonical).read();
   check(reopened.revision==2&&reopened.records.size()==2&&reopened.find(hex(3001))!=null&&reopened.find(hex(3002))!=null,"canonical reopen lost alias CAS records");
  });
  test("PM root leaf link remains rejected before child creation",()->{
   Os.linkLeaves.add(leaf.toFile().getAbsolutePath());byte[] before=Files.readAllBytes(real.resolve("files/atomic_workbench/task-shelf.json"));
   reject(()->open(context(leaf)));check(Arrays.equals(before,Files.readAllBytes(real.resolve("files/atomic_workbench/task-shelf.json"))),"root leaf link modified target store");
  });
  test("PM root owner and non-directory cannot be normalized into permission",()->{
   Os.chown(real.toString(),10099,10099);reject(()->open(context(alias)));Os.chown(real.toString(),10055,10055);
   Path file=real.getParent().resolve("not-a-directory");Files.writeString(file,"root file");Os.chown(file.toString(),10055,10055);reject(()->open(context(file)));
   Context wrong=context(real);wrong.pm.info.uid=10099;reject(()->open(wrong));reject(()->new AtomicWorkbenchTaskShelfStore(context(real),10055,1));
  });
  test("resolved root must retain directory type owner device and inode of PM original",()->{
   byte[] before=Files.readAllBytes(real.resolve("files/atomic_workbench/task-shelf.json"));
   for(int fault=1;fault<=4;fault++){Os.resolvedRoot=real.toFile().getCanonicalPath();Os.canonicalRootFault=fault;reject(()->open(context(alias)));Os.canonicalRootFault=0;}
   check(Arrays.equals(before,Files.readAllBytes(real.resolve("files/atomic_workbench/task-shelf.json"))),"root identity fault changed existing records");
  });
  test("child files and store links never borrow an outside same-UID directory",()->{
   for(Path[] pair:new Path[][]{{childFiles,outsideFiles},{childStore,outsideStore}}){Path root=pair[0],outside=pair[1];
    Os.chown(root.toString(),10055,10055);if(Files.isDirectory(root.resolve("files"),LinkOption.NOFOLLOW_LINKS)&&root.equals(childStore))Os.chown(root.resolve("files").toString(),10055,10055);
    Path link=root.equals(childFiles)?root.resolve("files"):root.resolve("files/atomic_workbench");Os.linkLeaves.add(link.toFile().getAbsolutePath());
    Os.chown(outside.toString(),10055,10055);byte[] before=Files.readAllBytes(outside.resolve("sentinel"));reject(()->open(context(root)));
    check(Arrays.equals(before,Files.readAllBytes(outside.resolve("sentinel")))&&!Files.exists(outside.resolve("task-shelf.json")),"child link changed outside original bytes");
   }
  });
  test("alias-derived store retains the original pinned child directory identity",()->{
   var store=open(context(alias));Path directory=real.resolve("files/atomic_workbench"),file=directory.resolve("task-shelf.json");byte[] before=Files.readAllBytes(file);
   Os.lstat(directory.toString()).st_ino+=50000;reject(store::read);reject(()->store.update(2,record(3,Phase.PREPARED,LeaseState.NONE)));
   check(Arrays.equals(before,Files.readAllBytes(file)),"replaced alias child directory accepted a write");
  });
  System.out.println("TASK SHELF ALIAS RESULT "+cases+" cases; "+assertions+" assertions");
 }
}'''


def directory_alias(alias, target, workspace):
    workspace = workspace.resolve()
    if not alias.parent.resolve().is_relative_to(workspace) or not target.resolve().is_relative_to(workspace):
        raise AssertionError("alias fixture escaped its temporary workspace")
    try:
        alias.symlink_to(target, target_is_directory=True)
        kind = "directory symlink"
    except OSError:
        if os.name != "nt":
            raise
        environment = dict(os.environ, DUO_SHELF_ALIAS=str(alias), DUO_SHELF_TARGET=str(target))
        subprocess.run(["powershell.exe", "-NoLogo", "-NoProfile", "-NonInteractive", "-Command",
                        "$ErrorActionPreference='Stop'; New-Item -ItemType Junction -Path $env:DUO_SHELF_ALIAS -Target $env:DUO_SHELF_TARGET | Out-Null"],
                       env=environment, check=True, capture_output=True, timeout=15)
        kind = "NTFS junction"
    if alias.resolve() != target.resolve():
        raise AssertionError("real alias target mismatch")
    return kind


def remove_directory_alias(alias, target, kind, workspace):
    # Remove only the verified link itself. No shell performs recursive cleanup or receives discovered paths.
    workspace = workspace.resolve()
    if not alias.parent.resolve().is_relative_to(workspace) or not target.resolve().is_relative_to(workspace) or alias.resolve() != target.resolve():
        raise AssertionError("refusing cleanup outside the verified temporary workspace")
    if kind == "NTFS junction":
        os.rmdir(alias)
    else:
        alias.unlink()


def canonical_ancestor_alias(real_parent, workspace):
    if os.name != "nt":
        return None
    import ctypes
    api = ctypes.windll.kernel32.GetShortPathNameW
    api.argtypes = [ctypes.c_wchar_p, ctypes.c_wchar_p, ctypes.c_uint]
    api.restype = ctypes.c_uint
    buffer = ctypes.create_unicode_buffer(32768)
    count = api(str(real_parent), buffer, len(buffer))
    if not count or count >= len(buffer):
        raise RuntimeError("real Windows 8.3 ancestor alias unavailable")
    alias = Path(buffer.value)
    if str(alias).lower() == str(real_parent).lower() or alias.resolve() != real_parent.resolve() or not alias.resolve().is_relative_to(workspace.resolve()):
        raise AssertionError("8.3 fixture is not a distinct same-object ancestor within its workspace")
    print("PASS real ancestor alias fixture: native Windows 8.3 path; Java File canonicalization is asserted in the actual runner")
    return alias


def alias_regression(store_source=None, expect_failure=None):
    jars = list((Path.home() / ".gradle/caches/modules-2/files-2.1/org.json/json").glob("*/*/*.jar"))
    if not jars:
        raise RuntimeError("local org.json jar is required")
    sources = dict(SYSTEM)
    # Real File canonicalization and disk IO; only Unix UID/stat/reparse type facts remain controlled.
    os_source = sources["android/system/Os.java"].replace(
        "static String key(String p){return new File(p).getAbsolutePath();}",
        '''public static final Set<String> linkLeaves=new HashSet<>();public static String resolvedRoot;public static int canonicalRootFault;
 static String key(String p){File f=new File(p).getAbsoluteFile();if(linkLeaves.contains(f.getPath()))return f.getPath();try{return f.getCanonicalPath();}catch(IOException e){throw new IllegalStateException(e);}}''').replace(
        's.st_size=new File(p).length();return s;',
        '''s.st_size=new File(p).length();if(linkLeaves.contains(new File(path).getAbsolutePath()))s.st_mode=0120000|0700;
  if(canonicalRootFault!=0&&new File(path).getAbsolutePath().equals(resolvedRoot)){s=copy(s);if(canonicalRootFault==1)s.st_mode=0100000|0600;else if(canonicalRootFault==2)s.st_uid=10099;else if(canonicalRootFault==3)s.st_dev++;else s.st_ino++;}return s;''').replace(
        "public static void cleanup(){", "public static void cleanup(){linkLeaves.clear();resolvedRoot=null;canonicalRootFault=0;")
    if os_source == sources["android/system/Os.java"]:
        raise AssertionError("alias stat adapter did not attach")
    sources["android/system/Os.java"] = os_source
    sources["android/os/Bundle.java"] = MODELS["BUNDLE"]
    sources["ls/augment/com/TestTaskShelfStore.java"] = TEST
    sources["ls/augment/com/TestTaskShelfAlias.java"] = ALIAS_TEST
    production = MODELS["PRODUCTION"] + ["AtomicWorkbenchTaskShelfStore.java", "AtomicWorkbenchRecoveryScope.java"]
    if store_source is not None:
        production.remove("AtomicWorkbenchTaskShelfStore.java")
        sources["ls/augment/com/AtomicWorkbenchTaskShelfStore.java"] = store_source
    with tempfile.TemporaryDirectory(prefix="duo-shelf-alias-") as temporary:
        work = Path(temporary).resolve(); links = []
        real_parent = work / "real"; real_parent.mkdir(); real = real_parent / "app"; real.mkdir()
        ancestor = work / "ancestor"; leaf = work / "leaf"
        child_files = work / "child-files"; child_files.mkdir()
        child_store = work / "child-store"; (child_store / "files").mkdir(parents=True)
        outside_files = work / "outside-files"; outside_files.mkdir(); (outside_files / "sentinel").write_bytes(b"outside files untouched")
        outside_store = work / "outside-store"; outside_store.mkdir(); (outside_store / "sentinel").write_bytes(b"outside store untouched")
        try:
            canonical_alias = canonical_ancestor_alias(real_parent, work)
            pairs = [(leaf, real), (child_files / "files", outside_files), (child_store / "files/atomic_workbench", outside_store)]
            if canonical_alias is None:
                pairs.insert(0, (ancestor, real_parent))
                canonical_alias = ancestor
            for link, target in pairs:
                kind = directory_alias(link, target, work); links.append((link, target, kind)); print("PASS real alias fixture:", kind)
            result = MODELS["compile_run"](work / "compiled", sources, production, "ls.augment.com.TestTaskShelfAlias",
                (real, canonical_alias / "app", leaf, child_files, outside_files, child_store, outside_store), str(jars[0]), capture=True)
            print(result.stdout.decode("utf-8", errors="replace"), end="")
            if expect_failure is None:
                if result.returncode:
                    raise AssertionError(result.stderr.decode("utf-8", errors="replace"))
            elif result.returncode == 0 or b"AssertionError" not in result.stderr or expect_failure.encode() not in result.stderr:
                raise AssertionError("compiled alias negative did not reach required runtime assertion: " + result.stderr.decode("utf-8", errors="replace"))
            if result.returncode:
                print(result.stderr.decode("utf-8", errors="replace"), end="")
        finally:
            for link, target, kind in reversed(links):
                remove_directory_alias(link, target, kind, work)


def main():
    jars = list((Path.home() / ".gradle/caches/modules-2/files-2.1/org.json/json").glob("*/*/*.jar"))
    if not jars:
        raise RuntimeError("local org.json jar is required")
    sources = dict(SYSTEM)
    sources["android/os/Bundle.java"] = MODELS["BUNDLE"]
    sources["ls/augment/com/TestTaskShelfStore.java"] = TEST
    production = MODELS["PRODUCTION"] + ["AtomicWorkbenchTaskShelfStore.java", "AtomicWorkbenchRecoveryScope.java"]
    with tempfile.TemporaryDirectory(prefix="duo-task-shelf-") as temporary:
        work = Path(temporary)
        data = work / "cases"
        data.mkdir()
        MODELS["compile_run"](work / "base", sources, production, "ls.augment.com.TestTaskShelfStore", (data,), str(jars[0]))
        controls = [
            ('expected!=previous.revision', 'false'),
            ('if(records.size()>MAX_RECORDS)', 'if(false)'),
            ('pending>MAX_PENDING || shelvesCount>MAX_SHELVES', 'false'),
            ('if(replacement==null && old.hasResponsibility())', 'if(false)'),
            ('|| !operations.add(r.operationId)', ''),
            ('|| !tasks.add(r.metadata.identity.serverBootGeneration+":"+r.metadata.identity.taskGeneration)', ''),
            ('new StrictJson(text).validate();', ''),
            ('stat.st_nlink!=1', 'false'),
            ('(stat.st_mode&0077)!=0', 'false'),
            ('before.st_dev!=opened.st_dev || before.st_ino!=opened.st_ino', 'false'),
            ('output.flush(); Os.fsync(fd);', 'output.flush();'),
            ('checkDirectory(); syncDirectory();', 'checkDirectory();'),
            ('&& !old.metadata.sameOperation(replacement.metadata)', '&& false'),
        ]
        # The array-size guard also exists in the strict parser/read path; test a dedicated
        # mutation that raises that bound too so the capacity negative remains meaningful.
        controls.pop(1)
        for index, (old, new) in enumerate(controls):
            negative_data = work / f"negative-data-{index}"
            negative_data.mkdir()
            result = MODELS["compile_run"](work / f"negative-{index}", sources, production,
                "ls.augment.com.TestTaskShelfStore", (negative_data,), str(jars[0]),
                {"ls/augment/com/AtomicWorkbenchTaskShelfStore.java": (old, new)}, capture=True)
            if result.returncode == 0:
                raise AssertionError("negative control escaped: " + old)
            if b"AssertionError" not in result.stderr:
                raise AssertionError("negative control did not fail a runtime assertion: " + result.stderr.decode(errors="replace"))
            print("PASS ShelfStore production negative control:", index + 1, old)
        print(f"TASK SHELF STORE NEGATIVE CONTROLS {len(controls)} passed")
    alias_regression()
    source = (MODELS["SRC"] / "AtomicWorkbenchTaskShelfStore.java").read_text(encoding="utf-8")
    gate = "dataDirectory=reportedDataDirectory.getCanonicalFile();"
    if source.count(gate) != 1:
        raise AssertionError("canonical normalization negative no longer targets one production assignment")
    alias_regression(source.replace(gate, "dataDirectory=reportedDataDirectory;"),
                     "alias normalization did not open original store")
    print("PASS ShelfStore compiled alias negative: deleted canonical normalization fails actual constructor assertion")


if __name__ == "__main__":
    main()
