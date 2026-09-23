"""Execute production shoulder interceptors with OEM results and package witnesses.

No device or Gradle is used. The callback bodies are extracted unchanged, so a
regression in package ownership or feature-off passthrough fails this harness.
"""
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / 'android/app/src/main/java/ls/augment/com/hook/AugmentModule.java'


def callback(source, target):
    start = source.index('.setId("ls_augment.api102.shoulder.' + target + '")')
    start = source.index('.intercept(chain -> {', start) + len('.intercept(chain -> {')
    end, depth = start, 1
    while depth:
        depth += (source[end] == '{') - (source[end] == '}')
        end += 1
    return source[start:end - 1]


HARNESS = r'''
import java.lang.reflect.Method;
import java.util.*;
public class TestShoulderRuntime {
    static boolean master, shoulder;
    static String foreground;
    static int assertions, changed;
    static ClassLoader classLoader = TestShoulderRuntime.class.getClassLoader();
    static final String SHOULDER_LAST_HIT_KEY = "hit";
    static final class Context { }
    static final class FeatureSettings {
        static final String GAME_MASTER = "master", SHOULDER_ENABLED = "shoulder";
        static Context from(Object owner) { return new Context(); }
        static boolean enabled(Context context, String key) { return key.equals(GAME_MASTER) ? master : shoulder; }
    }
    static final class Chain {
        Object result;
        Object[] args;
        int calls;
        Chain(Object result, Object... args) { this.result = result; this.args = args; }
        Object proceed() { calls++; return result; }
        Object getArg(int index) { return args[index]; }
        Object getThisObject() { return this; }
    }
    static String stringArg(Chain chain, int index) { return chain.args[index] instanceof String ? (String)chain.args[index] : ""; }
    static String currentFullscreenPackage(ClassLoader loader) { return foreground; }
    static boolean isShoulderTarget(String name) { return master && shoulder && "target.app".equals(name); }
    static boolean isShoulderBlacklistPlugin(String name) { return "keylink".equals(name) || "touchgamekey".equals(name); }
    static boolean isBooleanFalse(Object value) { return Boolean.FALSE.equals(value); }
    static void writeShoulderProbe(String key, String value) { }
    static void logInfo(String value) { }
    static boolean forceSupportedGameKeyLink(Object owner) { changed++; return true; }
    static void check(boolean ok, String message) { assertions++; if (!ok) throw new AssertionError(message); }
    static List<?> oldList(Context c) { return null; }
    static List<?> newList(Context c, String pkg) { return null; }
    static void marker() { }
    // CALLBACKS
    public static void main(String[] args) throws Throwable {
        Method marker = TestShoulderRuntime.class.getDeclaredMethod("marker");
        Method oldList = TestShoulderRuntime.class.getDeclaredMethod("oldList", Context.class);
        Method newList = TestShoulderRuntime.class.getDeclaredMethod("newList", Context.class, String.class);
        List<String> oem = Collections.singletonList("record");
        for (int gates = 0; gates < 4; gates++) {
            master = (gates & 1) != 0; shoulder = (gates & 2) != 0;
            boolean on = master && shoulder;
            foreground = "target.app";
            Chain one = new Chain(false);
            check(oneKey(one, marker).equals(on), "one-key follows both switches");
            check(one.calls == 1, "one-key always preserves OEM side effects");
            Chain space = new Chain(false);
            changed = 0;
            check(gameSpace(space).equals(on), "game-space follows both switches");
            check(space.calls == 1 && changed == (on ? 1 : 0), "no field writes while disabled");
            Chain enabled = new Chain(false, null, "keylink");
            check(pluginEnable(enabled, marker).equals(on), "plugin enable follows switches");
            check(enabled.calls == (on ? 0 : 1), "disabled enable delegates to OEM");
            for (boolean region : new boolean[]{false, true}) {
                Chain eligible = new Chain(false, null, "keylink", "target.app", region);
                check(display(eligible, marker).equals(on), "display preserves package positions with region argument");
                check(eligible.calls == (on ? 0 : 1), "disabled eligibility delegates to OEM");
            }
            Chain query = new Chain(oem, null, "target.app");
            Object list = pluginList(query, newList);
            check(on ? list.equals(Arrays.asList("record", "keylink")) : list == oem, "explicit package list and disabled identity");
            check(query.calls == 1 && oem.equals(Collections.singletonList("record")), "OEM list untouched");
            Chain old = new Chain(oem, (Object)null);
            check(on ? ((List<?>)pluginList(old, oldList)).contains("keylink") : pluginList(old, oldList) == oem,
                    "legacy foreground list contract");
        }
        master = shoulder = true;
        foreground = "target.app";
        check(pluginList(new Chain(oem, null, "other.app"), newList) == oem, "explicit query cannot borrow foreground eligibility");
        check(Boolean.FALSE.equals(display(new Chain(false, null, "keylink", "other.app", false), marker)), "other package unchanged");
        check(Boolean.FALSE.equals(pluginEnable(new Chain(false, null, "record"), marker)), "other plugin unchanged");
        foreground = "other.app";
        check(pluginList(new Chain(oem, null, "target.app"), newList).equals(Arrays.asList("record", "keylink")), "explicit target independent of foreground");
        check(Boolean.FALSE.equals(oneKey(new Chain(false), marker)), "unrelated foreground one-key preserved");
        check(pluginList(new Chain(oem, (Object)null), oldList) == oem, "legacy unrelated foreground preserved");
        List<String> present = Arrays.asList("keylink", "record");
        check(pluginList(new Chain(present, null, "target.app"), newList) == present, "existing keylink no copy or duplicate");
        check(pluginList(new Chain(null, null, "target.app"), newList) == null, "non-list OEM result preserved");
        System.out.println("PASS shoulder production callbacks: " + assertions + " assertions");
    }
}
'''


def main():
    source = SOURCE.read_text(encoding='utf-8')
    targets = [
        ('gameassist.one_key_link', 'oneKey', 'Method eligibility'),
        ('gameassist.plugin_enable', 'pluginEnable', 'Method pluginEnabled'),
        ('gameassist.display_eligibility', 'display', 'Method displayEligibility'),
        ('gameassist.plugin_list', 'pluginList', 'Method pluginList'),
        ('gamespace.link_state', 'gameSpace', ''),
    ]
    methods = []
    for target, name, parameter in targets:
        signature = 'Chain chain' + (', ' + parameter if parameter else '')
        methods.append('static Object ' + name + '(' + signature + ') throws Throwable {' + callback(source, target) + '}')
    with tempfile.TemporaryDirectory(prefix='ls-shoulder-runtime-') as temp:
        java = Path(temp) / 'TestShoulderRuntime.java'
        java.write_text(HARNESS.replace('// CALLBACKS', '\n'.join(methods)), encoding='utf-8')
        subprocess.run(['javac', '-encoding', 'UTF-8', '-d', temp, str(java)], check=True)
        subprocess.run(['java', '-cp', temp, 'TestShoulderRuntime'], check=True)


if __name__ == '__main__':
    main()
