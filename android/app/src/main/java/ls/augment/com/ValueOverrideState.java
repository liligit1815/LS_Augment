package ls.augment.com;

/** Value-backed feature gates never add a synthetic key to the hook protocol. */
final class ValueOverrideState {
    private ValueOverrideState() { }
    static boolean active(String comparison,String value,String noOp) {
        if(value==null)value=noOp;
        if("number".equals(comparison)) {
            try {double n=Double.parseDouble(value),off=Double.parseDouble(noOp);return Double.isFinite(n)&&n!=off;}
            catch(NumberFormatException ignored){return false;}
        }
        if("nonEmptyCommaSeparatedTokens".equals(comparison)) {
            for(String token:value.split(","))if(!token.trim().isEmpty())return true;
            return false;
        }
        return !value.trim().equals(noOp.trim());
    }
    static String restore(EnhancementOption option,String remembered,String noOp) {
        String normalized=option.normalize(remembered);
        return normalized==null?noOp:normalized;
    }
}
