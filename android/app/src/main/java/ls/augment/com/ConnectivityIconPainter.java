package ls.augment.com;

import android.graphics.*;

/** Original vectors; status bar and its pinned layout preview share this renderer. */
public final class ConnectivityIconPainter {
    private final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);
    private final RectF arc=new RectF();
    private final Path powerSymbol=new Path();
    private static final String[] DEFAULTS={"battery","wifi","dual"};
    private static final int[] SCALES={100,100,100};
    public void draw(Canvas canvas,float left,float top,float size,ConnectivityIconState state,
            int foreground,float ringWidthPercent,int inactivePercent,boolean colored){
        draw(canvas,left,top,size,state,foreground,ringWidthPercent,inactivePercent,colored,DEFAULTS,SCALES);
    }
    public void draw(Canvas canvas,float left,float top,float size,ConnectivityIconState state,
            int foreground,float ringWidthPercent,int inactivePercent,boolean colored,String[] contents,int[] scales){
        draw(canvas,left,top,size,state,foreground,ringWidthPercent,inactivePercent,colored,contents,scales,null);
    }
    public void draw(Canvas canvas,float left,float top,float size,ConnectivityIconState state,
            int foreground,float ringWidthPercent,int inactivePercent,boolean colored,
            String[] contents,int[] scales,int[] batteryColors){
        draw(canvas,left,top,size,state,foreground,ringWidthPercent,inactivePercent,colored,contents,scales,batteryColors,null);
    }
    public void draw(Canvas canvas,float left,float top,float size,ConnectivityIconState state,
            int foreground,float ringWidthPercent,int inactivePercent,boolean colored,
            String[] contents,int[] scales,int[] batteryColors,int[] textColors){
        draw(canvas,left,top,size,state,foreground,ringWidthPercent,inactivePercent,colored,contents,scales,batteryColors,textColors,0xff34c759);
    }
    public void draw(Canvas canvas,float left,float top,float size,ConnectivityIconState state,
            int foreground,float ringWidthPercent,int inactivePercent,boolean colored,
            String[] contents,int[] scales,int[] batteryColors,int[] textColors,int plugColor){
        draw(canvas,left,top,size,state,foreground,ringWidthPercent,inactivePercent,colored,
                contents,scales,batteryColors,textColors,plugColor,new ConnectivityIconLayout());
    }
    public void draw(Canvas canvas,float left,float top,float size,ConnectivityIconState state,
            int foreground,float ringWidthPercent,int inactivePercent,boolean colored,
            String[] contents,int[] scales,int[] batteryColors,int[] textColors,int plugColor,ConnectivityIconLayout layout){
        if(size<=0)return;
        int save=canvas.save();canvas.translate(left,top);canvas.scale(size/100f,size/100f);
        paint.setTypeface(Typeface.create("sans-serif",Typeface.BOLD));paint.setTextSize(20);
        paint.setTextAlign(Paint.Align.CENTER);paint.setStrokeCap(Paint.Cap.ROUND);paint.setStyle(Paint.Style.STROKE);
        float ringStroke=Math.max(3,Math.min(10,ringWidthPercent));
        paint.setStrokeWidth(ringStroke);
        arc.set(7,7,93,93);int dim=dim(foreground,inactivePercent);
        String lower=contents!=null&&contents.length>2?contents[2]:DEFAULTS[2];
        float lowerScale=contentScale(scales,2);
        // The built-in gap belongs to the original lower signal position only.
        boolean ringSignal=layout.x[2]==0&&layout.y[2]==0&&!state.sims.isEmpty()&&("dual".equals(lower)||"data".equals(lower));
        float signalGap=ringSignal?(float)Math.toDegrees(
                (state.barCount(0)-1)*dotSpacing(lowerScale)/2/43f
                +Math.asin((dotRadius(lowerScale)+ringStroke/2+1.1f)/43f)):0;
        if(ringSignal&&"dual".equals(lower)&&state.sims.size()>1){
            float innerGap=(float)Math.toDegrees((state.barCount(1)-1)*dotSpacing(lowerScale)/2/35.5f
                    +Math.asin((dotRadius(lowerScale)+ringStroke/2+1.1f)/35.5f));
            signalGap=Math.max(signalGap,innerGap);
        }
        float total=280-2*signalGap,progress=total*state.batteryFraction();
        paint.setColor(dim);
        batteryArc(canvas,0,total,signalGap);
        int ring=colored?(state.charging?0xff29b879:state.battery<=20?0xffe34a50:foreground):foreground;
        if(batteryColors!=null&&batteryColors.length>=4&&state.battery>=0){
            int band=SystemUiPolicy.batteryBand(state.battery);
            ring=state.charging&&batteryColors.length>=5?batteryColors[4]:batteryColors[band];
        }
        int alpha=batteryColors!=null&&batteryColors.length>=4?Color.alpha(ring):Color.alpha(foreground);
        ring=(ring&0xffffff)|(alpha<<24);paint.setColor(ring);
        batteryArc(canvas,0,progress,signalGap);
        for(int region=0;region<3;region++){
            String content=contents!=null&&region<contents.length?contents[region]:DEFAULTS[region];
            float scale=contentScale(scales,region);
            int regionSave=canvas.save();canvas.translate(layout.x[region],layout.y[region]);
            if("dual".equals(content)||"data".equals(content)||"other".equals(content)){
                signalDots(canvas,state,content,region,scale,foreground,dim);
                canvas.restoreToCount(regionSave);
                continue;
            }
            float cy=region==0?23:region==1?49:73;
            boolean batteryContent="battery".equals(content);
            float maxW=region==1?(batteryContent?62:56):40,maxH=region==1?(batteryContent?36:24):(batteryContent?26:18);
            int part=canvas.save();canvas.translate(50,cy);
            float naturalW=batteryContent?52:"wifi".equals(content)?44:42;
            float naturalH="wifi".equals(content)?30:batteryContent?32:18;
            // Keep the original 150% reference size; raising the allowed maximum
            // must enlarge content rather than shrinking existing configurations.
            float regionFit=Math.min(maxW/naturalW,maxH/naturalH);
            // Preserve linear scaling through the full 50%..300% range.
            float fitted=regionFit*(scale/1.5f);
            canvas.scale(fitted,fitted);
            if("battery".equals(content))battery(canvas,state,paletteColor(state,textColors,foreground),plugColor,layout,fitted);
            else if("wifi".equals(content))wifi(canvas,state,foreground,dim);
            canvas.restoreToCount(part);
            canvas.restoreToCount(regionSave);
        }
        canvas.restoreToCount(save);
    }
    private static float contentScale(int[] scales,int region){
        int value=scales!=null&&region<scales.length?scales[region]:100;
        return Math.max(ConfigSchema.CONNECTIVITY_SCALE_MIN,Math.min(ConfigSchema.CONNECTIVITY_SCALE_MAX,value))/100f;
    }
    private void batteryArc(Canvas canvas,float from,float to,float halfGap){
        if(to<=from)return;
        float first=140-halfGap;
        if(halfGap<=0){canvas.drawArc(arc,230-from,from-to,false,paint);return;}
        float stop=Math.min(to,first);
        if(stop>from)canvas.drawArc(arc,230-from,from-stop,false,paint);
        float start=Math.max(from,first);
        if(to>start)canvas.drawArc(arc,230-start-2*halfGap,start-to,false,paint);
    }
    private static float dotRadius(float scale){return 2.15f*scale;}
    private static float dotSpacing(float scale){return 6.96f*scale;}
    private void signalDots(Canvas canvas,ConnectivityIconState state,String content,int region,float scale,int color,int dim){
        int first="other".equals(content)?1:0;
        int rows="dual".equals(content)?state.sims.size():state.sims.size()>first?1:0;
        // At the bottom the data SIM sits on the battery ring itself, with the
        // other SIM inside. Equal arc-length spacing keeps both rows compact.
        float centerY=region==1?19:50;
        float dot=dotRadius(scale);
        paint.setStyle(Paint.Style.FILL);
        for(int row=0;row<rows;row++){
            int sim=first+row,levels=state.barCount(sim),lit=state.litDots(sim);
            float radius=region==2?(sim==0?43:35.5f):rows==1?34:region==0?(row==0?34:26.5f):(row==0?26.5f:34);
            for(int level=0;level<levels;level++){
                float offset=(level-(levels-1)/2f)*dotSpacing(scale)/radius;
                double angle=(region==0?Math.PI*1.5:Math.PI/2)+(region==0?offset:-offset);
                paint.setColor(level<lit?color:dim);
                canvas.drawCircle(50+radius*(float)Math.cos(angle),centerY+radius*(float)Math.sin(angle),dot,paint);
            }
        }
    }
    private static int paletteColor(ConnectivityIconState state,int[] colors,int fallback){
        if(colors==null||colors.length<4||state.battery<0)return fallback;
        return state.charging&&colors.length>=5?colors[4]:colors[SystemUiPolicy.batteryBand(state.battery)];
    }
    private void battery(Canvas canvas,ConnectivityIconState state,int color,int symbolColor,ConnectivityIconLayout layout,float fitted){
        paint.setStyle(Paint.Style.FILL);paint.setColor(color);paint.setTextSize(32);
        String text=state.battery<0?"—":String.valueOf(state.battery);
        float measured=paint.measureText(text);
        if(measured>52){paint.setTextSize(32*52/measured);measured=paint.measureText(text);}
        boolean showSymbol=state.battery>=0&&(state.charging||state.bypassCharging);
        float gap=3,symbolWidth=12,extra=showSymbol?gap+symbolWidth:0;
        Paint.FontMetrics fm=paint.getFontMetrics();
        // Center the complete number + symbol group, with a measured clear gap.
        canvas.drawText(text,-extra/2,-(fm.ascent+fm.descent)/2,paint);
        if(showSymbol){
            int save=canvas.save();canvas.translate(-extra/2+measured/2+gap+symbolWidth/2,0);
            int mode=state.bypassCharging?1:0;
            canvas.translate(layout.powerX[mode]/fitted,layout.powerY[mode]/fitted);
            float symbolScale=layout.powerScale[mode]/100f;canvas.scale(symbolScale,symbolScale);
            powerSymbol(canvas,state.bypassCharging,symbolColor);
            canvas.restoreToCount(save);
        }
    }
    private void powerSymbol(Canvas canvas,boolean bypass,int color){
        paint.setColor(color);paint.setStyle(Paint.Style.FILL);
        powerSymbol.reset();
        if(bypass){
            // Upright two-pin plug, anchored beside the digits; no ring leads.
            canvas.drawRoundRect(-4.5f,-10,-2,-3,1,1,paint);
            canvas.drawRoundRect(2,-10,4.5f,-3,1,1,paint);
            powerSymbol.moveTo(-6,-4);powerSymbol.lineTo(6,-4);powerSymbol.lineTo(6,1);
            powerSymbol.quadTo(6,6,0,6);powerSymbol.quadTo(-6,6,-6,1);powerSymbol.close();
            canvas.drawPath(powerSymbol,paint);
            canvas.drawRoundRect(-1.5f,4,1.5f,10,1,1,paint);
        }else{
            powerSymbol.moveTo(2,-11);powerSymbol.lineTo(-6,1);powerSymbol.lineTo(-1,1);
            powerSymbol.lineTo(-3,11);powerSymbol.lineTo(6,-2);powerSymbol.lineTo(1,-2);powerSymbol.close();
            canvas.drawPath(powerSymbol,paint);
        }
    }
    private void wifi(Canvas canvas,ConnectivityIconState state,int color,int dim){
        paint.setStyle(Paint.Style.STROKE);paint.setStrokeWidth(4);
        for(int i=3;i>=1;i--){float r=i*8;arc.set(-r,11-r,r,11+r);
            paint.setColor(state.wifiConnected&&state.wifiLevel>=i?color:dim);canvas.drawArc(arc,222,96,false,paint);}
        paint.setStyle(Paint.Style.FILL);paint.setColor(state.wifiConnected?color:dim);canvas.drawCircle(0,11,2.5f,paint);
        if(!state.wifiConnected){paint.setStyle(Paint.Style.STROKE);paint.setStrokeWidth(3);paint.setColor(color);canvas.drawLine(-16,-12,16,14,paint);}
    }
    private static int dim(int color,int percent){return (color&0xffffff)|((Color.alpha(color)*Math.max(10,Math.min(65,percent))/100)<<24);}
}
