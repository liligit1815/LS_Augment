package ls.augment.com.step;

/** Convert a physical workspace pose to the native parent's local coordinates. */
public final class WorkspaceTransform {
    public final float scale,x,y;
    public WorkspaceTransform(float scale,float x,float y){
        if(!(scale>0) || !Float.isFinite(scale) || !Float.isFinite(x) || !Float.isFinite(y))
            throw new IllegalArgumentException("工作区图层变换无效");
        this.scale=scale;this.x=x;this.y=y;
    }
    public WorkspaceTransform inside(WorkspaceTransform parent){
        return new WorkspaceTransform(scale/parent.scale,(x-parent.x)/parent.scale,(y-parent.y)/parent.scale);
    }
    public WorkspaceTransform then(WorkspaceTransform outer){
        return new WorkspaceTransform(scale*outer.scale,x*outer.scale+outer.x,y*outer.scale+outer.y);
    }
    public boolean identity(){return scale==1f && x==0f && y==0f;}
    public static void requireCache(Class<?> container,Class<?> spec)throws NoSuchFieldException{
        for(Class<?> type=container;type!=null;type=type.getSuperclass()){
            java.lang.reflect.Field field;
            try{field=type.getDeclaredField("mLastMagnificationSpec");}
            catch(NoSuchFieldException missing){continue;}
            int modifiers=field.getModifiers();
            if(field.getType()!=spec || java.lang.reflect.Modifier.isStatic(modifiers) || java.lang.reflect.Modifier.isFinal(modifiers))
                throw new NoSuchFieldException("原生缩放缓存类型或可写性变化");
            field.setAccessible(true);return;
        }
        throw new NoSuchFieldException("缺少原生缩放缓存 mLastMagnificationSpec");
    }
}
