package ls.augment.com;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.graphics.Typeface;
import java.util.Arrays;

/** Original semantic examples, deliberately separate from live OEM artwork and screenshots. */
public final class StatusBarIconSamples {
    private final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Path path=new Path();
    private final ConnectivityIconPainter connectivity=new ConnectivityIconPainter();
    public void draw(Canvas canvas,String id,String state,RectF bounds,int color){
        int save=canvas.save();canvas.translate(bounds.left,bounds.top);canvas.scale(bounds.width()/24f,bounds.height()/24f);
        paint.reset();paint.setAntiAlias(true);paint.setColor(color);paint.setStyle(Paint.Style.STROKE);paint.setStrokeWidth(1.8f);paint.setStrokeCap(Paint.Cap.ROUND);paint.setStrokeJoin(Paint.Join.ROUND);
        try{drawRole(canvas,id,state==null?"default":state,color);}finally{canvas.restoreToCount(save);}
    }
    private void drawRole(Canvas c,String id,String state,int color){
        if(id.endsWith("activity_in")||id.endsWith("activity_out")){boolean down=id.endsWith("in");line(c,12,down?3:21,12,down?21:3);line(c,6,down?15:9,12,down?21:3);line(c,18,down?15:9,12,down?21:3);return;}
        if(id.endsWith(".type")){text(c,"default".equals(state)?"5G":state.toUpperCase(java.util.Locale.ROOT).replace("_PLUS","+"),12,12,11);return;}
        if(id.endsWith(".standard")){text(c,state.startsWith("wifi")?state.substring(4):"6",12,12,18);return;}
        if(id.endsWith(".roaming")){text(c,"R",12,12,18);return;}
        if(id.endsWith(".volte")||id.equals("ims_icon")){text(c,"HD",12,12,13);return;}
        if(id.endsWith(".no_network")){bars(c,0);paint.setStrokeWidth(2.2f);line(c,15,4,21,10);line(c,21,4,15,10);return;}
        if(id.equals("wifi")||id.equals("secondary_wifi")||id.endsWith(".signal")&&id.contains("wifi")){wifi(c,state);return;}
        if(id.startsWith("mobile")){bars(c,level(state,4));return;}
        if(id.equals("dual_signal")){c.save();c.scale(1,.48f);bars(c,4);c.translate(0,26);bars(c,2);c.restore();return;}
        if(id.equals("connectivity")){
            ConnectivityIconState example=new ConnectivityIconState(battery(state),state.equals("bypass")?ConnectivityIconState.PowerState.BYPASS:state.equals("charging")?ConnectivityIconState.PowerState.CHARGING:ConnectivityIconState.PowerState.NONE,true,3,false,1,Arrays.asList(new ConnectivityIconState.Sim(1,0,4),new ConnectivityIconState.Sim(2,1,2)));
            connectivity.draw(c,1,1,22,example,color,6,30,false);return;
        }
        if(id.startsWith("battery")||id.equals("bluetooth.battery")){battery(c,id,state);return;}
        switch(id){
            case "bluetooth":poly(c,6,6,18,17,12,22,12,2,18,7,6,18);break;
            case "hotspot":c.drawCircle(12,12,2,paint);c.drawArc(5,5,19,19,220,280,false,paint);c.drawArc(1,1,23,23,220,280,false,paint);break;
            case "nfc":poly(c,5,19,5,5,9,5,15,16,15,5,19,5,19,19);break;
            case "location":case "privacy.location":pin(c);break;
            case "airplane":poly(c,2,12,10,9,10,3,12,1,14,3,14,9,22,12,22,15,14,13,14,19,17,21,17,23,12,21,7,23,7,21,10,19,10,13,2,15,2,12);break;
            case "vpn":c.drawCircle(8,10,5,paint);poly(c,12,13,20,21,23,18,21,16,19,18);break;
            case "cast":c.drawRoundRect(3,3,22,19,2,2,paint);fill(c);c.drawCircle(3,21,1.6f,paint);stroke();c.drawArc(-4,14,10,28,270,90,false,paint);c.drawArc(-9,9,15,33,270,90,false,paint);break;
            case "connected_display":c.drawRoundRect(2,3,22,17,2,2,paint);line(c,12,17,12,22);line(c,7,22,17,22);break;
            case "ethernet":c.drawRect(5,2,19,10,paint);line(c,12,10,12,15);line(c,4,15,20,15);for(int x:new int[]{4,12,20}){line(c,x,15,x,18);c.drawRect(x-2,18,x+2,22,paint);}break;
            case "data_saver":c.drawCircle(12,12,10,paint);line(c,7,12,17,12);line(c,12,7,12,17);break;
            case "satellite":c.save();c.rotate(-40,12,12);c.drawRect(9,7,15,17,paint);c.drawRect(1,5,7,19,paint);c.drawRect(17,5,23,19,paint);line(c,7,12,9,12);line(c,15,12,17,12);c.restore();break;
            case "alarm_clock":c.drawCircle(12,13,8,paint);line(c,12,13,12,8);line(c,12,13,16,15);line(c,3,5,7,2);line(c,17,2,21,5);line(c,6,20,4,23);line(c,18,20,20,23);break;
            case "zen":c.drawCircle(12,12,10,paint);line(c,6,12,18,12);break;
            case "mute":case "volume":poly(c,3,9,7,9,12,5,12,19,7,15,3,15,3,9);if(id.equals("mute")){line(c,16,8,22,16);line(c,22,8,16,16);}else{c.drawArc(8,5,22,19,-60,120,false,paint);c.drawArc(3,1,27,23,-50,100,false,paint);}break;
            case "headset":c.drawArc(3,2,21,22,180,180,false,paint);c.drawRoundRect(2,11,7,21,2,2,paint);c.drawRoundRect(17,11,22,21,2,2,paint);break;
            case "rotate":c.drawRoundRect(7,3,17,21,2,2,paint);poly(c,3,8,3,3,0,6);poly(c,21,16,21,21,24,18);break;
            case "tty":text(c,"TTY",12,8,8);for(int y=14;y<=20;y+=3)for(int x=3;x<=21;x+=4){fill(c);c.drawCircle(x,y,.8f,paint);}break;
            case "managed_profile":c.drawRoundRect(2,7,22,21,2,2,paint);c.drawRect(8,3,16,7,paint);line(c,2,12,22,12);line(c,10,12,14,12);break;
            case "sensors_off":c.drawCircle(12,12,3,paint);c.drawArc(4,4,20,20,220,220,false,paint);line(c,3,3,21,21);break;
            case "screen_record":c.drawRoundRect(2,4,22,20,3,3,paint);fill(c);c.drawCircle(12,12,5,paint);break;
            case "cooling_fan":c.drawCircle(12,12,2,paint);for(int i=0;i<3;i++){c.save();c.rotate(i*120,12,12);fill(c);c.drawOval(9,1,17,11,paint);c.restore();}break;
            case "liquid_cooling":path.reset();path.moveTo(12,1);path.cubicTo(9,7,4,12,4,16);path.cubicTo(4,25,20,25,20,16);path.cubicTo(20,12,15,7,12,1);c.drawPath(path,paint);line(c,8,16,8,18);break;
            case "refresh_rate":text(c,"default".equals(state)?"120":state.equals("auto")?"A":state,12,10,11);text(c,"Hz",12,20,7);break;
            case "privacy.camera":c.drawRoundRect(2,6,17,19,3,3,paint);poly(c,17,10,23,7,23,18,17,15);break;
            case "privacy.microphone":c.drawRoundRect(8,2,16,15,4,4,paint);c.drawArc(5,6,19,20,0,180,false,paint);line(c,12,20,12,23);line(c,8,23,16,23);break;
            case "privacy.projection":c.drawRoundRect(2,3,22,20,2,2,paint);poly(c,8,13,12,9,16,13);line(c,12,9,12,20);break;
            case "privacy.dot":fill(c);c.drawCircle(12,12,4,paint);break;
            case "privacy.chip":c.drawRoundRect(1,5,23,19,7,7,paint);fill(c);c.drawCircle(8,12,2,paint);c.drawRoundRect(14,8,17,15,1.5f,1.5f,paint);break;
            case "system_activity":c.drawRoundRect(1,5,23,19,7,7,paint);poly(c,5,12,8,12,10,8,13,16,16,12,20,12);break;
            case "user_switcher":case "user_avatar":c.drawCircle(12,7,4,paint);c.drawArc(4,13,20,28,180,180,false,paint);if(id.equals("user_switcher"))poly(c,19,7,22,10,19,13);break;
            default:c.drawRoundRect(4,4,20,20,3,3,paint);text(c,"S",12,12,11);break;
        }
    }
    private void wifi(Canvas c,String state){int level=level(state,3);for(int ring=0;ring<3;ring++){paint.setAlpha(ring<level?255:65);float inset=2+ring*3.5f;c.drawArc(inset,5+ring*3.5f,24-inset,27-ring*3.5f,220,100,false,paint);}paint.setAlpha(255);fill(c);c.drawCircle(12,18.5f,1.5f,paint);stroke();if(state.equals("disconnected"))line(c,4,3,21,21);if(state.equals("no_internet"))text(c,"!",21,16,9);}
    private void bars(Canvas c,int level){fill(c);for(int i=0;i<4;i++){paint.setAlpha(i<level?255:65);c.drawRoundRect(2+i*5,17-i*4,5+i*5,22,1,1,paint);}paint.setAlpha(255);stroke();}
    private void battery(Canvas c,String id,String state){int value=battery(state);if(id.endsWith("charging")){bolt(c);return;}if(id.endsWith("bypass")){poly(c,7,3,7,9,17,9,17,3);c.drawRoundRect(5,8,19,15,2,2,paint);line(c,12,15,12,23);return;}
        if(id.equals("battery.fill")){paint.setStrokeWidth(3);paint.setAlpha(70);c.drawCircle(12,12,9,paint);paint.setAlpha(255);c.drawArc(3,3,21,21,-90,3.6f*value,false,paint);return;}
        c.drawRoundRect(2,5,20,19,2,2,paint);line(c,23,9,23,15);if(!id.equals("battery.shell")){fill(c);c.drawRoundRect(5,8,5+12*value/100f,16,1,1,paint);stroke();}if(state.equals("charging")){c.save();c.translate(7,5);c.scale(.45f,.6f);bolt(c);c.restore();}}
    private void bolt(Canvas c){poly(c,13,1,4,14,11,14,9,23,21,9,14,9,13,1);}
    private int battery(String state){if(state.startsWith("battery"))try{String value=state.substring(7).split("_")[0];return Integer.parseInt(value);}catch(Exception ignored){}return 73;}
    private int level(String state,int fallback){if(state.startsWith("level"))try{return Integer.parseInt(state.substring(5));}catch(Exception ignored){}return state.equals("disconnected")?0:fallback;}
    private void pin(Canvas c){path.reset();path.moveTo(12,23);path.cubicTo(7,17,3,13,3,9);path.cubicTo(3,-2,21,-2,21,9);path.cubicTo(21,13,17,17,12,23);c.drawPath(path,paint);c.drawCircle(12,9,3,paint);}
    private void poly(Canvas c,float... points){path.reset();path.moveTo(points[0],points[1]);for(int i=2;i+1<points.length;i+=2)path.lineTo(points[i],points[i+1]);c.drawPath(path,paint);}
    private void line(Canvas c,float x,float y,float x2,float y2){c.drawLine(x,y,x2,y2,paint);}
    private void fill(Canvas ignored){paint.setStyle(Paint.Style.FILL);}
    private void stroke(){paint.setStyle(Paint.Style.STROKE);}
    private void text(Canvas c,String value,float x,float y,float size){fill(c);paint.setTextAlign(Paint.Align.CENTER);paint.setTypeface(Typeface.create("sans-serif",Typeface.BOLD));paint.setTextSize(size);c.drawText(value,x,y-(paint.ascent()+paint.descent())/2,paint);stroke();}
}
