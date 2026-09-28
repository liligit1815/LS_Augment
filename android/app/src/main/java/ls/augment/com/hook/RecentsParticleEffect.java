package ls.augment.com.hook;

import android.graphics.*;
import android.view.View;
import java.util.ArrayList;
import java.util.Random;

/** A glass-chip lattice split by a bright disassembly beam. Coordinates only, never task buffers. */
final class RecentsParticleEffect {
    private final ArrayList<Card> cards=new ArrayList<>();
    private final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Path shard=new Path();
    void capture(View view,View root){
        if(cards.size()>=4||!view.isShown()||view.getWidth()<=0||view.getHeight()<=0||contains(view))return;
        Matrix transform=new Matrix();view.transformMatrixToGlobal(transform);root.transformMatrixToLocal(transform);
        RectF visible=new RectF(0,0,view.getWidth(),view.getHeight());transform.mapRect(visible);
        if(visible.intersect(0,0,root.getWidth(),root.getHeight()))cards.add(new Card(view,transform));
    }
    boolean contains(View view){for(Card card:cards)if(card.source==view)return true;return false;}
    int size(){return cards.size();}
    void close(){cards.clear();}
    void draw(Canvas canvas,float progress){
        if(!canvas.isHardwareAccelerated())return;
        float t=clamp(progress);if(t>=1)return;
        for(Card card:cards){int save=canvas.save();try{
            canvas.concat(card.transform);
            float w=card.width,h=card.height,unit=w/360f;
            float scan=h*(1-clamp((t-.10f)/.54f));
            float frame=clamp((.7f-t)/.25f);
            // A dark transparent lattice gives the emissive edges contrast on light wallpapers.
            if(scan>0){
                fill(0xff071c38,(int)(155*frame));canvas.drawRoundRect(0,0,w,scan,16*unit,16*unit,paint);
                stroke(0xff248abe,(int)(95*frame),.7f*unit);
                for(int i=1;i<18;i++)canvas.drawLine(w*i/18,0,w*i/18,scan,paint);
                for(int i=1;i<28;i++){float y=h*i/28;if(y<scan)canvas.drawLine(0,y,w,y,paint);}
                stroke(0xff83ecff,(int)(230*frame),1.7f*unit);canvas.drawRoundRect(1,1,w-1,scan,16*unit,16*unit,paint);
            }
            for(Spark s:card.sparks){
                float u=clamp((t-s.delay)/(1-s.delay));
                if(u==0){
                    if(s.bright&&s.y<scan){stroke(0xff40caff,(int)(190*frame),unit);canvas.drawLine(s.x-5*unit,s.y,s.x+5*unit,s.y,paint);canvas.drawCircle(s.x,s.y,1.3f*unit,paint);}continue;
                }
                float ease=1-(1-u)*(1-u),fade=1-u*u;
                float x=s.x+s.dx*ease,y=s.y+s.dy*ease-u*u*h*.28f;
                float angle=s.spin*u,co=(float)Math.cos(angle),si=(float)Math.sin(angle);
                float sx=w/62*(1-u*.85f)*s.depth,sy=h/95*(1-u*.9f)*s.depth;
                float ax=co*sx,ay=si*sx,bx=-si*sy,by=co*sy;
                shard.reset();shard.moveTo(x-ax-bx,y-ay-by);shard.lineTo(x+ax-bx,y+ay-by);shard.lineTo(x+ax+bx,y+ay+by);shard.lineTo(x-ax+bx,y-ay+by);shard.close();
                int color=s.bright?0xffba96ff:0xff42deff;
                float tail=(.12f+u*.25f)*s.depth;
                stroke(0xff073355,(int)(100*fade),3*unit);canvas.drawLine(x,y,x-s.dx*tail,y-s.dy*tail,paint);
                stroke(color,(int)(210*fade),.8f*unit);canvas.drawLine(x,y,x-s.dx*tail,y-s.dy*tail,paint);
                fill(s.bright?0xff393278:0xff155579,(int)(200*fade));canvas.drawPath(shard,paint);
                stroke(color,(int)(46*fade),3*unit);canvas.drawPath(shard,paint);
                stroke(s.bright?0xffddcaff:0xffb0f8ff,(int)(245*fade),.7f*unit);canvas.drawPath(shard,paint);
                fill(0xffe4fbff,(int)(240*fade));canvas.drawCircle(x-ax,y-ay,1.3f*unit*(1-u),paint);
            }
            // White-hot scan edge with cyan/violet split, plus short electrical branches.
            if(t>.05f&&t<.65f){
                float a=clamp((.65f-t)/.13f);
                for(int i=6;i>=0;i--){stroke(i==0?0xffedffff:0xff00bfff,(int)((i==0?255:26)*a),(2+i*4)*unit);canvas.drawLine(-8*unit,scan,w+8*unit,scan,paint);}
                stroke(0xffac75ff,(int)(240*a),2*unit);canvas.drawLine(-5*unit,scan+7*unit,w+5*unit,scan+7*unit,paint);
                stroke(0xffb8f9ff,(int)(200*a),1.2f*unit);
                for(int i=0;i<9;i++){float x=w*(i+.5f)/9,dy=(float)Math.sin(i*13+t*40)*18*unit;canvas.drawLine(x-9*unit,scan,x,scan+dy,paint);canvas.drawLine(x,scan+dy,x+12*unit,scan-6*unit,paint);}
            }
        }finally{canvas.restoreToCount(save);}}
    }
    private void fill(int color,int alpha){paint.setStyle(Paint.Style.FILL);paint.setColor(color);paint.setAlpha(Math.max(0,Math.min(255,alpha)));}
    private void stroke(int color,int alpha,float width){fill(color,alpha);paint.setStyle(Paint.Style.STROKE);paint.setStrokeWidth(width);paint.setStrokeCap(Paint.Cap.ROUND);}
    private static float clamp(float n){return Math.max(0,Math.min(1,n));}
    private static final class Card {
        final View source;final Matrix transform;final float width,height;
        final Spark[] sparks=new Spark[504];
        Card(View view,Matrix matrix){
            source=view;transform=matrix;width=view.getWidth();height=view.getHeight();
            Random r=new Random(0x43484950L+view.getId());
            for(int i=0;i<sparks.length;i++){
                float x=((i%18)+.5f)*width/18,y=((i/18)+.5f)*height/28;
                sparks[i]=new Spark(x,y,(x-width*.5f)*(.6f+r.nextFloat())+(r.nextFloat()-.5f)*width*.22f,
                    (r.nextFloat()-.75f)*height*.4f,.1f+(1-y/height)*.48f+r.nextFloat()*.025f,
                    (r.nextFloat()-.5f)*7,.55f+r.nextFloat()*.8f,i%4==0);
            }
        }
    }
    private static final class Spark {
        final float x,y,dx,dy,delay,spin,depth;final boolean bright;
        Spark(float x,float y,float dx,float dy,float delay,float spin,float depth,boolean bright){this.x=x;this.y=y;this.dx=dx;this.dy=dy;this.delay=delay;this.spin=spin;this.depth=depth;this.bright=bright;}
    }
}
