"""Fail closed on new host filesystem writers; legacy deletion and OEM state are explicit."""
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / 'android/app/src/main/java/ls/augment/com'
HOOK = SRC / 'hook'
checks = 0
LEXEME = re.compile(r'"(?:\\.|[^"\\])*"|\'(?:\\.|[^\'\\])*\'|//[^\n]*|/\*[\s\S]*?\*/')
SINKS = (r'\bFileOutputStream\b', r'\bFileWriter\b', r'\bRandomAccessFile\b',
         r'\bFiles\.(?:write\w*|copy|move|create\w*|newOutputStream|newBufferedWriter|newByteChannel)\s*\(',
         r'\bopenFileOutput\s*\(', r'\bopenOrCreateDatabase\s*\(', r'\.mkdirs?\s*\(',
         r'\bcreateTempFile\s*\(', r'\bProcessBuilder\b', r'Runtime\.getRuntime\s*\(')

def uncomment(source):
    return LEXEME.sub(lambda match: '' if match.group().startswith(('//', '/*'))
                     else match.group(), source)

def check(value, message):
    global checks
    checks += 1
    assert value, message

for path in sorted(HOOK.glob('*.java')):
    source = path.read_text(encoding='utf-8')
    code = uncomment(source)
    for sink in SINKS:
        check(not re.search(sink, code), f'{path.name}: unaudited host disk writer {sink}')
    if '.getSharedPreferences(' in source:
        check(path.name == 'LauncherOwnedStateClient.java', f'{path.name}: new host preferences source')
        check('legacy.prefs.edit().clear().commit()' in source, 'legacy prefs deletion lost')
        check(source.count('.getSharedPreferences(') == 1, 'new launcher host prefs source')
        check(source.count('.prefs.edit()') == 1, 'new launcher legacy mutation')
    if 'SQLiteDatabase.openDatabase(' in source:
        check(path.name == 'LauncherGridHook.java' and 'SQLiteDatabase.OPEN_READONLY' in source,
              f'{path.name}: unaudited host database open')
    if '.execSQL(' in source:
        check(path.name == 'ShoulderSelectionStore.java', f'{path.name}: unaudited host SQL mutation')
        check(source.count('.execSQL(') == 2 and ' SET state=(state & ~1)' in source
              and ' SET state=(state | 1)' in source, 'OEM selection update boundary changed')
    if 'FileChannel.open(' in source:
        check(path.name == 'CollabChargingFrame.java' and source.count('FileChannel.open(') == 1
              and 'FileChannel.open(file.toPath(),StandardOpenOption.READ,LinkOption.NOFOLLOW_LINKS)' in source,
              'new file-channel boundary requires read-only review')
    if 'ParcelFileDescriptor.open(' in source or '.openFileDescriptor(' in source:
        check(path.name == 'ComboMotionFileScaler.java', 'new descriptor-open boundary requires review')
        check('MODE_READ_WRITE' not in source and 'MODE_CREATE' not in source, 'host descriptor may write')
        for found in re.finditer(r'\.openFileDescriptor\((.*?)\);', source, re.S):
            check(re.fullmatch(r'uri,\s*"r"', found.group(1)) is not None,
                  'provider descriptor open must retain the exact read-only contract')

client = (HOOK / 'ComboMotionFileScaler.java').read_text(encoding='utf-8')
cache = (HOOK / 'ComboMotionCache.java').read_text(encoding='utf-8')
module = (HOOK / 'AugmentModule.java').read_text(encoding='utf-8')
store = (SRC / 'ComboMotionPrivateCache.java').read_text(encoding='utf-8')
for source in (client, cache):
    check('getCacheDir(' not in source and 'getFilesDir(' not in source, 'combo host cache access restored')
check('getCacheDir(' not in module, 'AugmentModule host cache access restored')
check('MotionDescriptor::reopen' in client and 'openFileDescriptor(uri, "r")' in client,
      'each native read must get independent offset from private provider')
check('ParcelFileDescriptor.dup(descriptor.getFileDescriptor())' not in client,
      'repeated native reads may share offset')
check('new File(context.getCacheDir().getCanonicalFile(), DIRECTORY)' in store,
      'cache root must come exclusively from module Context')
check('uid / 100000 != Process.myUid() / 100000' in store and '!HOST.equals(caller)' in store
      and 'getApplicationInfo(HOST, 0).uid == uid' in store, 'combo caller authentication weakened')
check('ParcelFileDescriptor.MODE_READ_ONLY' in store and '!"r".equals(mode)' in store,
      'private descriptors must be read-only')
check('ResetWriteFence.active()' in store and 'synchronized (ResetWriteFence.class)' in store,
      'reset must fence complete private cache transaction')
check('if (!installComboPrivateFdHook(classLoader)) return 0' in module,
      'virtual paths must require verified OEM fd bridge')
check('ComboMotionFileScaler.pin(managerOwner, scaled)' in module and
      'ComboMotionFileScaler.releasePlayback(owner)' in module, 'playback pin lifecycle lost')
legacy = (ROOT / 'android/app/src/main/assets/gamehelper_reset_cache.sh').read_text(encoding='utf-8')
check(legacy.index('if [ "$owned_source" = false ]') < legacy.index('am force-stop'),
      'upgrade must not stop gamehelper without owned legacy files')
check('rm -rf' not in legacy and 'file_hardlink' in legacy and 'file_changed' in legacy,
      'legacy cleanup must be narrow and revalidated')
for sample in ('new FileOutputStream(dynamicPath)', 'new FileWriter(path)',
               'new RandomAccessFile(path,"rw")', 'Files.write(path, payload)',
               'Files.move(oldPath,newPath)', 'context.openFileOutput(name,0)',
               'db.openOrCreateDatabase(dynamicPath,null)', 'directory.mkdirs()',
               'String url="content://module";new FileOutputStream(path);',
               'Files.newOutputStream(path)', 'File.createTempFile(prefix,suffix)',
               'new ProcessBuilder(command)', 'Runtime.getRuntime().exec(command)'):
    check(any(re.search(pattern, uncomment(sample)) for pattern in SINKS),
          'host writer negative control was not detected: '+sample)
print(f'PASS hook storage boundaries: {checks} checks')
