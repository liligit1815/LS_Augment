package ls.augment.com;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;

/** Reference proportions: aligned rounded bars and inset solid activity arrows. */
public final class DualSignalPainter {
    public interface Labels {void draw(Canvas canvas,int row,float x,float y,float width,float height,int color);}
    private static final float[] HEIGHTS={15,20,24,30,35};
    private final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Path arrow=new Path();
    private ArtworkLayers artwork;
    public void setArtwork(ArtworkLayers value){artwork=value;}
    public void draw(Canvas canvas,float x,float y,DualSignalLayout layout,int first,int second,
            int firstBars,int secondBars,int rows,int color,int activity){
        draw(canvas,x,y,layout,first,second,firstBars,secondBars,rows,color,activity,null);
    }
    public void draw(Canvas canvas,float x,float y,DualSignalLayout layout,int first,int second,
            int firstBars,int secondBars,int rows,int color,int activity,Labels labels){
        draw(canvas,x,y,layout,first,second,firstBars,secondBars,rows,color,activity,rows>1?1:0,labels);
    }
    public void draw(Canvas canvas,float x,float y,DualSignalLayout layout,int first,int second,
            int firstBars,int secondBars,int rows,int color,int activity,int activityRow,Labels labels){
        if(layout.height<=0||rows<1)return;
        float unit=layout.unit();
        if(labels!=null&&layout.labelWidth>0){
            for(int r=0;r<rows;r++)labels.draw(canvas,r,x,y+(r*(layout.rowUnits+layout.gapUnits)+layout.badgeTop)*unit,
                    layout.labelWidth,layout.badgeUnits*unit,color);
        }
        int save=canvas.save();
        try{
            canvas.translate(x+layout.signalX,y);canvas.scale(unit,unit);
            for(int r=0;r<rows;r++)row(canvas,layout.signalTop(r),r==0?first:second,r==0?firstBars:secondBars,color,r,layout.signalUnits,layout.signalHeight(r));
            if(layout.activity&&activityRow>=0&&activityRow<rows){
                int activitySave=canvas.save();
                float scale=layout.activityHeight()/21;
                canvas.translate(layout.ios?-layout.activityWidth()-layout.activityGap():0,activityRow*(layout.rowUnits+layout.gapUnits)-44*scale);
                canvas.scale(scale,scale);
                arrow(canvas,false,activity==2||activity==3,color);
                arrow(canvas,true,activity==1||activity==3,color);
                canvas.restoreToCount(activitySave);
            }
        }finally{canvas.restoreToCount(save);}
    }
    public interface Badges {void draw(Canvas canvas,int row,int badge,DualSignalLayout.Box box,int color);}
    /** Both native vectors and every artwork layer consume the measured plan. */
    public void drawSpaced(Canvas canvas,float x,float y,DualSignalLayout layout,int first,int second,
            int firstBars,int secondBars,int color,int activity,int activityRow,Badges badges){
        DualSignalLayout.Plan plan=layout.plan;
        if(plan==null)throw new IllegalArgumentException("spacing plan required");
        float unit=layout.unit();
        if(badges!=null)for(int r=0;r<plan.rows.length;r++)for(int b=0;b<3;b++){
            DualSignalLayout.Box box=plan.rows[r].badges[b];
            if(box!=null)badges.draw(canvas,r,b,box.offset(x,y),color);
        }
        for(int r=0;r<plan.rows.length;r++){
            DualSignalLayout.Box box=plan.rows[r].signal;int save=canvas.save();
            try{canvas.translate(x+box.x,y+box.y);canvas.scale(unit,unit);
                row(canvas,0,r==0?first:second,r==0?firstBars:secondBars,color,r,layout.signalUnits,box.height/unit);
            }finally{canvas.restoreToCount(save);}
        }
        if(layout.activity&&activityRow>=0&&activityRow<plan.rows.length){
            DualSignalLayout.Box box=plan.rows[activityRow].activity;int save=canvas.save();
            float scale=box.height/21;
            try{canvas.translate(x+box.x,y+box.y-44*scale);canvas.scale(scale,scale);
                arrow(canvas,false,activity==2||activity==3,color);
                arrow(canvas,true,activity==1||activity==3,color);
            }finally{canvas.restoreToCount(save);}
        }
    }
    private void row(Canvas canvas,float y,int level,int bars,int color,int index){
        row(canvas,y,level,bars,color,index,85,35);
    }
    private void row(Canvas canvas,float y,int level,int bars,int color,int index,float width,float rowHeight){
        String id="row"+index+".signal";
        if(artwork!=null&&artwork.draw(canvas,id,"whole",0,y,width,y+rowHeight,color))return;
        if(artwork!=null)artwork.draw(canvas,id,"background",0,y,width,y+rowHeight,color);
        int count=bars==5?5:4;
        for(int i=0;i<count;i++){
            // Four-level ROMs keep four columns; the first two leave arrow clearance.
            float left=count==5?.5f+i*18:.5f+i*24;
            float height=HEIGHTS[count==5?i:i==3?4:i]*rowHeight/35;
            paint.setColor(i<level?color:dim(color,.28f));
            canvas.drawRoundRect(left,y+rowHeight-height,left+12.5f,y+rowHeight,6.25f,6.25f,paint);
        }
        if(artwork!=null)artwork.draw(canvas,id,"foreground",0,y,width,y+rowHeight,color);
    }
    private void arrow(Canvas canvas,boolean down,boolean active,int color){
        if(!active)return;
        String id=down?"data.activity_in":"data.activity_out";
        float left=down?16:0;
        if(artwork!=null&&artwork.draw(canvas,id,"whole",left,44,left+15,65,color))return;
        if(artwork!=null)artwork.draw(canvas,id,"background",left,44,left+15,65,color);
        int save=canvas.save();
        if(down){canvas.translate(30,109);canvas.scale(-1,-1);}
        paint.setColor(color);
        arrow.reset();arrow.moveTo(10,45);arrow.quadTo(13,44,13,47);
        arrow.lineTo(13,62);arrow.quadTo(13,64,11,64);arrow.quadTo(8,64,8,62);
        arrow.lineTo(8,57);arrow.lineTo(1,57);arrow.quadTo(-1,57,1,54);
        arrow.lineTo(9,46);arrow.quadTo(9.5f,45.3f,10,45);arrow.close();
        canvas.drawPath(arrow,paint);canvas.restoreToCount(save);
        if(artwork!=null)artwork.draw(canvas,id,"foreground",left,44,left+15,65,color);
    }
    private static int dim(int color,float alpha){return (color&0xffffff)|(Math.round((color>>>24)*alpha)<<24);}
}
