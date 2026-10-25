package ls.augment.com;

/** Retain module-owned records and their complete adjacent exception continuation. */
final class FrameworkDiagnosticFilter {
    private FrameworkDiagnosticFilter() { }
    static String retain(String source) {
        StringBuilder out = new StringBuilder();
        boolean continuing = false;
        for (String line : source.split("\\r?\\n")) {
            boolean own = line.contains("LS_Augment") || line.contains("DuoStartup") || line.contains("DUO_STARTUP")
                    || line.contains("ls.augment.com");
            if (own || continuing && continuation(line)) { out.append(line).append('\n'); continuing = true; }
            else if(safetyLine(line)){out.append(safety(line));continuing=false;}
            else if (!line.trim().isEmpty()) continuing = false;
        }
        return out.toString();
    }
    static boolean safetyLine(String line) {
        String value=line.toLowerCase(java.util.Locale.ROOT);
        return value.contains("safe mode")||value.contains("safemode")||value.contains("safe_mode")||value.contains("安全模式")
                ||value.contains("disableallmodules")||value.contains("disabling all modules")||value.contains("disabled all modules")
                ||value.contains("disabl")&&value.contains("module")&&value.matches(".*\\ball\\b.*")
                ||(value.contains("systemui")||value.contains("system ui"))
                    &&(value.contains("crash")||value.contains("died")||value.contains("disable")||value.contains("restart"));
    }
    /** Independent of the module-name and optional detailed-log filters. */
    static String safety(String source) {
        StringBuilder out=new StringBuilder();
        for(String line:source.split("\\r?\\n"))if(safetyLine(line)) {
            if(out.length()>64*1024){out.append("[TRUNCATED safety records]\n");break;}
            line=line.replaceAll("(?i)(password|pin|token|secret|credential)\\s*[:=].*","$1=[omitted]");
            out.append(line.length()>2048?line.substring(0,2048)+"[TRUNCATED line]":line).append('\n');
        }
        return out.toString();
    }
    static boolean continuation(String line) {
        String text=line.trim().replaceFirst("^\\[\\s*[^\\]]+\\]\\s*", "");
        return text.startsWith("at ") || text.startsWith("Caused by:") || text.startsWith("Suppressed:")
                || text.matches("\\.\\.\\. [0-9]+ more") || text.startsWith("[CIRCULAR REFERENCE:")
                || text.matches("(?:[a-zA-Z_$][a-zA-Z0-9_$]*\\.)+[a-zA-Z_$][a-zA-Z0-9_$]*(?::.*)?")
                || text.startsWith("[TRUNCATED") || text.startsWith("[EXCEPTION_CAPTURE_FAILED");
    }
}
