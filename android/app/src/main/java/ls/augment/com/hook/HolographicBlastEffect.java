package ls.augment.com.hook;

import android.graphics.*;
import java.util.Random;

/** Procedural fire and smoke, lit debris and one detonation flash. No captured UI surfaces. */
final class HolographicBlastEffect {
    static final float IMPACT=.12f;
    private final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);
    private final RuntimeShader fire=new RuntimeShader(FIRE);
    private final float[] angles=new float[96],speeds=new float[96],sizes=new float[96];
    HolographicBlastEffect(){
        Random random=new Random(0x424c415354L);
        for(int i=0;i<angles.length;i++){angles[i]=random.nextFloat()*6.283185f;speeds[i]=.3f+random.nextFloat()*.7f;sizes[i]=.5f+random.nextFloat()*1.5f;}
    }
    void draw(Canvas c,float t,float width,float height,float startX,float startY,float unit){
        if(t>=1)return;
        float cx=width*.5f,cy=height*.43f;
        if(t<IMPACT){
            float u=t/IMPACT,e=1-(1-u)*(1-u);
            core(c,startX+(cx-startX)*e,startY+(cy-startY)*e,unit*(.38f+.3f*u),u,paint);
            return;
        }
        float u=(t-IMPACT)/(1-IMPACT),fade=1-u;
        // A single brief warm flash. The interface itself is never moved or made opaque.
        float flash=Math.max(0,1-u/.085f);
        fill(0xffffe7b0,(int)(105*flash));c.drawRect(0,0,width,height,paint);
        float shake=width*.006f*(float)Math.sin(u*97)*Math.max(0,1-u/.32f);
        cx+=shake;cy+=shake*.6f;
        float radius=width*(.045f+.43f*(1-(float)Math.exp(-u*7)));
        // Broad pressure front precedes the turbulent flame, then disappears into the smoke.
        if(u<.45f){
            float r=width*1.1f*(1-(1-u/.45f)*(1-u/.45f));
            for(int i=4;i>=0;i--){stroke(i==0?0xffffe3ab:0xff9e541c,(int)((i==0?220:24)*(1-u/.45f)),unit*(.024f+i*.06f));c.drawOval(cx-r,cy-r*.64f,cx+r,cy+r*.64f,paint);}
        }
        fire.setFloatUniform("center",cx,cy);fire.setFloatUniform("radius",radius);
        fire.setFloatUniform("phase",u);
        paint.setStyle(Paint.Style.FILL);paint.setColor(0xffffffff);paint.setAlpha(255);paint.setShader(fire);
        try{c.drawRect(cx-radius*1.35f,cy-radius*1.65f,cx+radius*1.35f,cy+radius*1.3f,paint);}
        finally{paint.setShader(null);}
        for(int i=0;i<angles.length;i++){
            float speed=speeds[i],angle=angles[i],r=width*(.12f+.72f*speed)*(1-(float)Math.exp(-u*4));
            float x=cx+(float)Math.cos(angle)*r,y=cy+(float)Math.sin(angle)*r*.72f+u*u*width*.32f;
            float tail=unit*(.09f+.34f*speed)*fade;
            float dx=(float)Math.cos(angle)*tail,dy=(float)Math.sin(angle)*tail*.72f+u*tail;
            stroke(0xffa52b04,(int)(55*fade),unit*.032f*sizes[i]);c.drawLine(x,y,x-dx,y-dy,paint);
            stroke(i%4==0?0xfffff1b0:0xffff9b20,(int)(255*fade*fade),unit*.009f*sizes[i]);c.drawLine(x,y,x-dx,y-dy,paint);
            fill(0xffffdc72,(int)(240*fade*fade));c.drawCircle(x,y,unit*.014f*sizes[i]*fade,paint);
        }
        if(flash>0){
            fill(0xfffff5db,(int)(255*flash));c.drawCircle(cx,cy,width*(.055f+u*.45f),paint);
            stroke(0xffffd576,(int)(220*flash),unit*.05f);c.drawLine(cx-width*.34f,cy,cx+width*.34f,cy,paint);
        }
    }
    private void fill(int color,int alpha){paint.setShader(null);paint.setStyle(Paint.Style.FILL);paint.setColor(color);paint.setAlpha(Math.max(0,Math.min(255,alpha)));}
    private void stroke(int color,int alpha,float width){fill(color,alpha);paint.setStyle(Paint.Style.STROKE);paint.setStrokeWidth(width);paint.setStrokeCap(Paint.Cap.ROUND);}
    static void core(Canvas c,float x,float y,float radius,float phase,Paint p){
        p.setShader(null);p.setStyle(Paint.Style.FILL);p.setColor(0xff171a20);p.setAlpha(245);c.drawCircle(x,y,radius*.66f,p);
        p.setStyle(Paint.Style.STROKE);p.setStrokeWidth(radius*.07f);p.setColor(0xffffab39);c.drawCircle(x,y,radius*.68f,p);
        for(int i=0;i<3;i++){float a=(float)(i*2.0944+phase*.5);float dx=(float)Math.cos(a),dy=(float)Math.sin(a);p.setStrokeWidth(radius*.11f);c.drawLine(x+dx*radius*.19f,y+dy*radius*.19f,x+dx*radius*.46f,y+dy*radius*.46f,p);}
        p.setStyle(Paint.Style.FILL);p.setColor(0xffffedbd);c.drawCircle(x,y,radius*.09f,p);
        p.setStyle(Paint.Style.STROKE);p.setStrokeWidth(radius*.075f);c.drawLine(x+radius*.43f,y-radius*.46f,x+radius*.75f,y-radius*.9f,p);
        p.setColor(0xffff7c22);c.drawCircle(x+radius*.77f,y-radius*.93f,radius*.13f,p);
    }
    private static final String FIRE="""
        uniform float2 center;
        uniform float radius;
        uniform float phase;
        float hash(float2 p){return fract(sin(dot(p,float2(127.1,311.7)))*43758.5453);}
        float noise(float2 p){float2 i=floor(p),f=fract(p);f=f*f*(3.0-2.0*f);return mix(mix(hash(i),hash(i+float2(1,0)),f.x),mix(hash(i+float2(0,1)),hash(i+float2(1,1)),f.x),f.y);}
        float fbm(float2 p){float v=0.0,a=.53;for(int i=0;i<4;i++){v+=a*noise(p);p=float2(p.x*1.6-p.y*1.2,p.x*1.2+p.y*1.6)+7.1;a*=.5;}return v;}
        half4 main(float2 frag){
            float2 p=(frag-center)/radius;
            p.y+=phase*.32;
            float n=fbm(p*4.8-float2(0,phase*3.8));
            float detail=fbm(p*11.0+float2(phase*1.3,-phase*6.0));
            float edge=length(p*float2(1.0,1.07))-(.68+n*.48);
            float density=(1.0-smoothstep(-.14,.08,edge));
            float heat=clamp(1.23-length(p)*.67+(n-.5)*.85+(detail-.5)*.55-phase*1.45,0.0,1.0);
            float3 smoke=mix(float3(.07,.065,.062),float3(.29,.27,.24),detail);
            float3 flame=mix(float3(.35,.025,.003),float3(1.0,.20,.008),smoothstep(.17,.50,heat));
            flame=mix(flame,float3(1.0,.72,.10),smoothstep(.47,.76,heat));
            flame=mix(flame,float3(1.0,.98,.83),smoothstep(.73,.98,heat));
            float3 color=mix(smoke,flame,smoothstep(.09,.30,heat));
            float alpha=density*(1.0-smoothstep(.55,1.0,phase))*.94;
            return half4(color*alpha,alpha);
        }
        """;
}
