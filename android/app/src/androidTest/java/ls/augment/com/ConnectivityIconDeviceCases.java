package ls.augment.com;

import android.content.Context;
import android.graphics.*;
import java.io.*;
import java.util.*;
import org.json.JSONObject;

/** Device-side rendering checks use the exact production painter. */
final class ConnectivityIconDeviceCases {
    private static final int INK=0xff345bd4, MARK=0xff16ad68, RING=0xffb86a40;
    private static final int[] PALETTE={RING,RING,RING,RING,RING};
    private static void check(boolean value,String message){if(!value)throw new AssertionError(message);}
    private static ConnectivityIconState state(int battery,ConnectivityIconState.PowerState power){
        return new ConnectivityIconState(battery,power,true,3,false,20,
                Arrays.asList(new ConnectivityIconState.Sim(10,0,5,5),new ConnectivityIconState.Sim(20,1,3,5)));
    }
    private static Bitmap render(ConnectivityIconPainter painter,ConnectivityIconState state,String[] contents,int[] scales){
        return render(painter,state,contents,scales,new ConnectivityIconLayout());
    }
    private static Bitmap render(ConnectivityIconPainter painter,ConnectivityIconState state,String[] contents,int[] scales,ConnectivityIconLayout layout){
        Bitmap bitmap=Bitmap.createBitmap(600,600,Bitmap.Config.ARGB_8888);
        painter.draw(new Canvas(bitmap),150,150,300,state,INK,6,28,false,contents,scales,PALETTE,null,MARK,layout);
        return bitmap;
    }
    private static Rect bounds(Bitmap bitmap,int color){
        Rect result=new Rect();boolean first=true;
        for(int y=0;y<bitmap.getHeight();y++)for(int x=0;x<bitmap.getWidth();x++)if(bitmap.getPixel(x,y)==color){
            if(first){result.set(x,y,x+1,y+1);first=false;}else result.union(x,y,x+1,y+1);
        }
        return result;
    }
    private static void save(Context context,String name,Bitmap bitmap)throws IOException{
        try(FileOutputStream out=new FileOutputStream(new File(context.getFilesDir(),name))){bitmap.compress(Bitmap.CompressFormat.PNG,100,out);}
        bitmap.recycle();
    }
    static JSONObject run(Context context)throws Exception{
        ConnectivityIconState.PowerState none=ConnectivityIconState.PowerState.NONE,charge=ConnectivityIconState.PowerState.CHARGING,bypass=ConnectivityIconState.PowerState.BYPASS;
        check(ConnectivityIconState.powerState(false,true,1)==none,"Unplugging clears stale bypass/charging state");
        check(ConnectivityIconState.powerState(true,true,0)==charge,"Ordinary charging");
        check(ConnectivityIconState.powerState(true,true,1)==bypass,"Bypass takes priority over battery status");
        check(ConnectivityIconState.powerState(true,false,1)==bypass,"Bypass does not require battery charging");
        check(ConnectivityIconState.powerState(true,false,0)==none,"Plugged but paused must not imply bypass");
        check(ConnectivityIconState.powerState(true,true,2)==charge,"Unknown separation value is not bypass");
        check(state(50,bypass).description().contains("旁路充电")&&!state(50,bypass).charging,"Accessible bypass description");
        check(state(50,charge).description().contains("正在充电"),"Accessible charging description");
        check(state(50,none).sims.get(0).subscriptionId==20,"Data SIM remains first");
        for(String key:ConfigSchema.CONNECTIVITY_SCALE_KEYS){
            check("300".equals(ConfigSchema.normalize(key,"300")),"Persist expanded scale");
            check(ConfigSchema.normalize(key,"301")==null&&ConfigSchema.normalize(key,"49")==null,"Reject out of range scale");
        }
        ConnectivityIconPainter painter=new ConnectivityIconPainter();
        String[] empty={"none","none","none"};int[] base={100,100,100};
        Bitmap ring=render(painter,state(63,none),empty,base);
        for(ConnectivityIconState.PowerState power:new ConnectivityIconState.PowerState[]{charge,bypass}){
            Bitmap other=render(painter,state(63,power),empty,base);
            check(ring.sameAs(other),"Power symbol must not alter ring geometry or appear without digits");other.recycle();
        }
        ring.recycle();int symbolChecks=0,scaleChecks=0;
        for(int region=0;region<3;region++)for(int level:new int[]{0,7,50,100})for(int scale:new int[]{50,150,300}){
            String[] contents={"none","none","none"};contents[region]="battery";int[] sizes={100,100,100};sizes[region]=scale;
            Bitmap normal=render(painter,state(level,charge),contents,sizes),separate=render(painter,state(level,bypass),contents,sizes);
            for(Bitmap image:new Bitmap[]{normal,separate}){
                Rect digits=bounds(image,INK),symbol=bounds(image,MARK);
                check(!digits.isEmpty()&&!symbol.isEmpty(),"Digits and symbol must render");
                check(symbol.left>digits.right,"Power symbol stays to the right of digits with a gap");symbolChecks++;
            }
            check(!normal.sameAs(separate),"Bolt and plug must be visibly distinct");normal.recycle();separate.recycle();
        }
        for(int region=0;region<3;region++)for(String content:ConfigSchema.CONNECTIVITY_CONTENT_VALUES){
            if("none".equals(content))continue;
            String[] contents={"none","none","none"};contents[region]=content;int previous=0;
            for(int scale:new int[]{50,100,150,200,250,300}){
                int[] sizes={100,100,100};sizes[region]=scale;
                Bitmap image=render(painter,state(78,none),contents,sizes);Rect box=bounds(image,INK);
                check(box.width()>previous,"Increasing scale must increase width: "+region+"/"+content+"/"+scale);
                previous=box.width();image.recycle();scaleChecks++;
            }
        }
        Bitmap unknown=render(painter,state(-1,bypass),new String[]{"battery","none","none"},base);
        check(bounds(unknown,MARK).isEmpty(),"No misleading symbol beside unread battery");unknown.recycle();
        Bitmap sheet=Bitmap.createBitmap(1200,840,Bitmap.Config.ARGB_8888);Canvas canvas=new Canvas(sheet);Paint label=new Paint(3);label.setTextSize(20);
        ConnectivityIconState.PowerState[] powers={none,charge,bypass};
        for(int row=0;row<3;row++)for(int col=0;col<4;col++){
            int left=col*300,top=row*280,scale=new int[]{100,150,225,300}[col];
            label.setColor(row==2?0xff18212e:0xffeef4fa);canvas.drawRect(left,top,left+300,top+280,label);
            int fg=row==2?Color.WHITE:0xff15283b;
            painter.draw(canvas,left+70,top+30,160,state(73,powers[row]),fg,6,28,false,
                    new String[]{"wifi","battery","dual"},new int[]{scale,scale,scale},null,null,MARK);
            painter.draw(canvas,left+24,top+210,40,state(100,powers[row]),fg,6,28,false,
                    new String[]{"battery","wifi","dual"},new int[]{scale,scale,scale},null,null,MARK);
            label.setColor(fg);canvas.drawText(powers[row]+" / "+scale+"%",left+78,top+242,label);
        }
        save(context,"connectivity-painter-cases.png",sheet);
        return new JSONObject().put("success",true).put("powerCases",8).put("symbolChecks",symbolChecks)
                .put("scaleChecks",scaleChecks).put("layoutChecks",layoutCases(context,painter)).put("renderCases",12).put("image",new File(context.getFilesDir(),"connectivity-painter-cases.png").getAbsolutePath());
    }
    private static void shifted(Rect before,Rect after,int dx,int dy,String message){
        Rect expected=new Rect(before);expected.offset(dx,dy);
        check(expected.equals(after),message+": expected "+expected+", got "+after);
    }
    private static int layoutCases(Context context,ConnectivityIconPainter painter)throws Exception{
        int checks=0;
        for(String[] keys:new String[][]{ConfigSchema.CONNECTIVITY_X_KEYS,ConfigSchema.CONNECTIVITY_Y_KEYS,ConfigSchema.CONNECTIVITY_POWER_X_KEYS,ConfigSchema.CONNECTIVITY_POWER_Y_KEYS})for(String key:keys){
            check("0".equals(ConfigSchema.defaultValue(key)),"Existing installations keep original position");
            check("-100".equals(ConfigSchema.normalize(key,"-100"))&&"100".equals(ConfigSchema.normalize(key,"100")),"Offset endpoints accepted");
            check(ConfigSchema.normalize(key,"101")==null&&ConfigSchema.normalize(key,"-101")==null,"Offset bounds enforced");checks++;
        }
        Map<String,String> values=new HashMap<>();
        values.put(ConfigSchema.CONNECTIVITY_X_KEYS[0],"-17");values.put(ConfigSchema.CONNECTIVITY_POWER_SCALE_KEYS[1],"230");
        values.put(ConfigSchema.CONNECTIVITY_Y_KEYS[1],"999");
        ConnectivityIconLayout parsed=ConnectivityIconLayout.read(values::get);
        check(parsed.x[0]==-17&&parsed.y[1]==0&&parsed.powerScale[0]==100&&parsed.powerScale[1]==230,"Shared preview/runtime decoder preserves values and falls back safely");
        int[] base={100,100,100};
        for(int region=0;region<3;region++)for(String content:ConfigSchema.CONNECTIVITY_CONTENT_VALUES){
            if("none".equals(content))continue;
            String[] contents={"none","none","none"};contents[region]=content;
            Bitmap original=render(painter,state(73,ConnectivityIconState.PowerState.NONE),contents,base);
            ConnectivityIconLayout layout=new ConnectivityIconLayout();layout.x[region]=7;layout.y[region]=-9;
            Bitmap moved=render(painter,state(73,ConnectivityIconState.PowerState.NONE),contents,base,layout);
            shifted(bounds(original,INK),bounds(moved,INK),21,-27,"Each slot and every content type moves in diameter units");
            layout.x[region]=0;layout.y[region]=0;layout.x[(region+1)%3]=-19;
            Bitmap unrelated=render(painter,state(73,ConnectivityIconState.PowerState.NONE),contents,base,layout);
            check(original.sameAs(unrelated),"Moving empty neighboring slot leaves visible content unchanged");
            original.recycle();moved.recycle();unrelated.recycle();checks+=2;
        }
        for(int region=0;region<3;region++)for(int scale:new int[]{50,100,300})for(int mode=0;mode<2;mode++){
            String[] contents={"none","none","none"};contents[region]="battery";int[] sizes={100,100,100};sizes[region]=scale;
            ConnectivityIconState state=state(73,mode==0?ConnectivityIconState.PowerState.CHARGING:ConnectivityIconState.PowerState.BYPASS);
            Bitmap original=render(painter,state,contents,sizes);
            ConnectivityIconLayout layout=new ConnectivityIconLayout();layout.powerX[mode]=5;layout.powerY[mode]=-6;
            Bitmap moved=render(painter,state,contents,sizes,layout);
            shifted(bounds(original,MARK),bounds(moved,MARK),15,-18,"Power movement is independent of slot scaling");
            check(bounds(original,INK).equals(bounds(moved,INK)),"Moving power symbol does not move digits");
            // Leave room for the enlarged mark: deliberate overlap can cover
            // the digit pixels even though the text geometry is unchanged.
            layout.powerX[mode]=20;layout.powerY[mode]=0;layout.powerScale[mode]=200;
            Bitmap bigger=render(painter,state,contents,sizes,layout);
            check(bounds(bigger,MARK).width()>bounds(original,MARK).width(),"Power symbol enlarges independently");
            check(bounds(original,INK).equals(bounds(bigger,INK)),"Scaling power symbol does not change digits");
            layout.powerX[mode]=0;layout.powerScale[mode]=100;layout.powerX[1-mode]=-15;layout.powerScale[1-mode]=250;
            Bitmap inactive=render(painter,state,contents,sizes,layout);
            check(original.sameAs(inactive),"Changing inactive power state does not affect active state");
            original.recycle();moved.recycle();bigger.recycle();inactive.recycle();checks+=5;
        }
        Bitmap sheet=Bitmap.createBitmap(1200,600,Bitmap.Config.ARGB_8888);Canvas canvas=new Canvas(sheet);canvas.drawColor(0xffeff5fb);
        Paint label=new Paint(3);label.setColor(INK);label.setTextSize(22);
        for(int row=0;row<2;row++)for(int col=0;col<3;col++){
            ConnectivityIconLayout layout=new ConnectivityIconLayout();
            if(col>0){layout.x[0]=-6;layout.y[0]=4;layout.x[1]=5;layout.y[1]=-2;layout.y[2]=-8;}
            if(col==2){layout.powerX[row]=10;layout.powerY[row]=-8;layout.powerScale[row]=180;}
            painter.draw(canvas,col*400+110,row*300+30,180,state(73,row==0?ConnectivityIconState.PowerState.CHARGING:ConnectivityIconState.PowerState.BYPASS),INK,6,28,false,
                    new String[]{"wifi","battery","dual"},base,PALETTE,null,MARK,layout);
            canvas.drawText((row==0?"Bolt":"Plug")+" / "+new String[]{"default","slots moved","symbol moved + 180%"}[col],col*400+20,row*300+266,label);
        }
        save(context,"connectivity-layout-cases.png",sheet);
        return checks+1;
    }
}
