package ls.augment.com.hook;

import android.content.res.ColorStateList;
import android.view.View;
import android.widget.ImageView;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.WeakHashMap;
import ls.augment.com.IslandVisualSpec;
import ls.augment.com.SystemUiOptions;

/** Colours only the OEM recognition indicator. The biometric controller owns every transition. */
final class IslandFaceFeedback {
    private static final WeakHashMap<ImageView,Appearance> active=new WeakHashMap<>();
    private static final class Appearance implements View.OnAttachStateChangeListener{
        final ColorStateList tint;final CharSequence description;
        ColorStateList ownTint;String ownLabel;
        Appearance(ImageView icon){tint=icon.getImageTintList();description=icon.getContentDescription();icon.addOnAttachStateChangeListener(this);}
        void restore(ImageView icon){
            if(icon.getImageTintList()==ownTint)icon.setImageTintList(tint);
            if(android.text.TextUtils.equals(icon.getContentDescription(),ownLabel))icon.setContentDescription(description);
            icon.removeOnAttachStateChangeListener(this);active.remove(icon);
        }
        public void onViewDetachedFromWindow(View v){restore((ImageView)v);}
        public void onViewAttachedToWindow(View v){}
    }
    static int install(AugmentModule module,ClassLoader loader){
        int count=0;
        for(String name:new String[]{"com.zte.feature.dynamicisland.islands.FaceDetectIsland","com.zte.feature.dynamicisland.FaceDetectIslandFullScreen"})try{
            Class<?> type=Class.forName(name,false,loader),state=Class.forName("com.zte.feature.face.FaceDetectController$FaceRunState",false,loader);
            if(!state.isEnum()||!View.class.isAssignableFrom(type))continue;
            Method update=MagicIslandScenes.exact(type,"updateFaceDetectState",void.class,state);
            Field image=MagicIslandScenes.typed(type,name.endsWith("FullScreen")?"mDisplayIcon":"mDisplayFace",ImageView.class);
            module.registerFeatureHook(module.prepareFeatureHook(update,"island.face.feedback",false).intercept(chain->{
                Object result=chain.proceed();Object icon=image.get(chain.getThisObject());Object event=chain.getArgs().get(0);
                if(icon instanceof ImageView&&event instanceof Enum)apply((ImageView)icon,((Enum<?>)event).name());
                return result;
            }));count++;
        }catch(Exception unavailable){FeatureRuntimeLog.state("ISLAND_FACE_FEEDBACK",name,"native_state_or_icon_missing");}
        return count;
    }
    private static void apply(ImageView icon,String state){
        Appearance appearance=active.get(icon);
        String label=null;int color=IslandVisualSpec.INFORMATION;
        if(IslandSceneSelection.enabled(icon.getContext(),"face")&&FeatureSettings.integer(icon.getContext(),SystemUiOptions.PREFIX+"island_face_theme",1,0,1)==1){
            switch(state){
                case "F_R_STATE_VERIFYING":label="正在识别人脸";break;
                case "F_R_STATE_VERIFIED":case "F_R_STATE_SILDE_UNLOCK":label="人脸识别通过";color=IslandVisualSpec.POSITIVE;break;
                case "F_R_STATE_FAILED":label="人脸识别失败";color=IslandVisualSpec.RECORDING;break;
            }
        }
        if(label==null){if(appearance!=null)appearance.restore(icon);return;}
        if(appearance==null){appearance=new Appearance(icon);active.put(icon,appearance);}
        appearance.ownTint=ColorStateList.valueOf(color);appearance.ownLabel=label;
        icon.setImageTintList(appearance.ownTint);icon.setContentDescription(label);
    }
    private IslandFaceFeedback(){}
}
