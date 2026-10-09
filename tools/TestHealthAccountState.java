package ls.augment.com;

public final class TestHealthAccountState {
    private static int checks;
    private static void check(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
    public static void main(String[] args){
        String binding="a".repeat(64),other="b".repeat(64),account="1234567890";
        long now=1_800_000_000_000L;
        HealthAccountState active=HealthAccountState.parse(HealthAccountState.encode(binding,account,now));
        check(active!=null&&account.equals(active.account),"Display actual Xiaomi account, never binding hash");
        check(active.matches(binding)&&!active.matches(other),"Display and binding remain paired");
        check(HealthAccountState.canEnable(binding,active,now),"Current bound account may enable");
        check(!HealthAccountState.canEnable("",active,now),"Unbound account cannot enable");
        check(!HealthAccountState.canEnable(other,active,now),"Switched account cannot enable");
        check(!HealthAccountState.canEnable(binding,null,now),"Missing observation cannot enable");
        check(HealthAccountState.canEnable(binding,active,now+89_999),"Fresh boundary");
        check(!HealthAccountState.canEnable(binding,active,now+90_000),"Expired observation cannot enable");
        check(!HealthAccountState.canEnable(binding,active,now-1),"Future timestamp cannot enable");
        HealthAccountState loggedOut=HealthAccountState.parse(HealthAccountState.encode("","",now));
        check(loggedOut!=null&&!loggedOut.signedIn(),"Logout clears account and binding together");
        check(!HealthAccountState.canEnable(binding,loggedOut,now),"Logged-out account cannot enable");
        for(String value:new String[]{"",binding,null,"HA1|0|"+binding+"|123","HA1|"+now+"|"+binding+"|", "HA1|"+now+"||123", "HA1|"+now+"|"+binding+"|name", "HA1|"+now+"|"+binding+"|123|456", "HA1|"+now+"|"+binding+"|"+"1".repeat(33),"HA1|999999999999999999999|"+binding+"|123"})
            check(HealthAccountState.parse(value)==null,"Reject malformed observation");
        check(HealthAccountState.encode(binding,"123\n456",now).isEmpty(),"Reject control characters");
        check(HealthAccountState.encode(binding,"123|456",now).isEmpty(),"Reject protocol delimiter");
        System.out.println("PASS HealthAccountState: "+checks+" checks");
    }
}
