package ls.augment.com;

import android.content.Context;
import android.os.Process;

import java.io.File;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicBoolean;

/** Short physical-input capture; never enables rapid-fire or changes OEM mappings. */
final class RapidFirePhysicalCapture {
    static final long CAPTURE_MS = 8_000L;
    private final AtomicBoolean cancelled = new AtomicBoolean();
    private volatile File lease;
    private volatile File completion;

    void cancel() {
        cancelled.set(true);
        File current = lease;
        if (current != null) current.delete();
    }

    Result run(Context context, List<RapidFireInputDetector.Device> devices, boolean left,
            Runnable onReady, Runnable onPair) {
        String device0 = null;
        String device1 = null;
        for (RapidFireInputDetector.Device device : devices) {
            if ("nubia_tgk_aw_sar0_ch0".equals(device.name)) device0 = device.path;
            if ("nubia_tgk_aw_sar1_ch0".equals(device.name)) device1 = device.path;
        }
        // A verified driver permits temporary wake writes; it is not a feature
        // admission list. All other discovered shoulder inputs use read-only capture.
        RootShell.Result wakeDriver = device0 == null || device1 == null ? null : RootShell.run(
                "sha256sum /vendor_dlkm/lib/modules/aw9620x.ko", null, 3, 256);
        if (wakeDriver == null || !wakeDriver.isSuccess() || !wakeDriver.output.startsWith(
                "3211fdc4b97aabe3c0db8f06f3ec07da8c3c382a6273412adb089940e9d4b532 ")) {
            return runReadOnly(context, devices, onReady);
        }
        if (cancelled.get()) return new Result(null, "采集已取消");
        RapidFireInputDetector.Device target = new RapidFireInputDetector.Device(
                left ? device0 : device1, left ? "nubia_tgk_aw_sar0_ch0" : "nubia_tgk_aw_sar1_ch0");
        try (InputStream input = context.getAssets().open("rapid_input_capture.sh")) {
            String script = ShellScriptSource.readUtf8(input);
            lease = new File(context.getCacheDir(), "rapid-input-"
                    + UUID.randomUUID() + ".lease");
            if (!lease.createNewFile()) return new Result(null, "无法建立临时肩键测试会话");
            completion = new File(lease.getCanonicalPath() + ".complete");
            if (cancelled.get()) return new Result(null, "采集已取消");
            AtomicBoolean ready = new AtomicBoolean();
            AtomicBoolean pair = new AtomicBoolean();
            RootShell.Result shell = RootShell.run("/system/bin/sh -c "
                    + RootShell.quote(script) + " -- " + Process.myPid()
                    + " " + RootShell.quote(lease.getCanonicalPath()) + " "
                    + RootShell.quote(device0) + " " + RootShell.quote(device1)
                    + " " + RootShell.quote(target.path),
                    null, 20, 256 * 1024, output -> {
                        if (output.contains("LSA_CAPTURE_READY=")
                                && !cancelled.get() && ready.compareAndSet(false, true)) {
                            onReady.run();
                        }
                        if (ready.get() && !cancelled.get() && !pair.get()
                                && !output.contains("LSA_CAPTURE_END=")
                                && RapidFireCaptureProtocol.observedPair(output, target) != null
                                && pair.compareAndSet(false, true)) {
                            // This requests reader shutdown, not compatibility approval.
                            try { completion.createNewFile(); } catch (java.io.IOException ignored) { }
                            onPair.run();
                        }
                    });
            context.getSharedPreferences(AppConfig.DIAGNOSTICS, 0).edit()
                    .putString("ls_augment_tgk_rapid_fire_physical_capture",
                            "module=" + BuildConfig.VERSION_NAME + "|time="
                                    + System.currentTimeMillis() + "|exit=" + shell.exitCode
                                    + "|timeout=" + shell.timedOut + "|cancelled=" + cancelled.get()
                                    + "|pair=" + pair.get() + "\n" + shell.output).apply();
            if (cancelled.get()) return new Result(null, "采集已取消，肩键正在恢复原状态");
            if (shell.output.contains("LSA_CAPTURE_ERROR=restore_failed")) {
                return new Result(null, "肩键原状态恢复失败，测试已停止；请重新进入原厂游戏空间恢复肩键");
            }
            if (!shell.isSuccess() || !RapidFireCaptureProtocol.isComplete(shell.output, target)) {
                return new Result(null, shell.output.contains("unverified_driver")
                        ? "肩键驱动尚未验证，无法自动唤醒；测试保持锁定"
                        : shell.output.contains("busy") ? "上一次肩键采集正在恢复，请稍后重试"
                        : pair.get() ? "已收到肩键事件，但结束或恢复确认不完整；未保存，请重新采集"
                        : "肩键临时唤醒或监听失败，测试未通过");
            }
            RapidFireInputDetector.Capture capture = RapidFireCaptureProtocol.observedPair(
                    shell.output, target);
            return new Result(capture, capture == null
                    ? "肩键已临时唤醒，但未收到单侧完整触摸/松开事件；请只触摸提示的一侧后重试"
                    : "");
        } catch (Exception error) {
            return new Result(null, "肩键采集异常，测试未通过");
        } finally {
            File current = lease;
            if (current != null) current.delete();
            File done = completion;
            if (done != null) done.delete();
        }
    }

    private Result runReadOnly(Context context,List<RapidFireInputDetector.Device> devices,Runnable onReady) {
        if(cancelled.get())return new Result(null,"采集已取消");
        try(InputStream input=context.getAssets().open("rapid_input_readonly.sh")) {
            String script=ShellScriptSource.readUtf8(input);
            lease=new File(context.getCacheDir(),"rapid-input-"+UUID.randomUUID()+".lease");
            if(!lease.createNewFile()||cancelled.get())return new Result(null,"采集已取消");
            StringBuilder command=new StringBuilder("/system/bin/sh -c ")
                    .append(RootShell.quote(script))
                    .append(" -- ").append(Process.myPid()).append(' ').append(RootShell.quote(lease.getCanonicalPath()));
            for(RapidFireInputDetector.Device device:devices)command.append(' ').append(RootShell.quote(device.path));
            AtomicBoolean ready=new AtomicBoolean();
            RootShell.Result shell=RootShell.run(command.toString(),null,18,256*1024,output->{
                if(output.contains("LSA_READONLY_READY=1")&&!cancelled.get()&&ready.compareAndSet(false,true))onReady.run();
            });
            context.getSharedPreferences(AppConfig.DIAGNOSTICS,0).edit().putString(
                    "ls_augment_tgk_rapid_fire_physical_capture","module="+BuildConfig.VERSION_NAME
                    +"|mode=read_only|exit="+shell.exitCode+"|time="+System.currentTimeMillis()+"\n"+shell.output).apply();
            if(cancelled.get())return new Result(null,"采集已取消，肩键原状态未改变");
            if(!shell.isSuccess()||!RapidFireReadOnlyCaptureProtocol.isComplete(shell.output,devices))
                return new Result(null,"肩键监听未完整结束，请重试；原厂肩键状态未改变");
            RapidFireInputDetector.Capture capture=RapidFireReadOnlyCaptureProtocol.observedPair(shell.output,devices);
            return new Result(capture,capture==null?"未收到单侧触摸和松开。请先在原厂游戏空间启用肩键，再返回只触摸提示的一侧；无需更换机型或系统版本":"");
        }catch(Exception e){return new Result(null,"肩键只读采集失败，请重试");}
        finally {File current=lease;if(current!=null)current.delete();}
    }

    static final class Result {
        final RapidFireInputDetector.Capture capture;
        final String message;

        Result(RapidFireInputDetector.Capture capture, String message) {
            this.capture = capture;
            this.message = message;
        }
    }
}
