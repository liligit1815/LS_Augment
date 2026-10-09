# Release signing

Current distributed Release package: `2.0.0-alpha1-test20505` / versionCode `20505`.
Previous distributed release: `2.0.0-alpha1-test20497` / versionCode `20497`.

The current upgrade signing certificate has SHA-256
`4e5c23c41de3d7d56f120309e9fe8dab7d53483c50ef18a176e00558abf7b8cb`.
Its private material is supplied locally through the ignored `.signing/` configuration
or the `LS_AUGMENT_KEYSTORE`, `LS_AUGMENT_STORE_PASSWORD`,
`LS_AUGMENT_KEY_ALIAS`, and `LS_AUGMENT_KEY_PASSWORD` environment variables.
Always compare the final APK certificate with the package being upgraded.

Update `android/version.properties` explicitly before packaging; builds never mutate it.
Run `python tools/build-release.py --previous <previous-release.apk>` with the preceding
local build after incrementing versionCode by exactly one and matching the test suffix
in versionName. The helper checks the previous certificate, builds Release, and verifies
the final certificate, version, and alignment. APKs and local verification receipts are
written to `out/` and are excluded from the source repository.

The public `dev41-test-cert.pem` identifies the historical dev4.2 test signing lineage:
`c51c7eed43c2118e98a62072b8ca2b30596c83b388f39ae536c8067612ad2f6a`.
It is distinct from the current release certificate and cannot replace a private key.
Private keys and passwords must not be included in Git or source packages.

APK Signature Scheme v2 contains an outer length-prefixed signer sequence and
an inner length-prefixed signer record. `tools/sign_apk_v2.py` implements both levels.
