package ls.augment.com;

public final class TestModuleEnvironment {
    public static void main(String[] args) {
        ModuleEnvironmentState ready=ModuleEnvironmentState.of(true,true),lsp=ModuleEnvironmentState.of(true,false),
                root=ModuleEnvironmentState.of(false,true),none=ModuleEnvironmentState.of(false,false);
        check(ready.tint!=lsp.tint&&none.tint!=lsp.tint&&ready.tint!=none.tint,"distinct severity colours");
        check(root.tint==lsp.tint,"partial access is warning");
        check(ready.tint==0,"healthy module uses the ordinary glass card without an added status tint");
        check(lsp.message.equals("请授予 ROOT 权限"),"LSP must work without ROOT");
        check(root.message.contains("LSP 作用域")&&root.message.contains("重启手机"),"ROOT alone cannot confirm injection");
        check(none.message.contains("ROOT 权限")&&none.message.contains("LSP 作用域"),"both missing");
        String witness="version=20393|pid=432|loaderReady=1";
        check(ModuleRuntimeStatus.matchesReceipt(witness,"20393",8,8),"same-boot authenticated receipt");
        check(!ModuleRuntimeStatus.matchesReceipt(witness,"20393",8,9),"previous boot rejected");
        check(!ModuleRuntimeStatus.matchesReceipt(witness,"20394",8,8),"previous APK rejected");
        check(!ModuleRuntimeStatus.matchesReceipt(witness,"20393",-1,-1),"unavailable boot rejected");
        check(!ModuleRuntimeStatus.matchesReceipt(witness.replace("loaderReady=1","loaderReady=0"),"20393",8,8),"unfinished loader rejected");
        check(!ModuleRuntimeStatus.matchesReceipt("version=20393|loaderReady=1","20393",8,8),"missing PID rejected");
        check(ModuleRuntimeStatus.matchesTelemetry("20398","20398",3294,"3294",1000,true,507,507),"periodic system-server injection evidence");
        check(!ModuleRuntimeStatus.matchesTelemetry("20398","20399",3294,"3294",1000,true,507,507),"old code must not confirm current APK");
        check(!ModuleRuntimeStatus.matchesTelemetry("20398","20398",3294,"3456",1000,true,507,507),"stopped system-server PID rejected");
        check(!ModuleRuntimeStatus.matchesTelemetry("20398","20398",3294,"3294",10515,true,507,507),"application UID cannot confirm system injection");
        check(!ModuleRuntimeStatus.matchesTelemetry("20398","20398",3294,"3294",1000,true,506,507),"previous-boot telemetry rejected");
        check(!ModuleRuntimeStatus.matchesTelemetry("20398","20398",3294,"3294",1000,true,-1,-1),"missing boot binding rejected");
        check(!ModuleRuntimeStatus.matchesTelemetry("20398","20398",3294,"3294",1000,false,507,507),"unloaded module rejected");
        check(ModuleEnvironmentState.of(true,true,false).message.contains("当前版本"),"injected previous version needs its own update guidance");
        System.out.println("PASS: four permission states and current-version/current-boot injection receipts");
    }
    private static void check(boolean result,String message){if(!result)throw new AssertionError(message);}
}
