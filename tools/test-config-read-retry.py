"""Execute the production read-only reconnect policy against transient and permanent failures."""
from pathlib import Path
import argparse
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / 'android/app/src/main/java/ls/augment/com/hook/ConfigReadRetry.java'

FIXTURE = r'''package ls.augment.com.hook;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.concurrent.atomic.AtomicInteger;
public final class ConfigReadRetryFixture {
    static int checks;
    static void check(boolean value,String reason){checks++;if(!value)throw new AssertionError(reason);}
    static void retry(Exception first)throws Exception{
        AtomicInteger calls=new AtomicInteger();Object expected=new Object();
        Object result=ConfigReadRetry.read(()->{if(calls.incrementAndGet()==1)throw first;return expected;});
        check(result==expected&&calls.get()==2,"recover one read after "+first.getClass().getName());
    }
    static void reject(Exception failure)throws Exception{
        AtomicInteger calls=new AtomicInteger();
        try{ConfigReadRetry.read(()->{calls.incrementAndGet();throw failure;});throw new AssertionError("failure swallowed");}
        catch(Exception actual){check(actual==failure&&calls.get()==1,"permanent read failure was retried or replaced");}
    }
    public static void main(String[] args)throws Exception{
        retry(new IllegalArgumentException("Unknown authority ls.augment.com.config"));
        retry(new IllegalArgumentException("Unknown authority: ls.augment.com.config"));
        retry(new android.os.DeadObjectException());
        retry(new RuntimeException("transport wrapper",new android.os.DeadObjectException()));
        retry(new FileNotFoundException("No content provider: content://ls.augment.com.config/statusbar-icon/abc"));
        reject(new FileNotFoundException("No content provider: content://other.config/statusbar-icon/abc"));
        reject(new FileNotFoundException("No content provider: content://ls.augment.com.config.evil/icon"));
        reject(new FileNotFoundException("No content provider: content://ls.augment.com.config@evil/icon"));
        reject(new FileNotFoundException("missing artwork"));
        reject(new IOException("hash mismatch"));
        reject(new IllegalArgumentException("Unknown authority private.application"));
        reject(new IllegalArgumentException("Unknown authority ls.augment.com.config trailing payload"));
        reject(new SecurityException("denied",new android.os.DeadObjectException()));
        reject(new RuntimeException("wrapper",new SecurityException("denied",new android.os.DeadObjectException())));
        AtomicInteger calls=new AtomicInteger();Exception second=new android.os.DeadObjectException();
        try{ConfigReadRetry.read(()->{if(calls.incrementAndGet()==1)throw new android.os.DeadObjectException();throw second;});throw new AssertionError("persistent outage swallowed");}
        catch(Exception actual){check(actual==second&&calls.get()==2,"persistent outage retried without bound");}
        String redacted=ConfigReadRetry.failure(new IllegalStateException("PRIVATE_SHELL_PAYLOAD"));
        check(!redacted.contains("PRIVATE_SHELL_PAYLOAD")&&redacted.contains("IllegalStateException"),"diagnostic disclosed payload or lost exception type");
        check(ConfigReadRetry.failure(new SecurityException("private")).startsWith("permission_denied"),"permission rejection lost reason");
        check(ConfigReadRetry.failure(new android.os.DeadObjectException()).startsWith("provider_unavailable"),"dead provider lost unavailable classification");
        calls.set(0);check(ConfigReadRetry.read(()->{calls.incrementAndGet();return null;})==null&&calls.get()==1,"null protocol reply automatically retried");
        System.out.println("PASS production ConfigReadRetry: "+checks+" checks; one read reconnect, strict authority, permanent/security/invalid-data failures, bounded outage and payload redaction");
    }
}'''

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--jdk', type=Path, default=Path('C:/Program Files/Android/openjdk/jdk-21.0.8'))
    args = parser.parse_args()
    with tempfile.TemporaryDirectory(prefix='lsa-config-read-retry-') as temporary:
        folder = Path(temporary)
        files = []
        for name, text in {
            'ls/augment/com/hook/ConfigReadRetry.java': SOURCE.read_text(encoding='utf-8'),
            'ls/augment/com/hook/ConfigReadRetryFixture.java': FIXTURE,
            'android/os/DeadObjectException.java': 'package android.os; public class DeadObjectException extends Exception {}',
        }.items():
            target = folder / name
            target.parent.mkdir(parents=True, exist_ok=True)
            target.write_text(text, encoding='utf-8')
            files.append(str(target))
        suffix = '.exe' if args.jdk.drive else ''
        subprocess.run([str(args.jdk / 'bin' / ('javac' + suffix)), '-encoding', 'UTF-8', '-d', str(folder / 'classes'), *files], check=True)
        subprocess.run([str(args.jdk / 'bin' / ('java' + suffix)), '-cp', str(folder / 'classes'), 'ls.augment.com.hook.ConfigReadRetryFixture'], check=True)

if __name__ == '__main__':
    main()
