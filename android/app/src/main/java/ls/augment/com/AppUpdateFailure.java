package ls.augment.com;

import java.io.IOException;
import java.net.UnknownHostException;
import java.net.SocketTimeoutException;
import javax.net.ssl.SSLException;

/** Classified at the failing operation; never guess disk-full from a generic IOException. */
final class AppUpdateFailure extends IOException {
    final String category, reason;
    AppUpdateFailure(String category, String reason, Throwable cause) {
        super(reason, cause); this.category=category; this.reason=reason;
    }
    static AppUpdateFailure classify(Throwable error, String stage) {
        Throwable at=error;
        for(int i=0;at!=null&&i<8;i++,at=at.getCause()) {
            if(at instanceof AppUpdateFailure)return (AppUpdateFailure)at;
            if(at instanceof android.system.ErrnoException
                    && ((android.system.ErrnoException)at).errno==android.system.OsConstants.ENOSPC)
                return new AppUpdateFailure("space","disk_full",error);
            if(at.getCause()==at)break;
        }
        String message=error.getMessage();
        if("update_download_busy".equals(message)||"update_cache_busy".equals(message))
            return new AppUpdateFailure("cache_busy",message,error);
        if("Installer grants busy".equals(message))return new AppUpdateFailure("cache_busy","update_install_grants_busy",error);
        if("connect".equals(stage)||"read".equals(stage)||"manifest".equals(stage)) {
            String reason=error instanceof UnknownHostException?"dns":error instanceof SocketTimeoutException?"timeout"
                    :error instanceof SSLException?"tls":"connection";
            return new AppUpdateFailure("network",reason,error);
        }
        // Only fixed local error codes are retained. URLs, query strings and file paths are omitted.
        String reason=message!=null&&message.matches("(?:update|invalid_update)_[a-z_]{1,60}")?message:"io";
        return new AppUpdateFailure("storage",reason,error);
    }
    String userMessage() {
        switch(category) {
            case "space": return "手机可用存储空间不足，请释放空间后重试。";
            case "cache_busy": return "更新缓存或下载任务正在使用中，请等待安装或下载结束后重试。";
            case "network":
                if(reason.startsWith("http_"))return "下载服务器返回错误（HTTP "+reason.substring(5)+"），请稍后重试。";
                if("timeout".equals(reason))return "下载连接超时，请检查网络后重试。";
                if("dns".equals(reason))return "无法解析下载服务器地址，请检查网络后重试。";
                if("tls".equals(reason))return "无法建立安全下载连接，请检查网络和系统时间后重试。";
                if("response_truncated".equals(reason))return "安装包传输未完成，请检查网络后重试。";
                return "下载连接失败或中断，请检查网络后重试。";
            default: return "更新文件无法读写或清理，请重试；仍失败时可在系统应用设置中清除红魔Duo缓存。";
        }
    }
    static void requireSpace(long available,long required)throws AppUpdateFailure {
        if(available>=0&&required>available)throw new AppUpdateFailure("space","insufficient_space",null);
    }
    static String trace(Throwable error) {
        StringBuilder out=new StringBuilder();
        for(int n=0;error!=null&&n<4;n++) {
            if(n>0)out.append(" <- ");out.append(error.getClass().getName());
            if(error instanceof android.system.ErrnoException)out.append(":errno=").append(((android.system.ErrnoException)error).errno);
            StackTraceElement[] frames=error.getStackTrace();
            for(int i=0;i<Math.min(5,frames.length);i++)out.append(" at ").append(frames[i]);
            if(error.getCause()==error)break;error=error.getCause();
        }
        return out.toString();
    }
}
