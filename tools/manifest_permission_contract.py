"""One reviewed application permission contract for source XML and compiled APKs."""
import xml.etree.ElementTree as ET

ANDROID_URI = 'http://schemas.android.com/apk/res/android'
APPLICATION_PERMISSION_PURPOSES = {
    'android.permission.QUERY_ALL_PACKAGES': 'hidden-app management and app discovery',
    'android.permission.RECEIVE_BOOT_COMPLETED': 'BootReceiver schedules phone-side recovery',
    'android.permission.PACKAGE_USAGE_STATS': 'existing workbench usage sorting, gated by explicit usage access and AppOps',
    'android.permission.INTERNET': 'contributors, update manifests and confirmed APK downloads',
    'android.permission.REQUEST_INSTALL_PACKAGES': 'user-confirmed downloaded APK installation',
    'com.autonavi.minimap.permission.NAVIGATION_SERVICE': 'AtomicWorkbenchAmapLinkClient navigation binding',
    'android.permission.READ_MEDIA_IMAGES': 'workbench photo collection after runtime consent',
    'android.permission.READ_MEDIA_VIDEO': 'workbench video collection after runtime consent',
    'android.permission.READ_MEDIA_VISUAL_USER_SELECTED': 'workbench user-selected photo/video access',
    'android.permission.MANAGE_EXTERNAL_STORAGE': 'workbench file collection through explicit all-files settings',
}


def validate_permission_declarations(declarations, minimum_sdk):
    # A lower floor needs a runtime review, rather than accidentally reviving a
    # pre-33 storage declaration which does nothing on every supported device.
    assert minimum_sdk >= 35, 'application permission contract requires minSdk >= 35'
    assert all(tag == 'uses-permission' for tag, _ in declarations), \
        'unexpected SDK-specific application permission declaration'
    names = [attributes.get('name') for _, attributes in declarations]
    assert len(names) == len(set(names)), 'duplicate application permission declaration'
    actual, expected = set(names), set(APPLICATION_PERMISSION_PURPOSES)
    assert actual == expected, \
        f'application permission mismatch: missing={sorted(expected - actual)}; extra={sorted(actual - expected, key=str)}'
    for _, attributes in declarations:
        name = attributes['name']
        # All current permissions must survive throughout the supported API range;
        # maxSdkVersion and special permission flags need a new explicit contract.
        assert attributes == {'name': name}, \
            f'unexpected permission SDK limit or flags: {name}; purpose={APPLICATION_PERMISSION_PURPOSES[name]}'


def validate_manifest_permissions(manifest_text, minimum_sdk):
    android = '{' + ANDROID_URI + '}'
    declarations = [(node.tag, {key[len(android):]: value for key, value in node.attrib.items()
                               if key.startswith(android)})
                    for node in ET.fromstring(manifest_text) if node.tag.startswith('uses-permission')]
    validate_permission_declarations(declarations, minimum_sdk)
