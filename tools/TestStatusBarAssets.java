package ls.augment.com;

import java.util.*;

public final class TestStatusBarAssets {
    private static final String A="a".repeat(64),B="b".repeat(64);
    private static void check(boolean value,String message){if(!value)throw new AssertionError(message);}
    private static StatusBarThemeSpec.Binding binding(String id,String state,String layer,String hash){return new StatusBarThemeSpec.Binding(id,state,layer,hash,false,100,0,0,100,false);}
    public static void main(String[] args)throws Exception {
        StatusBarThemeSpec spec=StatusBarThemeSpec.empty().with(binding("battery","battery0_19","whole",A))
                .with(binding("battery","charging","whole",B)).with(binding("wifi","default","background",A));
        check(spec.resolve("battery",new String[]{"charging","battery12"},"whole").asset.equals(B),"charging takes precedence over remaining charge");
        check(spec.resolve("battery",new String[]{"battery19"},"whole").asset.equals(A),"inclusive battery upper endpoint");
        check(spec.resolve("battery",new String[]{"battery20"},"whole")==null,"missing battery state must keep native graphic");
        check(spec.resolve("wifi",new String[]{"level3"},"background").asset.equals(A),"default layer fallback");
        check(spec.resolve("wifi",new String[]{"level3"},"whole")==null,"background must never mask native live signal");
        check(spec.resolve("mobile1",new String[]{"level3"},"background")==null,"bindings never leak to other roles");
        check(StatusBarThemeSpec.parse(spec.serialize()).serialize().equals(spec.serialize()),"portable canonical roundtrip");
        check(StatusBarThemeSpec.parse(spec.serialize()+";"+spec.serialize().substring(2).split(";")[0])==null,"duplicate mapping rejected");
        check(StatusBarThemeSpec.parse("2;future")==null,"unknown format rejected");
        check(StatusBarThemeSpec.parse("1;wifi,default,whole,../../file,0,100,0,0,100,0")==null,"path cannot replace content hash");
        check(StatusBarThemeSpec.parse("1;wifi,default,whole,"+A+",2,100,0,0,100,0")==null,"invalid boolean rejected");
        check(StatusBarThemeSpec.parse("1;wifi,default,whole,"+A+",0,100,-2147483648,0,100,0")==null,"offset integer overflow rejected");
        try{spec.with(binding("battery","battery10_30","whole",B));throw new AssertionError("overlapping battery ranges accepted");}catch(IllegalArgumentException expected){ }
        check(spec.without("battery").entries().size()==1,"single-icon restore keeps other roles");
        check(spec.entries().size()==3,"immutable editing supports undo");
        StatusBarFontSpec fonts=StatusBarFontSpec.empty().with("global","font:"+A).with("clock","font:"+B).with("battery","original");
        check(fonts.resolve("clock").equals("font:"+B),"role font overrides global");
        check(fonts.resolve("network").equals("font:"+A),"unconfigured role inherits global");
        check(fonts.resolve("battery").equals("original"),"explicit original bypasses global");
        check(fonts.with("clock","inherit").resolve("clock").equals("font:"+A),"clearing override resumes inheritance");
        check(StatusBarFontSpec.parse("1;global=font:"+A+";global=original")==null,"ambiguous font roles rejected");
        check(StatusBarFontSpec.parse("1;notifications=font:"+A)==null,"notification fonts outside scope");
        Map<String,String> config=new LinkedHashMap<>(ConfigSchema.runtimeDefaults());config.put(StatusBarThemeSpec.KEY,spec.serialize());config.put(StatusBarFontSpec.KEY,fonts.serialize());config.put("ls_augment_rm_lock_clock_font","font:"+B);
        check(StatusBarAssetReferences.statusbarIcons(config).equals(new LinkedHashSet<>(Arrays.asList(A,B))),"image reference deduplication");
        String sheetImage="c".repeat(64);
        StatusBarSheetSpec sheet=StatusBarSheetSpec.empty(2,2).withCell(new StatusBarSheetSpec.Cell(0,0,2,2,"image",24,0,0,0,0,"center","",sheetImage));
        config.put(ConfigSchema.STATUSBAR_SHEET,sheet.serialize());
        check(StatusBarAssetReferences.statusbarIcons(config).equals(new LinkedHashSet<>(Arrays.asList(A,B))),"retired sheet text cannot reserve otherwise unused image assets");
        config.put(ConfigSchema.STATUSBAR_LAYOUT_MODE,"sheet");
        check(!StatusBarAssetReferences.statusbarIcons(config).contains(sheetImage),"legacy sheet mode cannot grant access to retired image references");
        check(StatusBarAssetReferences.fonts(config).size()==2,"font reference collector includes legacy and role fonts");
        ConfigSnapshot snapshot=ConfigSnapshot.create(500,600,config);check(snapshot!=null,"valid theme can be synchronized");
        ConfigSnapshot restored=ConfigSnapshot.parse(snapshot.serialize());check(restored!=null&&restored.get(StatusBarThemeSpec.KEY).equals(spec.serialize()),"snapshot preserves complete artwork mappings");
        check(restored.get(ConfigSchema.STATUSBAR_SHEET).equals(sheet.serialize()),"compatibility storage retains retired worksheet text without enabling a layout");
        String farImage="d".repeat(64);
        StatusBarSheetSpec large=sheet.resize(1_000_000,100_000)
                .withCell(new StatusBarSheetSpec.Cell(999_999,99_999,1,1,"image",14,0,0,0,0,"center","",farImage))
                .withOutput(.5f,10,-5,"width");
        config.put(ConfigSchema.STATUSBAR_SHEET,large.serialize());
        check(!StatusBarAssetReferences.statusbarIcons(config).contains(sheetImage)&&!StatusBarAssetReferences.statusbarIcons(config).contains(farImage),"retired canvas images never enter active backup or provider reference sets");
        config.put(StatusBarThemeSpec.KEY,spec.with(binding("wifi.signal","level2","whole",sheetImage)).serialize());
        check(StatusBarAssetReferences.statusbarIcons(config).contains(sheetImage),"the same file remains protected when a current theme really uses it");
        check(ConfigSchema.normalize(StatusBarThemeSpec.KEY,"1;bad")==null,"invalid theme never enters config");
        Set<String> ids=new HashSet<>();for(StatusBarIconCatalog.Icon icon:StatusBarIconCatalog.all()){check(ids.add(icon.id),"unique directory role");check(StatusBarIconCatalog.validId(icon.id),"valid semantic role");}
        for(String required:new String[]{"mobile1","mobile2","cooling_fan","liquid_cooling","refresh_rate","privacy.chip","privacy.dot","battery.fill","bluetooth.battery","wifi.standard"})check(ids.contains(required),"complete special role: "+required);
        check(!ids.contains("notifications"),"app notification group excluded");
        byte[] gif=Base64.getDecoder().decode("R0lGODlhDAAMAIEAAP8AAAAAAAAAAAAAACH/C05FVFNDQVBFMi4wAwEAAAAh+QQADAAAACwAAAAADAAMAAAIFgABCBxIsKDBgwgTKlzIsKHDhxARBgQAIfkEAQwAAQAsAAAAAAwADACBAP8AAAAAAAAAAAAACBYAAQgcSLCgwYMIEypcyLChw4cQEQYEADs=");
        check(StatusBarImagePolicy.validate(gif)==2,"animated GIF counts both frames");
        try{StatusBarImagePolicy.validate(Arrays.copyOf(gif,gif.length-1));throw new AssertionError("truncated GIF accepted");}catch(java.io.IOException expected){ }
        java.io.ByteArrayOutputStream excessive=new java.io.ByteArrayOutputStream();
        excessive.write(new byte[]{'G','I','F','8','9','a',1,0,1,0,(byte)128,0,0,0,0,0,(byte)255,(byte)255,(byte)255});
        for(int i=0;i<241;i++)excessive.write(new byte[]{0x2c,0,0,0,0,1,0,1,0,0,2,2,0x44,1,0});excessive.write(0x3b);
        try{StatusBarImagePolicy.validate(excessive.toByteArray());throw new AssertionError("excessive GIF frames accepted");}catch(java.io.IOException expected){ }
        System.out.println("Status-bar assets: state fallback, ranges, isolation, font inheritance, references and synchronization passed");
    }
}
