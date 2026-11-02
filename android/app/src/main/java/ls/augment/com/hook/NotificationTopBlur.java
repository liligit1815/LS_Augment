package ls.augment.com.hook;

import android.graphics.RenderEffect;
import android.graphics.RuntimeShader;

/** Blur only notification pixels approaching the native header clip; never sample the clock. */
final class NotificationTopBlur {
    private static final String CODE="uniform shader content; uniform float edge; uniform float band;"
            +"half4 main(float2 p) { float amount=1.0-smoothstep(edge,edge+band,p.y);"
            +"if(amount<=0.001) return content.eval(p); float stepSize=band*0.10*amount;"
            +"half4 sum=half4(0); float weight=0.0;"
            +"for(int y=-2;y<=2;y++){for(int x=-2;x<=2;x++){"
            +"float w=exp(-float(x*x+y*y)*0.5); sum+=content.eval(p+float2(float(x),float(y))*stepSize)*w;weight+=w;}}"
            +"return sum/weight;}";
    private RuntimeShader shader;
    RenderEffect effect(float edge,float band){
        if(shader==null)shader=new RuntimeShader(CODE);
        shader.setFloatUniform("edge",edge);shader.setFloatUniform("band",band);
        return RenderEffect.createRuntimeShaderEffect(shader,"content");
    }
}
