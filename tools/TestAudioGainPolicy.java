package ls.augment.com;
public final class TestAudioGainPolicy {
    public static void main(String[] args) {
        check(AudioGainPolicy.extraSteps(100,5)==0,"native ceiling");
        check(AudioGainPolicy.extraSteps(200,5)==20,"extended physical-key steps");
        check(AudioGainPolicy.percent(99,5,151)==151,"last step respects a partial limit");
        check(AudioGainPolicy.milliBel(100)==0,"unity gain");
        check(Math.abs(AudioGainPolicy.milliBel(200)-602)<=1,"double amplitude is six dB");
        check(AudioGainPolicy.key("speaker",0).isEmpty(),"call stream not modified");
        check(!AudioGainPolicy.key("wired",3).equals(AudioGainPolicy.key("bluetooth",3)),"routes independent");
        check(!AudioGainPolicy.key("speaker",2).equals(AudioGainPolicy.key("speaker",4)),"ring and alarm independent");
        System.out.println("PASS TestAudioGainPolicy");
    }
    static void check(boolean ok,String name){if(!ok)throw new AssertionError(name);}
}
