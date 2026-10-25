package ls.augment.com;

import java.io.IOException;
import java.util.*;
import org.json.JSONObject;

/** Settings-document data only. No app catalog, permissions, usage or launch authority. */
final class AtomicWorkbenchAppPreferencesTransfer {
    static final String SECTION="atomicWorkbenchApps";
    private static final int MAX_ENTRIES=8192;
    private AtomicWorkbenchAppPreferencesTransfer(){}
    static final class Import {
        final AtomicWorkbenchAppListModel.State state;
        Import(AtomicWorkbenchAppListModel.State state){this.state=state;}
        boolean included(){return state!=null;}
        String summary(){return included()
                ?"应用列表：替换当前用户的 "+state.entries.size()+" 条显隐、手动顺序、置顶偏好及请求排序模式；不启用工作台，不导入权限或使用记录。"
                :"旧备份未包含应用列表偏好；保留当前显隐、顺序、置顶及排序模式，不写入此项。";}
    }
    static JSONObject exportState(AtomicWorkbenchAppListModel.State state)throws Exception{
        AtomicWorkbenchAppListModel.State checked=validate(state);
        JSONObject entries=new JSONObject();
        for(Map.Entry<String,AtomicWorkbenchAppListModel.Entry> row:checked.entries.entrySet()){
            AtomicWorkbenchAppListModel.Entry entry=row.getValue();
            entries.put(row.getKey(),new JSONObject().put("visible",entry.visible)
                    .put("pinned",entry.pinned).put("order",entry.order));
        }
        return new JSONObject().put("version",1).put("requestedSortMode",checked.mode).put("entries",entries);
    }
    static Import readDocument(JSONObject document,int userId)throws Exception{
        if(!"LS_Augment.settings".equals(document.optString("format")))throw new IOException("不是支持的模块配置文件");
        if(document.optInt("version")==1&&!document.has(SECTION))return new Import(null);
        if(!document.has("version")||integer(document.get("version"))!=2
                ||!document.has(SECTION)||!(document.get(SECTION) instanceof JSONObject))
            throw new IOException("配置版本或应用列表偏好格式不受支持");
        JSONObject section=(JSONObject)document.get(SECTION);
        exact(section,Set.of("version","requestedSortMode","entries"));
        if(integer(section.get("version"))!=1)throw new IOException("应用列表偏好版本不受支持");
        long requested=integer(section.get("requestedSortMode"));
        if(requested<AtomicWorkbenchAppListModel.MANUAL||requested>AtomicWorkbenchAppListModel.INITIAL)
            throw new IOException("应用列表排序模式无效");
        Object raw=section.get("entries");
        if(!(raw instanceof JSONObject))throw new IOException("应用列表记录格式无效");
        JSONObject records=(JSONObject)raw;
        LinkedHashMap<String,AtomicWorkbenchAppListModel.Entry> entries=new LinkedHashMap<>();
        Iterator<String> keys=records.keys();
        while(keys.hasNext()){
            String key=keys.next();
            if(entries.size()>=MAX_ENTRIES||key.isEmpty()||key.length()>1024
                    ||!(records.get(key) instanceof JSONObject))throw new IOException("应用列表记录超过上限或格式无效");
            JSONObject entry=(JSONObject)records.get(key);exact(entry,Set.of("visible","pinned","order"));
            Object visible=entry.get("visible"),pinned=entry.get("pinned");long order=integer(entry.get("order"));
            if(!(visible instanceof Boolean)||!(pinned instanceof Boolean)||order<0)
                throw new IOException("应用列表偏好值无效");
            entries.put(key,new AtomicWorkbenchAppListModel.Entry((Boolean)visible,(Boolean)pinned,order));
        }
        return new Import(validate(new AtomicWorkbenchAppListModel.State(userId,(int)requested,entries)));
    }
    private static long integer(Object value)throws IOException{
        if(!(value instanceof Integer)&&!(value instanceof Long))throw new IOException("配置整数类型无效");
        return ((Number)value).longValue();
    }
    private static void exact(JSONObject value,Set<String> expected)throws IOException{
        HashSet<String> actual=new HashSet<>();Iterator<String> keys=value.keys();
        while(keys.hasNext())actual.add(keys.next());
        if(!actual.equals(expected))throw new IOException("应用列表偏好字段无效");
    }
    private static AtomicWorkbenchAppListModel.State validate(AtomicWorkbenchAppListModel.State state)throws IOException{
        return AtomicWorkbenchAppListModel.decode(AtomicWorkbenchAppListModel.encode(state),state.userId);
    }
}
