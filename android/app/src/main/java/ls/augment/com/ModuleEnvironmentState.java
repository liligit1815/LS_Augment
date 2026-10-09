package ls.augment.com;

/** Four independent combinations; colour never substitutes for the textual result. */
final class ModuleEnvironmentState {
    final int tint, foreground;
    final String summary, message;
    private ModuleEnvironmentState(int tint, int foreground, String summary, String message) {
        this.tint=tint; this.foreground=foreground; this.summary=summary; this.message=message;
    }
    static ModuleEnvironmentState of(boolean lsp, boolean root) {
        return of(lsp,root,true);
    }
    static ModuleEnvironmentState of(boolean lsp, boolean root,boolean currentVersion) {
        if(lsp&&!currentVersion)return new ModuleEnvironmentState(0x80ffd36a,0xff775100,
                "LSP 已注入（旧版本） · "+(root?"ROOT 已授权":"ROOT 未授权"),
                "请重启手机以启用当前版本"+(root?"":"，并授予 ROOT 权限"));
        String summary=(lsp?"LSP 已注入":"LSP 未确认注入")+" · "+(root?"ROOT 已授权":"ROOT 未授权");
        if(lsp&&root)return new ModuleEnvironmentState(0,0xff64748b,summary,"模块已就绪");
        if(lsp||root)return new ModuleEnvironmentState(0x80ffd36a,0xff775100,summary,
                lsp?"请授予 ROOT 权限":"请检查 LSP 作用域并重启手机");
        return new ModuleEnvironmentState(0x70ff6f7d,0xff9b2636,summary,"请检查 LSP 作用域及 ROOT 权限，并重启手机");
    }
}
