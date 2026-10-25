"""Compare build configuration parsing with the JDK Properties implementation."""
import base64
from pathlib import Path
import subprocess
import tempfile

from java_properties import read_properties

ROOT = Path(__file__).resolve().parents[1]
FIXTURE = r'''
# Android Studio style, Windows paths with spaces and escaped drive colons
sdk.dir=E\:/ExampleProject/android-sdk
ndk.dir=C\:/Program Files (x86)/Android/AndroidNDK/android-ndk-r27c
windows=C\:\\Users\\ExampleUser\\Sdk
\ key\:\==space\ value
colon: value:with=delimiters
whitespace  =  trimmed
no.value
unicode=\u7ea2\u9b54Duo
escapes=tab\tnewline\nreturn\rform\fother\q
continued=one\
    two\
    three
comment.continued=\
    #this is a value
! ignore=this comment
duplicate=old
duplicate=new
trailing=two\\
'''

with tempfile.TemporaryDirectory(prefix='duo-properties-') as temp:
    folder = Path(temp)
    fixture = folder / 'local.properties'
    fixture.write_text(FIXTURE, encoding='iso-8859-1')
    java = folder / 'ReadProperties.java'
    java.write_text('''
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
class ReadProperties {
    public static void main(String[] args) throws Exception {
        Properties properties = new Properties();
        try (InputStream input = new FileInputStream(args[0])) { properties.load(input); }
        Base64.Encoder encoder = Base64.getEncoder();
        for (String key : new TreeSet<>(properties.stringPropertyNames())) {
            System.out.println(encoder.encodeToString(key.getBytes(StandardCharsets.UTF_8))
                + ":" + encoder.encodeToString(properties.getProperty(key).getBytes(StandardCharsets.UTF_8)));
        }
    }
}
''', encoding='utf-8')
    output = subprocess.check_output(['java', str(java), str(fixture)], encoding='utf-8')
    expected = {}
    for line in output.splitlines():
        key, value = line.split(':', 1)
        expected[base64.b64decode(key).decode('utf-8')] = base64.b64decode(value).decode('utf-8')
    actual = read_properties(fixture)
    assert actual == expected, (actual, expected)
    assert actual['sdk.dir'] == 'E:/ExampleProject/android-sdk'
    for malformed in (r'bad=\u12', r'bad=\u12xz'):
        fixture.write_text(malformed, encoding='iso-8859-1')
        try:
            read_properties(fixture)
            raise AssertionError('Malformed Unicode escape accepted')
        except ValueError:
            pass
    print(f'Java Properties regression: {len(expected)} parsed values match the JDK; malformed escapes rejected')
