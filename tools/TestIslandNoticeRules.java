package ls.augment.com;

/** Persisted rules shared by the editor and SystemUI, including upgrade and profile isolation. */
public final class TestIslandNoticeRules {
    static void check(boolean value, String why) { if (!value) throw new AssertionError(why); }
    public static void main(String[] args) {
        String pkg="org.example.chat", channel="聊天|work,1";
        String app=IslandNoticeRules.app(0,pkg), chat=IslandDownloadConfig.channel(0,pkg,channel);
        IslandNoticeRules rules=IslandNoticeRules.parse("");
        check(rules.resolve(0,pkg,channel)==0,"old installation must inherit global behavior");
        rules=IslandNoticeRules.parse(rules.updated(app,IslandNoticeRules.OFF));
        check(rules.resolve(0,pkg,"other")==1,"disabled app affects newly created channels");
        rules=IslandNoticeRules.parse(rules.updated(chat,IslandNoticeRules.EXPAND));
        check(rules.resolve(0,pkg,channel)==3,"exact Unicode channel overrides disabled app");
        check(rules.resolve(10,pkg,channel)==0,"profile must not inherit owner's rule");
        check(rules.resolve(0,"org.example.other",channel)==0,"package must match");
        String longId="a".repeat(1000);
        check(IslandNoticeRules.parse(rules.updated(IslandNoticeRules.channel(0,pkg,longId),2)).resolve(0,pkg,longId)==2,"full length ordinary channel");
        check(IslandDownloadConfig.channel(0,pkg,longId).isEmpty(),"download config must retain its existing validation");
        rules=IslandNoticeRules.parse(rules.updated(chat,IslandNoticeRules.COMPACT));
        check(rules.resolve(0,pkg,channel)==2,"editor can replace an existing override");
        rules=IslandNoticeRules.parse(rules.updated(chat,IslandNoticeRules.INHERIT));
        check(rules.resolve(0,pkg,channel)==1,"removing channel override restores app mode");
        check(rules.updated(app,0).isEmpty(),"removing app rule restores legacy config");
        for(String bad:new String[]{"0"+app,"4"+chat,"2-1|org.example.chat|","1"+app+",3"+app,"2x|a.b|","11|org.example.chat|?","1||"})
            check(IslandNoticeRules.normalize(bad)==null,"invalid or ambiguous rule accepted");
        rules=IslandNoticeRules.parse("");
        for(int i=0;i<128;i++)
            rules=IslandNoticeRules.parse(rules.updated(IslandDownloadConfig.channel(0,pkg,"channel"+i),1));
        check(rules.updated(app,1)==null,"limit must not silently discard earlier rules");
        check(rules.updated(IslandDownloadConfig.channel(0,pkg,"channel0"),0)!=null,"full rule set must remain editable");
        System.out.println("PASS notice rule precedence, inheritance, Unicode, profile isolation, limits and validation");
    }
}
