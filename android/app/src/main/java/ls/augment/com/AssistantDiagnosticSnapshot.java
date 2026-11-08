package ls.augment.com;

/** Export-only fixed commands. No intents, recognition payloads, speech, accounts or arbitrary keys. */
final class AssistantDiagnosticSnapshot {
    static final String SCRIPT = "u=$(am get-current-user)\n"
            + "case \"$u\" in ''|*[!0-9]*) echo current_user_unavailable; exit 1;; esac\n"
            + "echo currentUser=$u\n"
            + "for k in assistant voice_interaction_service user_setup_complete; do\n"
            + "  printf '%s=' \"$k\"; settings --user \"$u\" get secure \"$k\" | cut -c 1-512\n"
            + "done\n"
            + "echo policy_state\n"
            + "p=$(dumpsys window policy | grep -E 'mCurrentUserId=|mLongPressOnPowerBehavior=|mPowerKeyHandled=' | cut -c 1-512)\n"
            + "if [ -n \"$p\" ]; then printf '%s\\n' \"$p\"; else echo policy_fields_unavailable; fi\n"
            + "echo voice_service_state\n"
            + "v=$(dumpsys voiceinteraction | grep -E '^[[:space:]]*(mCurUser|mCurInteractor|mCurRecognizer|mComponent|mBound|mService|mSessionComponent|mTemporarilyDisabled)[=:]' | cut -c 1-512)\n"
            + "if [ -n \"$v\" ]; then printf '%s\\n' \"$v\"; else echo voice_service_fields_unavailable; fi\n";
    private AssistantDiagnosticSnapshot() { }
}
