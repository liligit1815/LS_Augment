package ls.augment.com;

import android.graphics.Canvas;
import android.graphics.Paint;

/** Compact, separated bars; each row is one SIM, each column is one signal level. */
public final class CompactSignalPainter {
    private final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);
    public void draw(Canvas canvas,float x,float y,float width,float height,int first,int second,int rows,int color,int inactive){
        draw(canvas,x,y,width,height,first,second,4,4,rows,color,inactive);
    }
    public void draw(Canvas canvas,float x,float y,float width,float height,int first,int second,
            int firstBars,int secondBars,int rows,int color,int inactive){
        if(rows<1||width<=0||height<=0)return;
        rows=Math.min(2,rows);float gapY=height*.14f;
        float row=(height-(rows-1)*gapY)/rows;
        int dim=(color&0xffffff)|(((color>>>24)*inactive/100)<<24);
        for(int r=0;r<rows;r++){
            int columns=(r==0?firstBars:secondBars)==5?5:4;
            float gapX=width*.24f/(columns-1),cell=width*.76f/columns;
            int lit=Math.max(0,Math.min(columns,r==0?first:second));
            for(int c=0;c<columns;c++){
                float bar=row*(.55f+.45f*c/(columns-1)),left=x+c*(cell+gapX),bottom=y+r*(row+gapY)+row;
                paint.setColor(c<lit?color:dim);
                canvas.drawRoundRect(left,bottom-bar,left+cell,bottom,cell*.1f,cell*.1f,paint);
            }
        }
    }
}
