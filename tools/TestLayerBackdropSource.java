import android.graphics.Canvas;
import android.graphics.Rect;
import android.hardware.HardwareBuffer;
import android.os.Handler;
import android.view.View;
import android.view.WindowManager;
import android.view.WindowManagerGlobal;
import android.window.ScreenCapture;
import ls.augment.com.LayerBackdropSource;

/** Production source executed with controlled time/Binder/Android facade, not a GPU test. */
public final class TestLayerBackdropSource {
    static View host;
    static WindowManagerGlobal.Root root;
    static WindowManagerGlobal.Service service=WindowManagerGlobal.SERVICE;
    static LayerBackdropSource fresh(){
        Handler.reset();WindowManagerGlobal.INSTANCE.mRoots.clear();WindowManagerGlobal.INSTANCE.mWindowlessRoots.clear();
        service.calls=0;service.listener=null;service.args=null;ScreenCapture.ignoreSecureFlag=false;ScreenCapture.ignoreExclusions=false;
        host=new View();root=new WindowManagerGlobal.Root(host,1);WindowManagerGlobal.INSTANCE.mRoots.add(root);
        LayerBackdropSource source=new LayerBackdropSource(host);source.setRegion(new Rect(0,0,100,60));return source;
    }
    static ScreenCapture.ScreenshotHardwareBuffer result(){return new ScreenCapture.ScreenshotHardwareBuffer(50,30,0);}
    static void request(LayerBackdropSource source){source.request();Handler.advance(0);}
    static void complete(ScreenCapture.ScreenshotHardwareBuffer buffer){service.complete(buffer,0);Handler.advance(0);}
    static void check(boolean value,String name){if(!value)throw new AssertionError(name);}
    public static void main(String[] args){
        LayerBackdropSource source=fresh();
        WindowManagerGlobal.INSTANCE.mWindowlessRoots.add(new WindowManagerGlobal.Root(new View(),2));
        request(source);source.request();Handler.advance(0);
        check(service.calls==1,"one in-flight capture");
        check(!service.args.mCaptureSecureLayers&&!service.args.mAllowProtected,"explicit secure/protected exclusions");
        check(service.args.mExcludeLayers.length==2,"ordinary and windowless roots excluded");
        ScreenCapture.ScreenshotHardwareBuffer image=result();complete(image);
        check(image.buffer.closed&&image.bitmap.recycled,"native buffers closed after copy");
        check(source.isValid()&&source.draw(new Canvas(),100,60),"verified frame accepted");
        Canvas cropped=new Canvas();
        check(source.drawRegion(cropped,new Rect(20,10,80,50),120,80),"a control uses the shared captured frame");
        check(cropped.source.equals(new Rect(10,5,40,25))&&cropped.destination.equals(new Rect(0,0,120,80)),
                "host-local region maps to frame pixels and control-local canvas");
        check(service.calls==1,"per-control drawing never starts another capture");
        check(!source.drawRegion(cropped,new Rect(-1,0,20,20),20,20),"outside captured area is not stretched into a control");
        check(!source.drawRegion(cropped,new Rect(0,0,20,20),0,20),"zero destination rejected");
        host.scaleX=.8f;check(!source.isValid(),"cached frame rejects scale");host.scaleX=1;
        ((WindowManager.LayoutParams)host.params).flags=WindowManager.LayoutParams.FLAG_SECURE;
        check(!source.isValid(),"cached frame rejects secure window");((WindowManager.LayoutParams)host.params).flags=0;
        root.surface.id=3;check(!source.isValid(),"surface replacement invalidates old frame");source.release();

        source=fresh();request(source);WindowManagerGlobal.INSTANCE.mWindowlessRoots.add(new WindowManagerGlobal.Root(new View(),9));
        complete(result());check(!source.isValid(),"root mutation during capture drops result");source.release();

        source=fresh();request(source);source.setRegion(new Rect(0,0,80,50));complete(result());
        check(!source.isValid(),"bounds mutation rejects pending old crop");source.release();

        source=fresh();request(source);source.release();image=result();complete(image);Handler.advance(2000);
        check(!source.isValid()&&service.calls==1,"release ignores late callback and stops polling");
        check(image.buffer.closed,"late buffer still closed");

        source=fresh();request(source);Handler.advance(701);
        check(source.failureReason().equals("capture_timeout"),"timeout fails closed");
        complete(result());source.request();Handler.advance(2000);
        check(!source.isValid()&&service.calls==1,"late success cannot revive timed-out source");source.release();

        for(int unsafe=0;unsafe<3;unsafe++){
            source=fresh();request(source);image=unsafe==2?new ScreenCapture.ScreenshotHardwareBuffer(513,30,0):result();
            if(unsafe==0)image.secure=true;if(unsafe==1)image.buffer.usage=HardwareBuffer.USAGE_PROTECTED_CONTENT;
            complete(image);check(!source.isValid(),"unsafe or oversized result rejected "+unsafe);
            check(image.buffer.closed,"rejected buffer closed "+unsafe);source.release();
        }
        source=fresh();ScreenCapture.ignoreSecureFlag=true;request(source);
        check(service.calls==0&&!source.isValid(),"ignored safety flag prevents IPC");source.release();
        source=fresh();ScreenCapture.ignoreExclusions=true;request(source);
        check(service.calls==0&&!source.isValid(),"ignored exclusions prevent IPC");source.release();

        source=fresh();request(source);complete(result());long revision=source.revision();
        Handler.advance(200);complete(result());check(source.revision()==revision,"identical frame reuses optical texture");
        Handler.advance(200);image=result();image.bitmap.pixels[1]=0xffeeeeee;complete(image);
        check(source.revision()!=revision,"localized pixel change refreshes optical texture");
        host.shown=false;Handler.advance(1201);check(!source.isValid(),"hidden stale source cannot render");source.release();
        System.out.println("LayerBackdropSource runtime: exclusions, callback races, timeout, lifecycle, safety and revision passed (Android facade; no GPU validation)");
    }
}
