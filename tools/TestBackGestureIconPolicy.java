package ls.augment.com;

import java.util.HashMap;
import java.util.Map;

public final class TestBackGestureIconPolicy {
    private static void require(boolean value,String message){if(!value)throw new AssertionError(message);}
    public static void main(String[] args){
        Map<String,String> values=new HashMap<>(ConfigSchema.defaults());
        String a="a".repeat(64),b="b".repeat(64);
        values.put(BackGestureIconPolicy.key(0,"asset"),a);values.put(BackGestureIconPolicy.key(1,"asset"),b);
        values.put(BackGestureIconPolicy.key(0,"background_asset"),b);
        values.put(BackGestureIconPolicy.key(0,"mode"),"1");values.put(BackGestureIconPolicy.key(1,"mode"),"1");
        BackGestureIconPolicy.Side left=new BackGestureIconPolicy.Side(values::get,0),right=new BackGestureIconPolicy.Side(values::get,1);
        require(left.custom&&right.custom&&left.hash.equals(a)&&right.hash.equals(b),"independent images");
        require(left.backgroundHash.equals(b)&&right.backgroundHash.isEmpty(),"background preset is independently optional");
        values.put(BackGestureIconPolicy.key(0,"mode"),"0");
        require(!new BackGestureIconPolicy.Side(values::get,0).custom&&new BackGestureIconPolicy.Side(values::get,1).custom,"independent reset");
        require(BackGestureIconPolicy.eligible(0,false,true)&&BackGestureIconPolicy.eligible(1,false,true),"both physical edges");
        require(!BackGestureIconPolicy.eligible(2,false,true)&&!BackGestureIconPolicy.eligible(-1,false,true),"bottom and unknown bypass");
        require(!BackGestureIconPolicy.eligible(0,true,true)&&!BackGestureIconPolicy.eligible(1,false,false),"hover and other actions bypass");
        for(String key:BackGestureIconPolicy.parameterKeys())require(ConfigSchema.contains(key),"registered parameter "+key);
        require(ConfigSchema.normalize(BackGestureIconPolicy.key(0,"asset"),"../secret")==null,"reject file path");
        require(ConfigSchema.normalize(BackGestureIconPolicy.key(0,"asset"),a.toUpperCase())==null,"canonical hash");
        require(ConfigSchema.normalize(BackGestureIconPolicy.key(1,"scale_percent"),"1001")==null,"scale bound");
        require("1000".equals(ConfigSchema.normalize(BackGestureIconPolicy.key(0,"scale_percent"),"1000")),"10x icon accepted");
        require("1000".equals(ConfigSchema.normalize(BackGestureIconPolicy.key(0,"background_scale_percent"),"1000")),"10x mask accepted");
        values.put(BackGestureIconPolicy.key(0,"scale_percent"),"1000");
        values.put(BackGestureIconPolicy.key(0,"background_scale_percent"),"350");
        left=new BackGestureIconPolicy.Side(values::get,0);
        int[] large=new int[4];BackGestureIconPolicy.bounds(0,400,24,424,1080,2400,1,0,left,large);
        require(large[2]-large[0]==240&&left.backgroundScale==350,"real icon geometry expands independently of mask");
        values.put(BackGestureIconPolicy.key(0,"scale_percent"),"100");
        require(BackGestureIconPolicy.alpha(120,50)==60&&BackGestureIconPolicy.alpha(0,100)==0,"preserve native fade");
        for(int side=0;side<2;side++)values.put(BackGestureIconPolicy.key(side,"inset_dp"),"10");
        left=new BackGestureIconPolicy.Side(values::get,0);right=new BackGestureIconPolicy.Side(values::get,1);
        int[] l=new int[4],r=new int[4];
        BackGestureIconPolicy.bounds(40,40,60,60,100,100,1,0,left,l);
        BackGestureIconPolicy.bounds(40,40,60,60,100,100,1,1,right,r);
        require(l[0]==50&&r[0]==30,"inward offset has opposite physical directions");
        values.put(BackGestureIconPolicy.key(0,"scale_percent"),"200");
        left=new BackGestureIconPolicy.Side(values::get,0);
        BackGestureIconPolicy.bounds(0,0,24,24,32,32,3,0,left,l);
        require(l[0]>=0&&l[1]>=0&&l[2]<=32&&l[3]<=32,"clip-safe extreme size and offset");
        ConfigSnapshot snapshot=ConfigSnapshot.create(8,100,values);
        require(snapshot!=null&&ConfigSnapshot.parse(snapshot.serialize()).get(BackGestureIconPolicy.key(1,"asset")).equals(b),"snapshot preserves right asset");
        require("0".equals(ConfigSchema.defaults().get(BackGestureIconPolicy.ENABLED)),"off by default and reset");
        System.out.println("Back gesture icon policy passed");
    }
}
