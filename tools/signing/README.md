# dev4.2 test signing lineage

The public certificate in this directory identifies the current dev4.2 test signing lineage.
The private key is intentionally excluded from the source package.

Certificate SHA-256:
`c51c7eed43c2118e98a62072b8ca2b30596c83b388f39ae536c8067612ad2f6a`

Important: APK Signature Scheme v2 contains an outer length-prefixed signer sequence and
an inner length-prefixed signer record. `tools/sign_apk_v2.py` implements both levels.
