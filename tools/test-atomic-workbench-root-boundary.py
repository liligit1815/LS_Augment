"""Guard the process boundary that justifies this backend's local hidden-API annotations."""
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "android/app/src/main/java"
PACKAGE = SRC / "ls/augment/com"
backend = (PACKAGE / "AtomicWorkbenchPlatform.java").read_text(encoding="utf-8")
root = (PACKAGE / "AtomicWorkbenchRoot.java").read_text(encoding="utf-8")
client = (PACKAGE / "AtomicWorkbenchClient.java").read_text(encoding="utf-8")

callers = [path.relative_to(SRC).as_posix() for path in SRC.rglob("*.java")
           if re.search(r"new\s+AtomicWorkbenchPlatform\s*\(", path.read_text(encoding="utf-8"))]
assert sorted(callers) == ["ls/augment/com/AtomicWorkbenchEngine.java", "ls/augment/com/AtomicWorkbenchRoot.java"], callers
# Root supplies a per-session reader through the coordinator's factory. Both
# construction sites remain inside the UID0-only backend, never an app caller.
assert root.count("new AtomicWorkbenchPlatform(") == 1
assert re.search(r"new AtomicWorkbenchEngine\(id -> new AtomicWorkbenchPlatform\(context, appUid, userId, engine, id,\s*this::readHomeReadiness,\s*this::controlInputFocus,\s*AtomicWorkbenchRecoveryScope.ReaderProfile.FULL8\),\s*AtomicWorkbenchRecoveryScope.ReaderProfile.FULL8\)", root)
engine_callers = [path.relative_to(SRC).as_posix() for path in SRC.rglob("*.java")
                  if re.search(r"new\s+AtomicWorkbenchEngine\s*\(", path.read_text(encoding="utf-8"))]
assert engine_callers == ["ls/augment/com/AtomicWorkbenchRoot.java"], engine_callers
constructor = backend.split("AtomicWorkbenchPlatform(Context systemContext", 1)[1].split("this.context", 1)[0]
assert "android.os.Process.myUid() != 0" in constructor and "throw new SecurityException" in constructor
main = root.split("public static void main(String[] ignored)", 1)[1].split("private static String readBootstrap", 1)[0]
assert main.index("Process.myUid() != 0") < main.index("exemptRootHiddenApis();") < main.index("new AtomicWorkbenchRoot(")
assert "private AtomicWorkbenchRoot(" in root
assert "setHiddenApiExemptions" in root and 'new String[]{"L"}' in root
assert 'exec /system/bin/app_process /system/bin ls.augment.com.AtomicWorkbenchRoot' in client

suppressed = re.findall(r'@SuppressLint\((?:"BlockedPrivateApi"|\{"BlockedPrivateApi", "PrivateApi"\})\)[^\n]*\n\s*(?:private\s+)?(?:static\s+)?\w+\s+(\w+)\(', backend)
assert set(suppressed) == {"open", "openInternal", "showNativeHome", "uniqueId", "tasks", "setInputDisplay", "verifyRequiredInterfaces"}, suppressed
assert len(suppressed) == 7
media = (PACKAGE / "AtomicWorkbenchMedia.java").read_text(encoding="utf-8")
media_constructor = media.split("AtomicWorkbenchMedia(Context context, int userId,", 1)[1].split("this.context", 1)[0]
assert "Process.myUid() != 0" in media_constructor and "throw new SecurityException" in media_constructor
assert re.search(r'@SuppressLint\("BlockedPrivateApi"\)\s+Method getUid = MediaSession.Token.class.getDeclaredMethod\("getUid"\)', media)
allocation = backend.split("Bundle allocateTaskDisplay(", 1)[1].split("private Bundle openInternal(", 1)[0]
assert 'int required = AtomicWorkbenchDisplayPolicy.requiredFocusFlags();' in allocation
display_policy = (PACKAGE / 'AtomicWorkbenchDisplayPolicy.java').read_text(encoding='utf-8')
assert 'int trusted=flag("FLAG_TRUSTED"),focus=flag("FLAG_OWN_FOCUS");' in display_policy
assert 'return trusted|focus;' in display_policy
assert '(display.getFlags() & required) != required' in allocation
assert 'MediaSession.Token.class.getDeclaredMethod("getUid")' in media
assert "uid / 100000 != userId" in media and "packageUid(pkg) == uid" in media
print("PASS atomic workbench ROOT boundary: Root-only engine/factory and media, UID guards, exemption ordering, seven method annotations plus two local-variable annotations, exact token/package owner checks")
