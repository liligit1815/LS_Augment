"""Exercise the production permission check against missing, excess and API-limited grants."""
from copy import deepcopy
import importlib.util
from pathlib import Path
import struct
import unittest
import xml.etree.ElementTree as ET

ROOT = Path(__file__).resolve().parents[1]
SPEC = importlib.util.spec_from_file_location('project_checks', ROOT / 'tools/check-project.py')
PROJECT = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(PROJECT)
SPEC = importlib.util.spec_from_file_location('binary_manifest_checks', ROOT / 'tools/check-binary-manifest.py')
BINARY = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(BINARY)
ANDROID = '{http://schemas.android.com/apk/res/android}'
BASE = ET.parse(ROOT / 'android/app/src/main/AndroidManifest.xml').getroot()


def validate_source(tree, minimum_sdk=35):
    PROJECT.validate_manifest_permissions(ET.tostring(tree, encoding='unicode'), minimum_sdk)


def compile_permission_fixture(tree, minimum_sdk):
    """Minimal AXML with real typed integers/strings, consumed by the APK parser."""
    elements = [('uses-sdk', {'minSdkVersion': minimum_sdk})]
    elements += [(node.tag, {key[len(ANDROID):]: value for key, value in node.attrib.items()
                            if key.startswith(ANDROID)})
                 for node in tree if node.tag.startswith('uses-permission')]
    strings = [BINARY.ANDROID_URI, 'manifest']
    for tag, attributes in elements:
        for value in (tag, *attributes.keys(), *(str(value) for value in attributes.values())):
            if value not in strings:
                strings.append(value)
    index = {value: position for position, value in enumerate(strings)}
    offsets, encoded = [], bytearray()
    for value in strings:
        payload = value.encode('utf-8')
        assert len(payload) < 128, 'fixture string exceeds its short UTF-8 encoding'
        offsets.append(len(encoded))
        encoded += bytes((len(value), len(payload))) + payload + b'\0'
    start = 28 + 4 * len(strings)
    padding = bytes((-len(encoded)) % 4)
    pool = struct.pack('<HHI5I', 1, 28, start + len(encoded) + len(padding), len(strings), 0, 0x100, start, 0)
    pool += struct.pack('<' + 'I' * len(offsets), *offsets) + encoded + padding

    def element(tag, attributes):
        raw = struct.pack('<HHIII', 0x102, 16, 36 + 20 * len(attributes), 1, BINARY.NO_INDEX)
        raw += struct.pack('<II6H', BINARY.NO_INDEX, index[tag], 20, 20, len(attributes), 0, 0, 0)
        for key, value in attributes.items():
            numeric = key in ('minSdkVersion', 'maxSdkVersion')
            raw += struct.pack('<IIIHBBI', index[BINARY.ANDROID_URI], index[key], BINARY.NO_INDEX,
                               8, 0, 0x10 if numeric else 3, int(value) if numeric else index[str(value)])
        return raw

    def end(tag):
        return struct.pack('<HHIIIII', 0x103, 16, 24, 1, BINARY.NO_INDEX, BINARY.NO_INDEX, index[tag])

    body = pool + element('manifest', {})
    for tag, attributes in elements:
        body += element(tag, attributes) + end(tag)
    body += end('manifest')
    return struct.pack('<HHI', 3, 8, len(body) + 8) + body


def validate_binary(tree, minimum_sdk=35):
    starts = BINARY.parse_manifest(compile_permission_fixture(tree, minimum_sdk))
    BINARY.validate_binary_permissions(starts)


class PermissionContractTests:
    def test_actual_feature_and_manifest_contract(self):
        PROJECT.check_manifest()
        self.validate(BASE)

    def test_supported_api_range(self):
        for sdk in (35, 36):
            with self.subTest(sdk=sdk):
                self.validate(BASE, sdk)

    def test_every_required_permission_is_required(self):
        for permission in PROJECT.APPLICATION_PERMISSION_PURPOSES:
            with self.subTest(permission=permission):
                tree = deepcopy(BASE)
                tree.remove(next(node for node in tree.findall('uses-permission')
                                 if node.get(ANDROID + 'name') == permission))
                with self.assertRaisesRegex(AssertionError, 'missing='):
                    self.validate(tree)

    def test_unrelated_or_unrequested_permission_is_rejected(self):
        for permission in ('android.permission.READ_MEDIA_AUDIO', 'android.permission.CAMERA',
                           'android.permission.WRITE_EXTERNAL_STORAGE'):
            with self.subTest(permission=permission):
                tree = deepcopy(BASE)
                ET.SubElement(tree, 'uses-permission', {ANDROID + 'name': permission})
                with self.assertRaisesRegex(AssertionError, 'extra='):
                    self.validate(tree)

    def test_duplicate_is_not_hidden_by_set_conversion(self):
        tree = deepcopy(BASE)
        tree.append(deepcopy(tree.find('uses-permission')))
        with self.assertRaisesRegex(AssertionError, 'duplicate'):
            self.validate(tree)

    def test_no_current_permission_can_expire_silently(self):
        for permission in PROJECT.APPLICATION_PERMISSION_PURPOSES:
            for maximum in ('32', '35', '36'):
                with self.subTest(permission=permission, maximum=maximum):
                    tree = deepcopy(BASE)
                    node = next(node for node in tree.findall('uses-permission')
                                if node.get(ANDROID + 'name') == permission)
                    node.set(ANDROID + 'maxSdkVersion', maximum)
                    with self.assertRaisesRegex(AssertionError, 'SDK limit or flags'):
                        self.validate(tree)

    def test_legacy_storage_is_rejected_with_or_without_api_cap(self):
        for maximum in (None, '32', '35', '36'):
            with self.subTest(maximum=maximum):
                tree = deepcopy(BASE)
                attributes = {ANDROID + 'name': 'android.permission.READ_EXTERNAL_STORAGE'}
                if maximum is not None:
                    attributes[ANDROID + 'maxSdkVersion'] = maximum
                ET.SubElement(tree, 'uses-permission', attributes)
                with self.assertRaisesRegex(AssertionError, 'extra='):
                    self.validate(tree)

    def test_sdk_specific_tag_cannot_bypass_the_contract(self):
        for tag in ('uses-permission-sdk-23', 'uses-permission-sdk-m'):
            with self.subTest(tag=tag):
                tree = deepcopy(BASE)
                ET.SubElement(tree, tag, {ANDROID + 'name': 'android.permission.CAMERA'})
                with self.assertRaisesRegex(AssertionError, 'SDK-specific'):
                    self.validate(tree)

    def test_permission_flags_require_explicit_review(self):
        tree = deepcopy(BASE)
        tree.find('uses-permission').set(ANDROID + 'usesPermissionFlags', 'neverForLocation')
        with self.assertRaisesRegex(AssertionError, 'SDK limit or flags'):
            self.validate(tree)

    def test_lower_android_floor_requires_a_new_runtime_contract(self):
        for sdk in (32, 33, 34):
            with self.subTest(sdk=sdk):
                with self.assertRaisesRegex(AssertionError, 'minSdk >= 35'):
                    self.validate(BASE, sdk)


class SourcePermissionContractTests(PermissionContractTests, unittest.TestCase):
    validate = staticmethod(validate_source)


class BinaryPermissionContractTests(PermissionContractTests, unittest.TestCase):
    validate = staticmethod(validate_binary)

    def test_compiled_sdk_declaration_is_required_and_unique(self):
        starts = BINARY.parse_manifest(compile_permission_fixture(BASE, 35))
        without_sdk = [(tag, attributes) for tag, attributes in starts if tag != 'uses-sdk']
        with self.assertRaisesRegex(AssertionError, 'one SDK declaration'):
            BINARY.validate_binary_permissions(without_sdk)
        sdk = next(element for element in starts if element[0] == 'uses-sdk')
        with self.assertRaisesRegex(AssertionError, 'one SDK declaration'):
            BINARY.validate_binary_permissions(starts + [sdk])


if __name__ == '__main__':
    unittest.main()
