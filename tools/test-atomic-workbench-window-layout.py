"""Execute the actual phone presentation geometry; no Android/Gradle/phone use."""
from pathlib import Path
import argparse
import hashlib
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / 'android/app/src/main/java/ls/augment/com/AtomicWorkbenchWindowLayoutPlan.java'
TEST = ROOT / 'tools/fixtures/AtomicWorkbenchWindowLayoutPlanTest.java'
JDK = Path(r'C:\Program Files\Android\openjdk\jdk-21.0.8\bin')


def run(folder, source):
    folder.mkdir()
    java = folder / SRC.name
    java.write_text(source, encoding='utf-8')
    compiled = subprocess.run([str(JDK / 'javac.exe'), '-J-Duser.language=en', '-J-Dfile.encoding=UTF-8',
        '--release', '17', '-encoding', 'UTF-8', '-d', str(folder / 'classes'), str(java), str(TEST)],
        capture_output=True, text=True, encoding='utf-8', errors='replace', timeout=45)
    if compiled.returncode:
        raise AssertionError(compiled.stdout + compiled.stderr)
    return subprocess.run([str(JDK / 'java.exe'), '-Dfile.encoding=UTF-8', '-cp', str(folder / 'classes'),
        'ls.augment.com.AtomicWorkbenchWindowLayoutPlanTest'], capture_output=True,
        text=True, encoding='utf-8', errors='replace', timeout=45)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--negative-controls', action='store_true')
    args = parser.parse_args()
    before = {p: hashlib.sha256(p.read_bytes()).hexdigest() for p in (SRC, TEST)}
    source = SRC.read_text(encoding='utf-8')
    variants = [
        ('mirror-reversed', [('RailSide.LEFT', 'RailSide.RIGHT', 2)]),
        ('identity-used-as-index', [('frames.put(id, new Frame', 'frames.put((id + 1) % MAX_WINDOW_IDENTITIES, new Frame', 2)]),
        ('different-side-ratio', [('availableWidth / 4', 'availableWidth / 3', 1)]),
        ('lost-last-row-remainder', [('index == count - 1 ? viewport.bottom - top : sideHeight', 'sideHeight', 1)]),
        ('fullscreen-leaves-sides', [('expanded ? Collections.emptyList() : topology.visibleSideWindowIds()', 'topology.visibleSideWindowIds()', 1)]),
        ('hidden-producer-on-screen', [('return Rect.ofSize(-2, -2, 1, 1)', 'return Rect.ofSize(0, 0, 1, 1)', 1)]),
        ('old-inset-hiding-paints-chrome', [
            ('if (index < 0) rect = hiddenProducer();', 'if (index < 0) rect = Rect.ofSize(viewport.left - 2, viewport.top - 2, 1, 1);', 1),
            ('!frame.bounds.equals(hiddenProducer()) || frame.bounds.overlaps(viewport)',
             'frame.bounds.width() != 1 || frame.bounds.height() != 1 || frame.bounds.overlaps(viewport)', 1)]),
        ('main-anchor-loses-inset', [('Rect.ofSize(mainLeft, viewport.top, mainWidth, height)', 'Rect.ofSize(mainLeft, 0, mainWidth, height)', 1)]),
        ('unknown-future-mode-rendered', [('topology.allWindowIds().size() != 4 || topology.mainWindowIds().size() != 1\n                || topology.sideWindowIds().size() != 3', 'false', 1)]),
    ]
    with tempfile.TemporaryDirectory(prefix='duo-window-layout-') as temporary:
        folder = Path(temporary)
        positive = run(folder / 'positive', source)
        print(positive.stdout, end='')
        if positive.returncode:
            raise AssertionError(positive.stdout + positive.stderr)
        if args.negative_controls:
            for name, changes in variants:
                mutant = source
                for old, new, count in changes:
                    if mutant.count(old) != count:
                        raise AssertionError('actual production mutation anchor changed: ' + name)
                    mutant = mutant.replace(old, new)
                negative = run(folder / name, mutant)
                if negative.returncode == 0 or not any(v in negative.stderr for v in ('AssertionError', 'IllegalArgumentException')):
                    raise AssertionError('negative control did not detect behavior: ' + name + '\n' + negative.stdout + negative.stderr)
                print('PASS window layout negative: ' + name)
    assert before == {p: hashlib.sha256(p.read_bytes()).hexdigest() for p in before}, 'actual sources changed during verification'
    print('ACTUAL WINDOW LAYOUT VERIFIED; PHONE VISUAL/INPUT ACCEPTANCE PENDING')


if __name__ == '__main__':
    main()
