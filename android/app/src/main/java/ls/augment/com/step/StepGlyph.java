package ls.augment.com.step;

import android.content.Context;
import android.graphics.*;
import android.view.View;

/** Small line icons; the complete header cell is the touch target. */
final class StepGlyph extends View {
    String glyph;
    final Paint pen=new Paint(Paint.ANTI_ALIAS_FLAG);
    int accent;
    int fixedInk;
    int maxIconSizeDp=22;
    android.graphics.drawable.Drawable brand;
    StepGlyph(Context c,String glyph,String label,Runnable action) {
        super(c);this.glyph=glyph;setContentDescription(label);setFocusable(true);
        StepMaterial.feedback(this);
        setOnClickListener(v->action.run());pen.setStrokeCap(Paint.Cap.ROUND);pen.setStrokeJoin(Paint.Join.ROUND);
        if("redmagic".equals(glyph))try{
            brand=c.createPackageContext("ls.augment.com",0).getDrawable(ls.augment.com.R.drawable.ic_step_redmagic).mutate();
            tintBrand(StepMaterial.ink(c));
        }catch(Exception missing){}
    }
    void setFixedInk(int ink){fixedInk=ink;if(brand!=null)tintBrand(ink);invalidate();}
    void setMaxIconSizeDp(int size){maxIconSizeDp=Math.max(1,size);invalidate();}
    private void tintBrand(int ink){
            // The monochrome brand source is white on black. Use luminance as
            // coverage so the mark shares the toolbar ink without a square tile.
            brand.setColorFilter(new ColorMatrixColorFilter(new float[]{
                0,0,0,0,Color.red(ink),0,0,0,0,Color.green(ink),0,0,0,0,Color.blue(ink),
                .2126f,.7152f,.0722f,0,0}));
    }
    void line(Canvas c,float... xy){Path path=new Path();path.moveTo(xy[0],xy[1]);for(int i=2;i<xy.length;i+=2)path.lineTo(xy[i],xy[i+1]);c.drawPath(path,pen);}
    void dot(Canvas c,float x,float y,float radius){
        pen.setStyle(Paint.Style.FILL);c.drawCircle(x,y,radius,pen);pen.setStyle(Paint.Style.STROKE);
    }
    @Override public void onDraw(Canvas c){
        if(brand!=null){int side=StepMaterial.dp(getContext(),30);int x=(getWidth()-side)/2,y=(getHeight()-side)/2;brand.setBounds(x,y,x+side,y+side);brand.draw(c);return;}
        int n=Math.min(Math.min(getWidth(),getHeight()),StepMaterial.dp(getContext(),maxIconSizeDp));
        c.save();c.translate((getWidth()-n)/2f,(getHeight()-n)/2f);c.scale(n/24f,n/24f);
        pen.setStyle(Paint.Style.STROKE);pen.setStrokeWidth(1.7f);pen.setColor(accent!=0?accent:fixedInk!=0?fixedInk:StepMaterial.ink(getContext()));
        switch(glyph){
            case "add":line(c,12,4,12,20);line(c,4,12,20,12);break;
            case "files":
                // A document emerging from an open folder, not a generic box.
                line(c,3,11,3,5,9,5,11,7,20,7,20,11);
                line(c,11,11,11,3,17,3,20,6);line(c,14,6,16,6);
                line(c,2,11,22,11,19.5f,20,4.5f,20,2,11);break;
            case "media":
                // Photo stack and play triangle identify mixed recent media.
                line(c,3,15,2,15,2,3,17,3,17,5);
                c.drawRoundRect(5,7,22,21,2,2,pen);
                line(c,12,11,17,14,12,17,12,11);dot(c,5,5,.7f);break;
            case "workspace":
                c.drawRoundRect(2,3,22,21,2,2,pen);line(c,2,8,22,8);
                line(c,8,8,8,21);line(c,2,12.5f,8,12.5f);line(c,2,17,8,17);
                line(c,12,12,18,12);line(c,12,16,16,16);break;
            case "apps":
                c.drawRoundRect(3,3,10,10,2,2,pen);c.drawRoundRect(14,3,21,10,2,2,pen);
                c.drawRoundRect(3,14,10,21,2,2,pen);c.drawCircle(17.5f,17.5f,4.5f,pen);
                line(c,17.5f,15,17.5f,20);line(c,15,17.5f,20,17.5f);break;
            case "wallpaper":
                c.drawRoundRect(3,2,21,22,2,2,pen);line(c,8,5,16,5);
                dot(c,15.5f,9.5f,1.6f);
                line(c,3,18,9,11,15,18);line(c,13,16,16,13,21,18);break;
            case "swapTop":
                c.drawRoundRect(3,2,21,22,2,2,pen);line(c,3,10,6,10);line(c,18,10,21,10);
                line(c,9,18,9,6);line(c,6,9,9,6,12,9);
                line(c,15,6,15,18);line(c,12,15,15,18,18,15);break;
            case "moveUp":case "moveDown":
                // The destination pane and a crossing arrow show task movement.
                c.drawRoundRect(3,2,21,22,2,2,pen);line(c,3,9,7,9);line(c,17,9,21,9);
                boolean up="moveUp".equals(glyph);
                line(c,12,up?18:6,12,up?6:18);
                line(c,8,up?10:14,12,up?6:18,16,up?10:14);break;
            case "capture":
                // Crop corners + scissors distinguish screenshots from a camera.
                line(c,2,6,2,2,7,2);line(c,17,2,22,2,22,6);
                line(c,22,18,22,22,17,22);line(c,7,22,2,22,2,18);
                c.drawCircle(7,8,2.2f,pen);c.drawCircle(7,16,2.2f,pen);
                line(c,9,9,18,18);line(c,9,15,18,6);break;
            case "workspaceExit":
                // A hinged door and an outward arrow, separate from pane movement.
                line(c,13,5,13,3,3,3,3,21,13,21,13,19);
                line(c,3,3,8,6,8,21);dot(c,6,12,.7f);
                line(c,11,12,22,12);line(c,18,8,22,12,18,16);break;
            case "landscape":
                c.drawRoundRect(4,7,20,17,2,2,pen);line(c,17,10,17,14);
                c.drawArc(2,2,22,22,200,90,false,pen);line(c,14,2,17,4,14,5);
                c.drawArc(2,2,22,22,20,90,false,pen);line(c,10,19,7,20,10,22);break;
            case "edgeWindow":
                // Small window docks against the emphasized right screen edge.
                line(c,11,3,3,3,3,21,21,21,21,17);line(c,22,2,22,14);
                c.drawRoundRect(11,5,19,14,1.5f,1.5f,pen);line(c,11,8,19,8);
                line(c,5,12,8,12);line(c,6,10,8,12,6,14);break;
            case "wallet":
                line(c,4,7,4,4,18,2,19,7);c.drawRoundRect(2,7,22,21,2,2,pen);
                c.drawRoundRect(15,11,22,17,1.5f,1.5f,pen);dot(c,18,14,1);break;
            case "prev":line(c,15,5,8,12,15,19);break;
            case "next":line(c,9,5,16,12,9,19);break;
            case "mainLeft":case "mainRight":
                c.drawRoundRect(2,3,22,21,2,2,pen);
                float divider="mainLeft".equals(glyph)?17:7;line(c,divider,3,divider,21);
                float center="mainLeft".equals(glyph)?9:15;
                float direction="mainLeft".equals(glyph)?-1:1;
                float side="mainLeft".equals(glyph)?19.5f:4.5f;
                dot(c,side,8,.65f);dot(c,side,12,.65f);dot(c,side,16,.65f);
                line(c,center-3*direction,12,center+3*direction,12);
                line(c,center,9,center+3*direction,12,center,15);
                break;
            case "exitLeft":line(c,12,5,5,12,12,19);line(c,5,12,21,12);break;
            case "exitRight":line(c,12,5,19,12,12,19);line(c,3,12,19,12);break;
            case "close":line(c,5,5,19,19);line(c,19,5,5,19);break;
            case "trash":line(c,4,7,20,7);line(c,9,5,10,3,14,3,15,5);line(c,6,7,7,21,17,21,18,7);line(c,10,10,10,17);line(c,14,10,14,17);break;
            case "grid":for(int y=4;y<=14;y+=10)for(int x=4;x<=14;x+=10)c.drawRoundRect(x,y,x+6,y+6,1.3f,1.3f,pen);break;
            case "torch":line(c,5,4,19,4,16,10,15,12,15,21,9,21,9,12,8,10,5,4);line(c,7,8,17,8);break;
            case "redmagic":case "settings":c.drawCircle(12,12,6.5f,pen);c.drawCircle(12,12,2.3f,pen);
                for(int i=0;i<8;i++){c.save();c.rotate(i*45,12,12);line(c,12,2,12,5);c.restore();}break;
            case "pick":line(c,5,3,19,3,19,21,12,16,5,21,5,3);break;
            case "clipboard":
                line(c,8,4,5,4,5,22,20,22,20,4,17,4);
                c.drawRoundRect(8,2,17,6,1.5f,1.5f,pen);
                line(c,8,11,9,12,11,10);line(c,14,11,17,11);
                line(c,8,17,9,18,11,16);line(c,14,17,17,17);break;
            case "screenshot":
                c.drawCircle(5,7,3,pen);c.drawCircle(5,17,3,pen);
                line(c,7.5f,8.5f,20,21);line(c,7.5f,15.5f,20,3);break;
            case "scan":
                line(c,3,9,3,3,9,3);line(c,15,3,21,3,21,9);line(c,21,15,21,21,15,21);line(c,9,21,3,21,3,15);
                line(c,6,12,18,12);break;
            case "pay":
                c.drawRoundRect(2,5,22,19,2,2,pen);line(c,6,9,6,15);line(c,10,9,10,14);
                line(c,13,9,13,15);line(c,17,9,17,14);break;
            case "transit":
                c.drawRoundRect(5,3,19,18,3,3,pen);line(c,5,11,19,11);line(c,8,18,5,22);
                line(c,16,18,19,22);c.drawPoint(8,15,pen);c.drawPoint(16,15,pen);break;
            case "wifi":c.drawArc(0,4,24,24,212,116,false,pen);c.drawArc(4,9,20,23,216,108,false,pen);c.drawCircle(12,18,1,pen);break;
            case "mobile":line(c,5,17,5,20);line(c,9,13,9,20);line(c,14,9,14,20);line(c,19,4,19,20);break;
            case "bt":line(c,6,6,17,16,12,21,12,3,17,8,6,18);break;
            case "vpn":c.drawCircle(8,10,4,pen);line(c,11,13,19,21,21,19,19,17,20,16);break;
            case "volume":line(c,2,10,6,10,11,5,11,19,6,14,2,14,2,10);c.drawArc(9,6,18,18,-65,130,false,pen);c.drawArc(8,3,22,21,-60,120,false,pen);break;
            case "sun":c.drawCircle(12,12,4,pen);for(int i=0;i<8;i++){c.save();c.rotate(i*45,12,12);line(c,12,2,12,4);c.restore();}break;
            case "record":
                c.drawRoundRect(2,3,22,18,2,2,pen);dot(c,12,10.5f,3.2f);
                line(c,12,18,12,22);line(c,8,22,16,22);break;
        }
        c.restore();
    }
}
