# dev4.2 test signing lineage

The public certificate in this directory identifies the historical dev4.2 test signing lineage.
The private key is intentionally excluded from the source package.

Current test20378 release packaging uses the existing test20363/test20364/test20365 upgrade certificate,
SHA-256 `4e5c23c41de3d7d56f120309e9fe8dab7d53483c50ef18a176e00558abf7b8cb`.
Its private material is supplied locally from the ignored `.signing/` directory,
through the `LS_AUGMENT_*` signing environment variables. Always compare the final
APK certificate with the previous release; the historical PEM below is not that identity.

Certificate SHA-256:
`c51c7eed43c2118e98a62072b8ca2b30596c83b388f39ae536c8067612ad2f6a`

Important: APK Signature Scheme v2 contains an outer length-prefixed signer sequence and
an inner length-prefixed signer record. `tools/sign_apk_v2.py` implements both levels.
