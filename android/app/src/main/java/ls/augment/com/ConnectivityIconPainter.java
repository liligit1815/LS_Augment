package ls.augment.com;

import android.graphics.*;

/** Original vectors; status bar and its pinned layout preview share this renderer. */
public final class ConnectivityIconPainter {
    private Typeface typeface;
    public void setTypeface(Typeface value){typeface=value;}
    private ArtworkLayers artwork;
    private boolean wifiContrast=true;
    // A generic callback cannot reveal a foreground layer without drawing it.
    // Keep imported artwork unchanged unless the owner confirms no Wi-Fi layer.
    public void setArtwork(ArtworkLayers value){artwork=value;wifiContrast=value==null;}
    public void setWifiContrast(boolean enabled){wifiContrast=enabled;}
    private final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);
    private final RectF arc=new RectF();
    private final Path powerSymbol=new Path();
    private final Path wifiShape=new Path(),wifiCore=new Path(),wifiOutline=new Path();
    private CircleConnectivityPlan preparedPlan;
    private Typeface preparedTypeface;
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
        drawInternal(canvas,left,top,size,state,foreground,ringWidthPercent,inactivePercent,colored,contents,scales,batteryColors,textColors,plugColor,layout,null);
    }
    /** False means no drawing occurred: the caller must use its explicit fallback. */
    public boolean drawPlanned(Canvas canvas,float left,float top,CircleConnectivityPlan plan,ConnectivityIconState state,
            int foreground,float ringWidthPercent,int inactivePercent,boolean colored,String[] contents,int[] scales,
            int[] batteryColors,int[] textColors,int plugColor,ConnectivityIconLayout layout){
        if(plan==null||!plan.accepted||plan!=preparedPlan||preparedTypeface!=typeface
                ||!plan.matches(plan.diameterPx,state,contents,scales,ringWidthPercent,layout,wifiContrast))return false;
        drawInternal(canvas,left+plan.originX,top+plan.originY,plan.diameterPx,state,foreground,ringWidthPercent,inactivePercent,
                colored,contents,scales,batteryColors,textColors,plugColor,layout,plan);
        return true;
    }
    private void drawInternal(Canvas canvas,float left,float top,float size,ConnectivityIconState state,
            int foreground,float ringWidthPercent,int inactivePercent,boolean colored,String[] contents,int[] scales,
            int[] batteryColors,int[] textColors,int plugColor,ConnectivityIconLayout layout,CircleConnectivityPlan plan){
        if(size<=0)return;
        int save=canvas.save();canvas.translate(left,top);canvas.scale(size/100f,size/100f);
        paint.setTypeface(typeface!=null?typeface:Typeface.create("sans-serif",Typeface.BOLD));paint.setTextSize(20);
        paint.setTextAlign(Paint.Align.CENTER);paint.setStrokeCap(Paint.Cap.ROUND);paint.setStyle(Paint.Style.STROKE);
        float ringStroke=Math.max(3,Math.min(10,ringWidthPercent));
        paint.setStrokeWidth(ringStroke);
        arc.set(7,7,93,93);int dim=dim(foreground,inactivePercent);
        float signalGap=plan==null?ConnectivityIconLayout.signalGap(state,contents,scales,ringWidthPercent,layout):plan.signalGap;
        String upper=contents!=null&&contents.length>0?contents[0]:DEFAULTS[0];
        boolean closedTop="none".equals(upper);
        float startAngle=closedTop?270:230;
        float total=(closedTop?360:280)-2*signalGap,progress=total*state.batteryFraction();
        paint.setColor(dim);
        if(artwork==null||!artwork.draw(canvas,"battery.shell","whole",0,0,100,100,dim)){
            if(artwork!=null)artwork.draw(canvas,"battery.shell","background",0,0,100,100,dim);
            batteryArc(canvas,0,total,signalGap,startAngle);
            if(artwork!=null)artwork.draw(canvas,"battery.shell","foreground",0,0,100,100,dim);
        }
        int ring=colored?(state.charging?0xff29b879:state.battery<=20?0xffe34a50:foreground):foreground;
        if(batteryColors!=null&&batteryColors.length>=4&&state.battery>=0){
            int band=SystemUiPolicy.batteryBand(state.battery);
            ring=state.charging&&batteryColors.length>=5?batteryColors[4]:batteryColors[band];
        }
        int alpha=batteryColors!=null&&batteryColors.length>=4?Color.alpha(ring):Color.alpha(foreground);
        ring=(ring&0xffffff)|(alpha<<24);paint.setColor(ring);
        if(artwork==null||!artwork.draw(canvas,"battery.fill","whole",0,0,100,100,ring)){
            if(artwork!=null)artwork.draw(canvas,"battery.fill","background",0,0,100,100,ring);
            batteryArc(canvas,0,progress,signalGap,startAngle);
            if(artwork!=null)artwork.draw(canvas,"battery.fill","foreground",0,0,100,100,ring);
        }
        for(int region=0;region<3;region++){
            String content=contents!=null&&region<contents.length?contents[region]:DEFAULTS[region];
            float scale=contentScale(scales,region);
            int regionSave=canvas.save();canvas.translate(layout.x[region],layout.y[region]);
            if("dual".equals(content)||"data".equals(content)||"other".equals(content)){
                signalDots(canvas,state,content,region,scale,foreground,dim,plan);
                canvas.restoreToCount(regionSave);
                continue;
            }
            float cy=region==0?23:region==1?49:73;
            if("wifi".equals(content))shift(canvas,plan,region,-1,size);
            int part=canvas.save();canvas.translate(50,cy);
            float fitted=ConnectivityIconLayout.contentFit(content,region,scale);
            canvas.scale(fitted,fitted);
            if("battery".equals(content))battery(canvas,state,paletteColor(state,textColors,foreground),plugColor,layout,fitted);
            else if("wifi".equals(content))wifi(canvas,state,foreground,dim);
            canvas.restoreToCount(part);
            canvas.restoreToCount(regionSave);
        }
        canvas.restoreToCount(save);
    }
    private static float contentScale(int[] scales,int region){return ConnectivityIconLayout.contentScale(scales,region);}
    private static void shift(Canvas canvas,CircleConnectivityPlan plan,int region,int slot,float diameter){
        if(plan==null)return;CircleConnectivityPlan.Cell c=plan.cell(region,slot);
        if(c!=null)canvas.translate(c.dx*100/diameter,c.dy*100/diameter);
    }
    /** All stationary paint bounds are measured by the same typeface as the draw path. */
    public CircleConnectivityPlan plan(float diameter,float density,ConnectivityIconState state,String[] contents,int[] scales,
            float stroke,ConnectivityIconLayout layout,CircleConnectivityPlan.Edges edges,boolean rtl,
            CircleConnectivityPlan.Footprints artwork,float maxWidth,float maxHeight,boolean ringArtwork,boolean wholeCovered){
        return plan(diameter,density,state,contents,scales,stroke,layout,edges,rtl,artwork,maxWidth,maxHeight,ringArtwork,wholeCovered,id->true);
    }
    public CircleConnectivityPlan plan(float diameter,float density,ConnectivityIconState state,String[] contents,int[] scales,
            float stroke,ConnectivityIconLayout layout,CircleConnectivityPlan.Edges edges,boolean rtl,
            CircleConnectivityPlan.Footprints artwork,float maxWidth,float maxHeight,boolean ringArtwork,boolean wholeCovered,java.util.function.Predicate<String> shown){
        java.util.List<CircleConnectivityPlan.Box> blockers=new java.util.ArrayList<>();
        Paint p=new Paint(Paint.ANTI_ALIAS_FLAG);p.setTypeface(typeface!=null?typeface:Typeface.create("sans-serif",Typeface.BOLD));
        for(int region=0;region<3;region++)if(ConnectivityIconLayout.content(contents,region).equals("battery")){
            float fit=ConnectivityIconLayout.contentFit("battery",region,contentScale(scales,region)),u=diameter/100;
            String text=state.battery<0?"—":String.valueOf(state.battery);p.setTextSize(32);
            float measured=p.measureText(text);if(measured>52){p.setTextSize(32*52/measured);measured=p.measureText(text);}
            boolean symbol=state.battery>=0&&(state.charging||state.bypassCharging);float extra=symbol?15:0;
            Paint.FontMetrics fm=p.getFontMetrics();float baseline=-(fm.ascent+fm.descent)/2;
            Rect ink=new Rect();p.getTextBounds(text,0,text.length(),ink);
            float x=50+layout.x[region],y=(region==0?23:region==1?49:73)+layout.y[region];
            blockers.add(new CircleConnectivityPlan.Box((x+(-extra/2-measured/2+ink.left)*fit)*u,
                    (y+(baseline+ink.top)*fit)*u,(x+(-extra/2-measured/2+ink.right)*fit)*u,(y+(baseline+ink.bottom)*fit)*u));
            if(symbol){int mode=state.bypassCharging?1:0;float ss=layout.powerScale[mode]/100f;
                float sx=x+(-extra/2+measured/2+9)*fit+layout.powerX[mode],sy=y+layout.powerY[mode];
                CircleConnectivityPlan.Box box=new CircleConnectivityPlan.Box((sx-6*ss*fit)*u,(sy-12*ss*fit)*u,(sx+6*ss*fit)*u,(sy+12*ss*fit)*u);
                String id=state.bypassCharging?"battery.bypass":"battery.charging";
                CircleConnectivityPlan.Box art=artwork==null?box:artwork.get(region,id,box);
                if(art==null||!art.valid())throw new IllegalArgumentException("Unmeasured power artwork canvas");
                if(shown.test(id))blockers.add(box.union(art));
            }
        }
        preparedPlan=CircleConnectivityPlan.create(diameter,density,state,contents,scales,stroke,layout,edges,rtl,blockers,artwork,maxWidth,maxHeight,ringArtwork,wholeCovered,shown,wifiContrast);
        preparedTypeface=typeface;return preparedPlan;
    }
    private void batteryArc(Canvas canvas,float from,float to,float halfGap,float startAngle){
        if(to<=from)return;
        float first=startAngle-90-halfGap;
        if(halfGap<=0){canvas.drawArc(arc,startAngle-from,from-to,false,paint);return;}
        float stop=Math.min(to,first);
        if(stop>from)canvas.drawArc(arc,startAngle-from,from-stop,false,paint);
        float start=Math.max(from,first);
        if(to>start)canvas.drawArc(arc,startAngle-start-2*halfGap,start-to,false,paint);
    }
    private static float dotRadius(float scale){return 2.15f*scale;}
    private static float dotSpacing(float scale){return 6.96f*scale;}
    private void signalDots(Canvas canvas,ConnectivityIconState state,String content,int region,float scale,int color,int dim,CircleConnectivityPlan plan){
        int first="other".equals(content)?state.otherDataRow():"data".equals(content)?state.activeDataRow():0;
        int rows="dual".equals(content)?state.sims.size():first>=0&&state.sims.size()>first?1:0;
        // At the bottom the data SIM sits on the battery ring itself, with the
        // other SIM inside. Equal arc-length spacing keeps both rows compact.
        float centerY=region==1?19:50;
        float dot=dotRadius(scale);
        paint.setStyle(Paint.Style.FILL);
        for(int row=0;row<rows;row++){
            int sim=first+row,levels=state.barCount(sim),lit=state.litDots(sim);
            float radius=ConnectivityIconLayout.signalRadius(region,row,sim,rows);
            String semantic="mobile"+(state.sims.get(sim).slot+1)+".signal";
            float[] bounds=ConnectivityIconLayout.signalBox(state,region,row,sim,rows,scale);
            float l=bounds[0],t=bounds[1],r=bounds[2],b=bounds[3];
            int save=canvas.save();
            shift(canvas,plan,region,state.sims.get(sim).slot,plan==null?100:plan.diameterPx);
            try {
            if(artwork!=null&&artwork.draw(canvas,semantic,"whole",l,t,r,b,color))continue;
            if(artwork!=null)artwork.draw(canvas,semantic,"background",l,t,r,b,color);
            for(int level=0;level<levels;level++){
                float offset=(level-(levels-1)/2f)*dotSpacing(scale)/radius;
                double angle=(region==0?Math.PI*1.5:Math.PI/2)+(region==0?offset:-offset);
                paint.setColor(level<lit?color:dim);
                canvas.drawCircle(50+radius*(float)Math.cos(angle),centerY+radius*(float)Math.sin(angle),dot,paint);
            }
            if(artwork!=null)artwork.draw(canvas,semantic,"foreground",l,t,r,b,color);
            }finally{canvas.restoreToCount(save);}
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
        String role=bypass?"battery.bypass":"battery.charging";
        if(artwork!=null&&artwork.draw(canvas,role,"whole",-6,-12,6,12,color))return;
        if(artwork!=null)artwork.draw(canvas,role,"background",-6,-12,6,12,color);
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
        if(artwork!=null)artwork.draw(canvas,role,"foreground",-6,-12,6,12,color);
    }
    private void wifi(Canvas canvas,ConnectivityIconState state,int color,int dim){
        if(!state.wifiKnown)return;
        if(artwork!=null&&artwork.draw(canvas,"wifi.signal","whole",-24,-13,24,14,color))return;
        if(artwork!=null)artwork.draw(canvas,"wifi.signal","background",-24,-13,24,14,color);
        int arcs=Math.round(state.wifiLevel*3f/state.wifiBars);
        paint.setStyle(Paint.Style.STROKE);paint.setStrokeWidth(4);
        for(int i=3;i>=1;i--){float r=i*8;arc.set(-r,11-r,r,11+r);
            paint.setColor(state.wifiConnected&&arcs>=i?color:dim);
            if(wifiContrast){wifiShape.reset();wifiShape.addArc(arc,222,96);wifiOutline(canvas);}
            canvas.drawArc(arc,222,96,false,paint);}
        paint.setStyle(Paint.Style.FILL);paint.setColor(state.wifiConnected?color:dim);
        if(wifiContrast){wifiShape.reset();wifiShape.addCircle(0,11,2.5f,Path.Direction.CW);wifiOutline(canvas);}
        canvas.drawCircle(0,11,2.5f,paint);
        if(state.wifiConnected&&state.wifiInternet==ConnectivityIconState.WifiInternet.NO_INTERNET){
            // Warning stays within the existing Wi-Fi glyph footprint, beside its arcs.
            paint.setStyle(Paint.Style.STROKE);paint.setStrokeWidth(3);paint.setColor(color);
            if(wifiContrast){wifiShape.reset();wifiShape.moveTo(18,-2);wifiShape.lineTo(18,4);wifiOutline(canvas);}
            canvas.drawLine(18,-2,18,4,paint);
            paint.setStyle(Paint.Style.FILL);
            if(wifiContrast){wifiShape.reset();wifiShape.addCircle(18,8,1.5f,Path.Direction.CW);wifiOutline(canvas);}
            canvas.drawCircle(18,8,1.5f,paint);
        }
        if(!state.wifiConnected){paint.setStyle(Paint.Style.STROKE);paint.setStrokeWidth(3);paint.setColor(color);
            if(wifiContrast){wifiShape.reset();wifiShape.moveTo(-16,-12);wifiShape.lineTo(16,14);wifiOutline(canvas);}
            canvas.drawLine(-16,-12,16,14,paint);}
        if(artwork!=null)artwork.draw(canvas,"wifi.signal","foreground",-24,-13,24,14,color);
    }
    /** Draw only outside the native ink; a translucent core must not gain alpha. */
    private void wifiOutline(Canvas canvas){
        Paint.Style style=paint.getStyle();float stroke=paint.getStrokeWidth();int color=paint.getColor();
        try{
            paint.getFillPath(wifiShape,wifiCore);
            paint.setStyle(style==Paint.Style.STROKE?Paint.Style.STROKE:Paint.Style.FILL_AND_STROKE);
            paint.setStrokeWidth((style==Paint.Style.STROKE?stroke:0)+2*CircleConnectivityPlan.WIFI_CONTRAST_INSET);
            paint.getFillPath(wifiShape,wifiOutline);
            if(!wifiOutline.op(wifiCore,Path.Op.DIFFERENCE))return;
            int brightness=Color.red(color)*299+Color.green(color)*587+Color.blue(color)*114;
            paint.setStyle(Paint.Style.FILL);
            paint.setColor((color&0xff000000)|(brightness>=128000?0:0xffffff));
            canvas.drawPath(wifiOutline,paint);
        }finally{paint.setStyle(style);paint.setStrokeWidth(stroke);paint.setColor(color);}
    }
    private static int dim(int color,int percent){return (color&0xffffff)|((Color.alpha(color)*Math.max(10,Math.min(65,percent))/100)<<24);}
}
