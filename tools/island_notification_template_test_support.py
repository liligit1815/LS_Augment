"""Shared production template dependencies for Android source regression harnesses."""
from pathlib import Path

def add_templates(files):
    src=Path(__file__).resolve().parents[1]/'android/app/src/main/java/ls/augment/com'
    for name in ['IslandTemplateRules','IslandNoticeRules','IslandDownloadConfig','IslandNotificationProgress',
                 'IslandNotificationContent','hook/IslandNotificationTemplates','hook/IslandNotificationText']:
        files['ls/augment/com/'+name+'.java']=(src/(name+'.java')).read_text('utf-8')
    name='android/os/Bundle.java';value=files[name]
    additions={
        'getCharSequence(':'public CharSequence getCharSequence(String k){return (CharSequence)get(k);}',
        'getCharSequenceArray(':'public CharSequence[] getCharSequenceArray(String k){return (CharSequence[])get(k);}',
        'getString(':'public String getString(String k,String d){return containsKey(k)?(String)get(k):d;}',
    }
    for marker,code in additions.items():
        if marker not in value:value=value.replace('public int getInt',code+'public int getInt',1)
    files[name]=value
    name='android/app/Notification.java';value=files[name];extra=[]
    for field,literal in {'EXTRA_TITLE':'title','EXTRA_TITLE_BIG':'titleBig','EXTRA_TEXT':'text','EXTRA_SUB_TEXT':'sub',
        'EXTRA_BIG_TEXT':'big','EXTRA_INFO_TEXT':'info','EXTRA_TEXT_LINES':'lines','EXTRA_TEMPLATE':'template',
        'CATEGORY_TRANSPORT':'transport','CATEGORY_NAVIGATION':'navigation','CATEGORY_CALL':'call','CATEGORY_ALARM':'alarm'}.items():
        if field not in value:extra.append(f'public static final String {field}="{literal}";')
    for field,kind in {'category':'String','contentView':'Object','bigContentView':'Object','headsUpContentView':'Object'}.items():
        if field not in value:extra.append(f'public {kind} {field};')
    files[name]=value.replace('public class Notification{','public class Notification{'+''.join(extra),1)
