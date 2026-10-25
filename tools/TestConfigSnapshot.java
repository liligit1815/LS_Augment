package ls.augment.com;

import java.util.LinkedHashMap;
import java.util.Map;

public final class TestConfigSnapshot {
    public static void main(String[] args) throws Exception {
        for (int cps : new int[]{1, 2, 9, 10, 20, 50}) {
            String value = String.valueOf(cps);
            if (!value.equals(ConfigSchema.normalize(ConfigSchema.TGK_RAPID_FIRE_COUNT, value)))
                throw new AssertionError("rapid-fire frequency rejected: " + cps);
        }
        for (String invalid : new String[]{"0", "-1", "51", "1.5"})
            if (ConfigSchema.normalize(ConfigSchema.TGK_RAPID_FIRE_COUNT, invalid) != null)
                throw new AssertionError("invalid frequency accepted: " + invalid);
        if (!"0".equals(ConfigSchema.defaults().get(SystemOptions.SMS_CODE_CLIPBOARD)))
            throw new AssertionError("SMS clipboard must default off");
        Map<String, String> values = new LinkedHashMap<>(ConfigSchema.defaults());
        if(!"1".equals(values.get(AppearanceOptions.ANGULAR_CARDS))||ConfigSchema.isRuntimeKey(AppearanceOptions.ANGULAR_CARDS))
            throw new AssertionError("card shape must preserve existing appearance and stay local to module UI");
        values.put(ConfigSchema.TGK_RAPID_FIRE_COUNT, "1");
        values.put(SystemOptions.SMS_CODE_CLIPBOARD, "1");
        values.put(ConfigSchema.AI_TRIGGER_ENABLED, "1");
        values.put(ConfigSchema.AI_TRIGGER_TEMPLATE_SCAN_MS, "80");
        values.put(ConfigSchema.TGK_RAPID_FIRE_COMPAT_TOKEN, "token-payload");
        ConfigSnapshot snapshot = ConfigSnapshot.create(42L, 123456L, values);
        ConfigSnapshot.Reader reader = new ConfigSnapshot.Reader();
        ConfigSnapshot.ParseResult firstRead = reader.read(snapshot.serialize());
        for (int i = 0; i < 10000; i++) {
            if (reader.read(new String(snapshot.serialize())) != firstRead)
                throw new AssertionError("unchanged verified snapshot was decoded again");
        }
        ConfigSnapshot nextRead = ConfigSnapshot.create(43L, 123457L, values);
        if (reader.read(nextRead.serialize()).snapshot.revision != 43L
                || reader.read(snapshot.serialize()).snapshot.revision != 42L)
            throw new AssertionError("reader must preserve reset/rollback bytes for authority checks");
        String corruptedRead = snapshot.serialize().replaceFirst("LSA1", "LSA0");
        if (reader.read(corruptedRead).snapshot != null || reader.read(null).snapshot != null
                || reader.read("x".repeat(256 * 1024 + 1)).snapshot != null
                || reader.read(snapshot.serialize()).snapshot == null)
            throw new AssertionError("reader accepted invalid bytes or could not recover");
        if (snapshot == null) throw new AssertionError("snapshot creation failed");
        ConfigSnapshot parsed = ConfigSnapshot.parse(snapshot.serialize());
        verifyDiagnosticReasons(snapshot);
        if (parsed == null || !"1".equals(parsed.get(ConfigSchema.TGK_RAPID_FIRE_COUNT))
                || !"1".equals(parsed.get(SystemOptions.SMS_CODE_CLIPBOARD)))
            throw new AssertionError("new settings failed snapshot round trip");
        if (parsed == null || parsed.revision != 42L || parsed.updatedAt != 123456L
                || !"1".equals(parsed.get(ConfigSchema.AI_TRIGGER_ENABLED))
                || !"80".equals(parsed.get(ConfigSchema.AI_TRIGGER_TEMPLATE_SCAN_MS))
                || !"token-payload".equals(parsed.get(
                ConfigSchema.TGK_RAPID_FIRE_COMPAT_TOKEN))) {
            throw new AssertionError("snapshot roundtrip failed");
        }
        String damaged = snapshot.serialize().substring(0,
                snapshot.serialize().length() - 1) + "A";
        if (ConfigSnapshot.parse(damaged) != null) {
            throw new AssertionError("damaged checksum/payload accepted");
        }
        if (!ConfigSnapshot.safeDefaults().values().keySet()
                .equals(ConfigSchema.runtimeKeys())) {
            throw new AssertionError("safe snapshot key drift");
        }
        if (!"0".equals(ConfigSnapshot.safeDefaults().get(
                ConfigSchema.TGK_RAPID_FIRE_ENABLED))) {
            throw new AssertionError("safe defaults enabled native feature");
        }
        if (!"regions".equals(ConfigSchema.defaultValue(ConfigSchema.STATUSBAR_LAYOUT_MODE))
                || !"".equals(ConfigSchema.defaultValue(ConfigSchema.STATUSBAR_SHEET)))
            throw new AssertionError("upgrade must preserve existing region layout");
        if (ConfigSchema.normalize(ConfigSchema.STATUSBAR_LAYOUT_MODE,"unlimited") != null
                || ConfigSchema.normalize(ConfigSchema.STATUSBAR_SHEET,"invalid-sheet") != null)
            throw new AssertionError("invalid sheet configuration accepted");
        Map<String,String> sheetValues=new LinkedHashMap<>(values);
        StatusBarSheetSpec merged=StatusBarSheetSpec.empty(2,4)
                .withCell(new StatusBarSheetSpec.Cell(0,0,2,2,"image",24,1,2,0,0,"center","","a".repeat(64)))
                .withCell(new StatusBarSheetSpec.Cell(0,2,2,2,"text",12,0,0,0,0,"center","跨两排\n中文 ☀",""));
        String sheetRaw=merged.serialize();
        sheetValues.put(ConfigSchema.STATUSBAR_LAYOUT_MODE,"sheet");
        sheetValues.put(ConfigSchema.STATUSBAR_SHEET,sheetRaw);
        ConfigSnapshot sheetSnapshot=ConfigSnapshot.create(43,123457,sheetValues);
        if(sheetSnapshot==null)throw new AssertionError("sheet snapshot creation failed");
        ConfigSnapshot sheetRestored=ConfigSnapshot.parse(sheetSnapshot.serialize());
        if(sheetRestored==null||!sheetRaw.equals(sheetRestored.get(ConfigSchema.STATUSBAR_SHEET))
                ||!"regions".equals(sheetRestored.get(ConfigSchema.STATUSBAR_LAYOUT_MODE)))
            throw new AssertionError("retired sheet must remain archived without activating its layout");
        String signedSheet=withValue(sheetSnapshot,ConfigSchema.STATUSBAR_LAYOUT_MODE,"sheet");
        ConfigSnapshot retired=ConfigSnapshot.parse(signedSheet);
        if(retired==null||!"regions".equals(retired.get(ConfigSchema.STATUSBAR_LAYOUT_MODE))
                ||!sheetRaw.equals(retired.get(ConfigSchema.STATUSBAR_SHEET))
                ||!"1".equals(retired.get(ConfigSchema.AI_TRIGGER_ENABLED))
                ||!signedSheet.equals(retired.serialize()))
            throw new AssertionError("retired sheet migration rejected an old checksum or reset other settings");
        if(ConfigSnapshot.parse(withValue(sheetSnapshot,ConfigSchema.STATUSBAR_LAYOUT_MODE," sheet "))!=null)
            throw new AssertionError("retired sheet compatibility accepted a noncanonical signed value");
        StatusBarSheetSpec restoredSheet=StatusBarSheetSpec.parse(sheetRestored.get(ConfigSchema.STATUSBAR_SHEET));
        if(restoredSheet.cellAt(1,0).rowSpan!=2||!restoredSheet.cellAt(1,2).text.equals("跨两排\n中文 ☀"))
            throw new AssertionError("merge and UTF-8 content were lost during synchronization");
        String oldSheet="SS1;2,2,2,2;15,15;26,26;0,0,2,2,clock,12,0,0,0,0,center,,";
        String oldSnapshot=withValue(sheetSnapshot,ConfigSchema.STATUSBAR_SHEET,oldSheet);
        ConfigSnapshot oldRestored=ConfigSnapshot.parse(oldSnapshot);
        if(oldRestored==null||!oldRestored.serialize().equals(oldSnapshot)
                ||!oldSheet.equals(oldRestored.get(ConfigSchema.STATUSBAR_SHEET)))
            throw new AssertionError("SS1 upgrade must preserve the persisted snapshot and checksum");
        StatusBarSheetSpec canvas=StatusBarSheetSpec.parse(oldRestored.get(ConfigSchema.STATUSBAR_SHEET))
                .resize(1_000_000,100_000).withRowHeight(999_999,9).withColWidth(99_999,18)
                .withCell(new StatusBarSheetSpec.Cell(999_999,99_999,1,1,"text",6,0,0,0,0,"center","画布远端",""))
                .withOutput(.35f,-12,4,"page");
        sheetValues.put(ConfigSchema.STATUSBAR_SHEET,canvas.serialize());
        ConfigSnapshot canvasSnapshot=ConfigSnapshot.create(44,123458,sheetValues);
        ConfigSnapshot canvasRestored=canvasSnapshot==null?null:ConfigSnapshot.parse(canvasSnapshot.serialize());
        if(canvasRestored==null)throw new AssertionError("sparse canvas could not synchronize");
        StatusBarSheetSpec output=StatusBarSheetSpec.parse(canvasRestored.get(ConfigSchema.STATUSBAR_SHEET));
        if(output.rows!=1_000_000||output.cols!=100_000||output.rowHeight(999_999)!=9
                ||output.colWidth(99_999)!=18||output.outputScale!=.35f||output.outputOffsetX!=-12
                ||output.outputOffsetY!=4||!"page".equals(output.fitMode)
                ||!output.cellAt(999_999,99_999).text.equals("画布远端")||canvas.serialize().length()>1000)
            throw new AssertionError("canvas dimensions, sparse tracks, far cell or print setup lost during sync");
        Map<String,String> crowdedConfig=new LinkedHashMap<>(sheetValues);
        StringBuilder packages=new StringBuilder();for(int i=0;i<5000;i++){if(i>0)packages.append(';');packages.append(String.format(java.util.Locale.ROOT,"x.app%05d",i));}
        String packageList=packages.toString();
        if(ConfigSchema.normalize(ConfigSchema.FREEFORM_GAME_APPS,packageList)==null
                ||ConfigSchema.normalize(ConfigSchema.FREEFORM_EXCLUDED_APPS,packageList)==null)
            throw new AssertionError("capacity test needs individually valid package lists");
        crowdedConfig.put(ConfigSchema.FREEFORM_GAME_APPS,packageList);crowdedConfig.put(ConfigSchema.FREEFORM_EXCLUDED_APPS,packageList);
        crowdedConfig.put(ConfigSchema.STATUSBAR_SHEET,StatusBarSheetSpec.empty(1,1)
                .withCell(new StatusBarSheetSpec.Cell(0,0,1,1,"text",12,0,0,0,0,"center","x".repeat(35000),"")).serialize());
        if(ConfigSnapshot.create(45,123459,crowdedConfig)!=null)
            throw new AssertionError("cannot save a combined config that the snapshot reader would reject");
        if (!"红魔Duo".equals(ConfigSchema.defaults().get(ConfigSchema.TILE_LABEL))
                || !"红魔Duo".equals(ConfigSchema.normalize(ConfigSchema.TILE_LABEL,"LS_Augment"))
                || !"我的磁贴".equals(ConfigSchema.normalize(ConfigSchema.TILE_LABEL,"我的磁贴")))
            throw new AssertionError("brand migration overwrote custom label or missed legacy default");
        ConfigSnapshot legacy = ConfigSnapshot.parse(withLabel(snapshot,"LS_Augment"));
        if (legacy == null || !"1".equals(legacy.get(ConfigSchema.AI_TRIGGER_ENABLED))
                || !"LS_Augment".equals(legacy.get(ConfigSchema.TILE_LABEL))
                || !legacy.serialize().equals(withLabel(snapshot,"LS_Augment")))
            throw new AssertionError("legacy snapshot rejected or checksum bytes changed by rename");
        if (ConfigSnapshot.parse(withLabel(snapshot,"  非规范值  ")) != null)
            throw new AssertionError("rename compatibility accepted other unnormalized values");
        String oldFan = withLegacyFan(snapshot, "12000", "1", false);
        ConfigSnapshot fanRestored = ConfigSnapshot.parse(oldFan);
        if (fanRestored == null || !"1".equals(fanRestored.get(ConfigSchema.FAN_FIXED_LEVEL))
                || fanRestored.get(ConfigSchema.FAN_TARGET_RPM) != null
                || fanRestored.get(ConfigSchema.FAN_UNLOCK_MAX) != null
                || !"1".equals(fanRestored.get(ConfigSchema.AI_TRIGGER_ENABLED))
                || !fanRestored.serialize().equals(oldFan)
                || !fanRestored.values().keySet().equals(ConfigSchema.runtimeKeys()))
            throw new AssertionError("retired fan controls must migrate without resetting other features");
        if (ConfigSnapshot.parse(withLegacyFan(snapshot, "100001", "1", false)) != null
                || ConfigSnapshot.parse(withLegacyFan(snapshot, "0500", "1", false)) != null
                || ConfigSnapshot.parse(withLegacyFan(snapshot, "12000", "true", false)) != null
                || ConfigSnapshot.parse(withLegacyFan(snapshot, "12000", "1", true)) != null)
            throw new AssertionError("fan migration accepted malformed or duplicate legacy fields");
        String beforeLiftArc=withoutKeys(snapshot,"ls_augment_liftarc_");
        ConfigSnapshot upgrade=ConfigSnapshot.parse(beforeLiftArc);
        if(upgrade==null||!"1".equals(upgrade.get(ConfigSchema.AI_TRIGGER_ENABLED))
                ||!"0".equals(upgrade.get("ls_augment_liftarc_enabled"))
                ||!"1".equals(upgrade.get("ls_augment_liftarc_show_handle"))
                ||!beforeLiftArc.equals(upgrade.serialize()))
            throw new AssertionError("LiftArc addition reset existing settings or enabled a new feature");
        if(ConfigSnapshot.parse(withoutKeys(snapshot,"ls_augment_liftarc_hint_size"))!=null
                ||ConfigSnapshot.parse(withoutKeys(snapshot,ConfigSchema.AI_TRIGGER_ENABLED))!=null)
            throw new AssertionError("migration repaired a truncated current/old snapshot");
        Map<String,String> stackValues=new LinkedHashMap<>(values);
        stackValues.put(SystemUiOptions.NOTIFICATION_STACK,"1");
        stackValues.put(NotificationAppearanceOptions.STACK_BIG,"1");
        stackValues.put(NotificationAppearanceOptions.STACK_SMALL,"1");
        stackValues.put(NotificationAppearanceOptions.STACK_COUNT,"3");
        stackValues.put(NotificationAppearanceOptions.STACK_STEP,"12");
        stackValues.put(NotificationAppearanceOptions.STACK_INSET,"0");
        ConfigSnapshot grouped=ConfigSnapshot.create(46,123460,stackValues);
        if(grouped==null)throw new AssertionError("notification stack settings could not synchronize");
        ConfigSnapshot groupedRoundTrip=ConfigSnapshot.parse(grouped.serialize());
        if(groupedRoundTrip==null||!"1".equals(groupedRoundTrip.get(NotificationAppearanceOptions.STACK_BIG))
                ||!"1".equals(groupedRoundTrip.get(NotificationAppearanceOptions.STACK_SMALL)))
            throw new AssertionError("big and small modes lost independent enabled values");
        String beforeGroupedStack=withoutExactKeys(grouped,
                NotificationAppearanceOptions.STACK_BIG,NotificationAppearanceOptions.STACK_SMALL);
        ConfigSnapshot stackUpgrade=ConfigSnapshot.parse(beforeGroupedStack);
        if(stackUpgrade==null||!"0".equals(stackUpgrade.get(NotificationAppearanceOptions.STACK_BIG))
                ||!"0".equals(stackUpgrade.get(NotificationAppearanceOptions.STACK_SMALL))
                ||!"1".equals(stackUpgrade.get(SystemUiOptions.NOTIFICATION_STACK))
                ||!"3".equals(stackUpgrade.get(NotificationAppearanceOptions.STACK_COUNT))
                ||!"12".equals(stackUpgrade.get(NotificationAppearanceOptions.STACK_STEP))
                ||!"0".equals(stackUpgrade.get(NotificationAppearanceOptions.STACK_INSET))
                ||!"1".equals(stackUpgrade.get(ConfigSchema.AI_TRIGGER_ENABLED))
                ||stackUpgrade.revision!=46||stackUpgrade.updatedAt!=123460
                ||!beforeGroupedStack.equals(stackUpgrade.serialize())
                ||!stackUpgrade.values().keySet().equals(ConfigSchema.runtimeKeys()))
            throw new AssertionError("stack upgrade reset old settings or changed signed snapshot bytes");
        for(String mode:new String[]{NotificationAppearanceOptions.STACK_BIG,NotificationAppearanceOptions.STACK_SMALL}){
            if(ConfigSnapshot.parse(withoutExactKeys(grouped,mode))!=null)
                throw new AssertionError("partially missing stack family accepted: "+mode);
            for(String noncanonical:new String[]{"true","false"," 1 ","01","2",""})
                if(ConfigSnapshot.parse(withValue(grouped,mode,noncanonical))!=null)
                    throw new AssertionError("noncanonical signed stack boolean accepted: "+mode+"="+noncanonical);
        }
        if(!"0".equals(ConfigSnapshot.safeDefaults().get(NotificationAppearanceOptions.STACK_BIG))
                ||!"0".equals(ConfigSnapshot.safeDefaults().get(NotificationAppearanceOptions.STACK_SMALL)))
            throw new AssertionError("new stack modes must default disabled");
        String beforeExtraction = withoutKeys(snapshot,"atomic_workbench_extraction_");
        ConfigSnapshot extractionUpgrade = ConfigSnapshot.parse(beforeExtraction);
        if (extractionUpgrade == null || !"0".equals(extractionUpgrade.get("atomic_workbench_extraction_enabled"))
                || !"1".equals(extractionUpgrade.get("atomic_workbench_extraction_text"))
                || !"0".equals(extractionUpgrade.get("atomic_workbench_extraction_landscape"))
                || !"".equals(extractionUpgrade.get("atomic_workbench_extraction_blacklist"))
                || !"1".equals(extractionUpgrade.get(ConfigSchema.AI_TRIGGER_ENABLED))
                || !beforeExtraction.equals(extractionUpgrade.serialize()))
            throw new AssertionError("extraction addition changed signed bytes, reset existing settings or enabled collection");
        for (String key : new String[]{"atomic_workbench_extraction_enabled","atomic_workbench_extraction_text",
                "atomic_workbench_extraction_landscape","atomic_workbench_extraction_blacklist"})
            if (ConfigSnapshot.parse(withoutExactKeys(snapshot,key)) != null)
                throw new AssertionError("partial extraction family was repaired: " + key);
        if (!"a.b;c.d".equals(ConfigSchema.normalize("atomic_workbench_extraction_blacklist","c.d; a.b; c.d"))
                || ConfigSchema.normalize("atomic_workbench_extraction_blacklist","not a package!") != null)
            throw new AssertionError("extraction blacklist accepted malformed packages or lost canonical ordering");
        verifyEntryParameters(snapshot);
        System.out.println("PASS TestConfigSnapshot (including legacy, LiftArc, extraction, entry parameters and notification stack upgrade compatibility)");
    }

    private static void verifyEntryParameters(ConfigSnapshot snapshot) throws Exception {
        String area=AtomicWorkbenchConfig.TRIGGER_AREA_SCALE, sensitivity=AtomicWorkbenchConfig.CORNER_SENSITIVITY;
        for(String key:new String[]{area,sensitivity}) {
            if(!"100".equals(ConfigSchema.defaultValue(key))||!"100".equals(snapshot.get(key)))
                throw new AssertionError("entry default changed: "+key);
            if(ConfigSnapshot.parse(withoutExactKeys(snapshot,key))!=null)
                throw new AssertionError("partially missing entry parameter pair accepted: "+key);
        }
        String old=withoutExactKeys(snapshot,area,sensitivity);
        ConfigSnapshot upgraded=ConfigSnapshot.parse(old);
        if(upgraded==null||!"100".equals(upgraded.get(area))||!"100".equals(upgraded.get(sensitivity))
                ||!"1".equals(upgraded.get(ConfigSchema.AI_TRIGGER_ENABLED))||upgraded.revision!=snapshot.revision
                ||!upgraded.serialize().equals(old)||!upgraded.checksum.equals(old.split("\\.",3)[1]))
            throw new AssertionError("old entry snapshot lost its checksum, settings or defaults");
        if(ConfigSnapshot.parse(withoutExactKeys(snapshot,area,sensitivity,ConfigSchema.AI_TRIGGER_ENABLED))!=null)
            throw new AssertionError("entry upgrade repaired unrelated missing key");
        for(String key:new String[]{area,sensitivity}) {
            int minimum=key.equals(area)?50:60,maximum=key.equals(area)?120:160;
            for(int value:new int[]{minimum,100,maximum}) {
                String raw=String.valueOf(value);
                ConfigSnapshot parsed=ConfigSnapshot.parse(withValue(snapshot,key,raw));
                if(parsed==null||!raw.equals(parsed.get(key)))throw new AssertionError("entry endpoint rejected: "+key);
            }
            for(String invalid:new String[]{String.valueOf(minimum-1),String.valueOf(maximum+1),"100.0"," 100 ","0100"})
                if(ConfigSnapshot.parse(withValue(snapshot,key,invalid))!=null)throw new AssertionError("invalid signed entry accepted: "+invalid);
        }
    }
    private static void verifyDiagnosticReasons(ConfigSnapshot snapshot) throws Exception {
        String raw=snapshot.serialize();
        String body=new String(java.util.Base64.getUrlDecoder().decode(raw.split("\\.",3)[2]),java.nio.charset.StandardCharsets.UTF_8);
        expectReason(null,"payload_missing");
        expectReason("x".repeat(256*1024+1),"payload_too_large");
        expectReason("PRIVATE_PAYLOAD","envelope_invalid");
        expectReason("LSA1."+"0".repeat(64)+".!","body_base64_invalid");
        expectReason("LSA1."+"0".repeat(64)+"."+raw.split("\\.",3)[2],"checksum_mismatch");
        expectReason(signBody("v=1"),"headers_incomplete");
        expectReason(signBody(body.replaceFirst("v=[0-9]+","v=999")),"schema_unsupported;actual=999");
        expectReason(signBody(body.replaceFirst("r=[0-9]+","r=0")),"revision_invalid");
        expectReason(signBody(body.replaceFirst("t=[0-9]+","t=0")),"updated_at_invalid");
        expectReason(signBody(body.replaceFirst("s=device","s=PRIVATE_PAYLOAD")),"scope_invalid");
        expectReason(signBody(body+"PRIVATE_PAYLOAD\n"),"entry_malformed;line=");
        expectReason(signBody(body+body.split("\\n")[4]+"\n"),"duplicate_key;line=");
        expectReason(signBody(body+"PRIVATE_PAYLOAD=!\n"),"value_base64_invalid;line=");
        expectReason(signBody(body+"PRIVATE_PAYLOAD=MQ\n"),"unknown_key;line=");
        expectReason(withValue(snapshot,ConfigSchema.TILE_LABEL,"  PRIVATE_PAYLOAD  "),"value_invalid;line=");
        expectReason(withoutExactKeys(snapshot,ConfigSchema.AI_TRIGGER_ENABLED),"keys_incomplete;actual=");
        ConfigSnapshot.ParseResult success=ConfigSnapshot.parseDetailed(raw);
        if(success.snapshot==null||!success.error.isEmpty())throw new AssertionError("valid detailed parse must stay successful");
    }
    private static void expectReason(String raw,String reason) {
        ConfigSnapshot.ParseResult result=ConfigSnapshot.parseDetailed(raw);
        if(result.snapshot!=null||!result.error.startsWith(reason)||result.error.length()>160
                ||result.error.contains("PRIVATE_PAYLOAD")||ConfigSnapshot.parse(raw)!=null)
            throw new AssertionError("unsafe or imprecise snapshot rejection: expected="+reason+" actual="+result.error);
    }
    private static String withLabel(ConfigSnapshot snapshot,String label) throws Exception {
        return withValue(snapshot,ConfigSchema.TILE_LABEL,label);
    }
    private static String withValue(ConfigSnapshot snapshot,String key,String value) throws Exception {
        var decoder=java.util.Base64.getUrlDecoder();var encoder=java.util.Base64.getUrlEncoder().withoutPadding();
        var utf=java.nio.charset.StandardCharsets.UTF_8;
        String body=new String(decoder.decode(snapshot.serialize().split("\\.",3)[2]),utf);
        body=body.replace(key+"="+encoder.encodeToString(snapshot.get(key).getBytes(utf)),
                key+"="+encoder.encodeToString(value.getBytes(utf)));
        return signBody(body);
    }
    private static String withLegacyFan(ConfigSnapshot snapshot,String rpm,String max,boolean duplicate) throws Exception {
        var decoder=java.util.Base64.getUrlDecoder();var encoder=java.util.Base64.getUrlEncoder().withoutPadding();
        var utf=java.nio.charset.StandardCharsets.UTF_8;
        String body=new String(decoder.decode(withValue(snapshot,ConfigSchema.FAN_FIXED_LEVEL,"0").split("\\.",3)[2]),utf);
        body+=ConfigSchema.FAN_TARGET_RPM+"="+encoder.encodeToString(rpm.getBytes(utf))+"\n";
        String maximum=ConfigSchema.FAN_UNLOCK_MAX+"="+encoder.encodeToString(max.getBytes(utf))+"\n";
        body+=maximum;
        if(duplicate)body+=maximum;
        return signBody(body);
    }
    private static String signBody(String body) throws Exception {
        var utf=java.nio.charset.StandardCharsets.UTF_8;
        var encoder=java.util.Base64.getUrlEncoder().withoutPadding();
        byte[] digest=java.security.MessageDigest.getInstance("SHA-256").digest(body.getBytes(utf));
        return "LSA1."+java.util.HexFormat.of().formatHex(digest)+"."+encoder.encodeToString(body.getBytes(utf));
    }
    private static String withoutKeys(ConfigSnapshot snapshot,String prefix) throws Exception {
        String body=new String(java.util.Base64.getUrlDecoder().decode(snapshot.serialize().split("\\.",3)[2]),
                java.nio.charset.StandardCharsets.UTF_8);
        StringBuilder kept=new StringBuilder();
        for(String line:body.split("\n"))if(!line.startsWith(prefix+"=")&&!line.startsWith(prefix)&&!line.isEmpty())
            kept.append(line).append('\n');
        return signBody(kept.toString());
    }
    private static String withoutExactKeys(ConfigSnapshot snapshot,String... removed) throws Exception {
        String body=new String(java.util.Base64.getUrlDecoder().decode(snapshot.serialize().split("\\.",3)[2]),
                java.nio.charset.StandardCharsets.UTF_8);
        java.util.Set<String> keys=new java.util.HashSet<>(java.util.Arrays.asList(removed));
        StringBuilder kept=new StringBuilder();
        for(String line:body.split("\n")){
            int separator=line.indexOf('=');
            if(!line.isEmpty()&&(separator<0||!keys.contains(line.substring(0,separator))))
                kept.append(line).append('\n');
        }
        return signBody(kept.toString());
    }
}
