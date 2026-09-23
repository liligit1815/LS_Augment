"""Exercise appearance defaults, split thresholds, and background-only blur contracts."""
from pathlib import Path
import subprocess
import tempfile
ROOT = Path(__file__).resolve().parents[1]
JAVA = ROOT / 'android/app/src/main/java/ls/augment/com'
source = r'''
import ls.augment.com.AppearanceOptions;
import ls.augment.com.EnhancementOption;
public class TestAppearance {
  static void yes(boolean x) { if (!x) throw new AssertionError(); }
  public static void main(String[] args) {
    yes(!AppearanceOptions.dark(0,true));
    yes(AppearanceOptions.dark(1,false));
    yes(AppearanceOptions.dark(2,true));
    yes(!AppearanceOptions.dark(2,false));
    yes(!AppearanceOptions.twoPane(false,1200,1));
    yes(!AppearanceOptions.twoPane(true,719,1));
    yes(AppearanceOptions.twoPane(true,720,1));
    yes(!AppearanceOptions.twoPane(true,800,1.5f));
    yes(AppearanceOptions.twoPane(true,840,1.5f));
    yes(AppearanceOptions.maskAlpha(0)==0);
    yes(AppearanceOptions.maskAlpha(100)==255);
    yes(AppearanceOptions.maskAlpha(-5)==0);
    yes(!AppearanceOptions.blurAvailable(30,true));
    yes(!AppearanceOptions.blurAvailable(36,false));
    yes(AppearanceOptions.blurAvailable(31,true));
    for(EnhancementOption option:AppearanceOptions.options()) {
      yes(option.normalize(option.defaultValue)!=null);
      if(option.key.equals(AppearanceOptions.BLUR)||option.key.equals(AppearanceOptions.TWO_PANE)
          ||option.key.equals(AppearanceOptions.THEME)) yes("0".equals(option.defaultValue));
    }
    System.out.println("Appearance defaults, mode changes and responsive/fallback scenarios passed");
  }
}
'''
with tempfile.TemporaryDirectory(prefix='ls-appearance-') as folder:
    work = Path(folder)
    test = work / 'TestAppearance.java'; test.write_text(source,encoding='utf-8')
    subprocess.run(['javac','-encoding','UTF-8','-d',folder,
        str(JAVA/'EnhancementOption.java'),str(JAVA/'AppearanceOptions.java'),str(test)],check=True)
    subprocess.run(['java','-cp',folder,'TestAppearance'],check=True)
controller=(JAVA/'AppearanceController.java').read_text(encoding='utf-8')
background=controller.split('private final class Background extends View',1)[1].split('private static String title',1)[0]
assert 'setRenderEffect(' in background
assert controller.count('setRenderEffect(')==1, 'Blur must stay on the isolated backdrop'
assert 'layers.addView(backdrop' in controller and 'layers.addView(content' in controller
ui=(JAVA/'UiKit.java').read_text(encoding='utf-8')
assert 'appearance.detailBody(this,scroll,body)' in ui
print('Feature forms remain separate from the background blur layer')
