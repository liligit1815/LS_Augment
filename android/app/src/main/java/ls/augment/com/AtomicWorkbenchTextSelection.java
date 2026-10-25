package ls.augment.com;

import java.text.BreakIterator;
import java.util.ArrayList;
import java.util.BitSet;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

/** Original-text selection over real segmenter boundaries; no text is normalized or logged. */
final class AtomicWorkbenchTextSelection {
    static final int MAX_TEXT = 32768;
    enum Kind { WORD, PUNCTUATION, WHITESPACE }
    static final class Token {
        final int start, end;
        final String text;
        final Kind kind;
        Token(String original, int start, int end) {
            this.start = start; this.end = end; text = original.substring(start, end);
            boolean whitespace = true, word = false;
            for (int index = start; index < end;) {
                int point = original.codePointAt(index);
                whitespace &= Character.isWhitespace(point) || Character.isSpaceChar(point);
                int type = Character.getType(point);
                word |= Character.isLetterOrDigit(point) || type == Character.NON_SPACING_MARK
                        || type == Character.COMBINING_SPACING_MARK || type == Character.ENCLOSING_MARK;
                index += Character.charCount(point);
            }
            kind = whitespace ? Kind.WHITESPACE : word ? Kind.WORD : Kind.PUNCTUATION;
        }
        boolean selectable() { return kind != Kind.WHITESPACE; }
    }
    static final class Snapshot {
        final String text;
        final long revision;
        private final int[] spans, selected;
        private Snapshot(String text, long revision, int[] spans, int[] selected) {
            this.text = text; this.revision = revision; this.spans = spans.clone(); this.selected = selected.clone();
        }
        int[] spans() { return spans.clone(); }
        int[] selectedRanges() { return selected.clone(); }
    }
    final class RangeGesture {
        private final int anchor;
        private final boolean select;
        private final BitSet before;
        private long expectedRevision;
        private boolean closed;
        private RangeGesture(int anchor) {
            requireSelectable(anchor); this.anchor = anchor; select = !selection.get(anchor);
            before = (BitSet) selection.clone(); expectedRevision = revision;
        }
        boolean moveTo(int index) {
            if (closed || revision != expectedRevision) { closed = true; return false; }
            requireIndex(index);
            BitSet next = (BitSet) before.clone();
            for (int token = Math.min(anchor, index); token <= Math.max(anchor, index); token++)
                if (tokens.get(token).selectable()) next.set(token, select);
            replaceSelection(next); expectedRevision = revision; return true;
        }
        void finish() { closed = true; }
        boolean cancel() {
            if (closed || revision != expectedRevision) { closed = true; return false; }
            closed = true; replaceSelection((BitSet) before.clone()); return true;
        }
    }

    private final String text;
    private List<Token> tokens;
    private BitSet selection = new BitSet();
    private long revision;

    AtomicWorkbenchTextSelection(String original, int[] boundaries) {
        validateText(original);
        text = original;
        validateSpans(original, boundaries);
        // JNI offsets remain authoritative for words. The UI joins cuts inside a single
        // displayed grapheme so a tap/selection never takes half an emoji or combining form.
        BreakIterator characters = BreakIterator.getCharacterInstance(Locale.ROOT);
        characters.setText(original);
        ArrayList<Token> result = new ArrayList<>();
        int start = 0;
        for (int index = 0; index < boundaries.length; index += 2) {
            int end = boundaries[index + 1];
            if (characters.isBoundary(end)) { result.add(new Token(original, start, end)); start = end; }
        }
        if (start != original.length()) throw new IllegalArgumentException("Invalid text boundary");
        tokens = Collections.unmodifiableList(result);
    }
    List<Token> tokens() { return tokens; }
    String originalText() { return text; }
    long revision() { return revision; }
    boolean selected(int index) { requireIndex(index); return selection.get(index); }
    int selectedCount() { return selection.cardinality(); }
    boolean hasSelection() { return !selection.isEmpty(); }
    void toggle(int index) {
        requireSelectable(index);
        BitSet next = (BitSet) selection.clone(); next.flip(index); replaceSelection(next);
    }
    void selectAll() {
        BitSet next = new BitSet();
        for (int index = 0; index < tokens.size(); index++) if (tokens.get(index).selectable()) next.set(index);
        replaceSelection(next);
    }
    void clear() { replaceSelection(new BitSet()); }
    void invert() {
        BitSet next = new BitSet();
        for (int index = 0; index < tokens.size(); index++)
            if (tokens.get(index).selectable() && !selection.get(index)) next.set(index);
        replaceSelection(next);
    }
    RangeGesture beginRange(int anchor) { return new RangeGesture(anchor); }

    String selectedText() {
        if (selection.isEmpty()) return "";
        int selectable = 0;
        for (Token token : tokens) if (token.selectable()) selectable++;
        if (selection.cardinality() == selectable) return text;
        StringBuilder result = new StringBuilder();
        Token previous = null;
        boolean uninterrupted = true;
        for (int index = 0; index < tokens.size(); index++) {
            Token token = tokens.get(index);
            if (!token.selectable()) continue;
            if (!selection.get(index)) { uninterrupted = false; continue; }
            if (previous != null && uninterrupted) result.append(text, previous.end, token.start);
            result.append(text, token.start, token.end); previous = token; uninterrupted = true;
        }
        return result.toString();
    }

    /** Split only selected multi-character words, preserving every other token and selection. */
    boolean splitSelectedWords() {
        ArrayList<Token> next = new ArrayList<>(); BitSet chosen = new BitSet();
        BreakIterator characters = BreakIterator.getCharacterInstance(Locale.ROOT); characters.setText(text);
        boolean changed = false;
        for (int index = 0; index < tokens.size(); index++) {
            Token token = tokens.get(index);
            int firstEnd = characters.following(token.start);
            boolean split = selection.get(index) && token.kind == Kind.WORD && firstEnd < token.end;
            if (!split) { if (selection.get(index)) chosen.set(next.size()); next.add(token); continue; }
            changed = true;
            for (int start = token.start; start < token.end;) {
                int end = characters.following(start);
                if (end <= start || end > token.end) throw new IllegalStateException("Invalid character boundary");
                chosen.set(next.size()); next.add(new Token(text, start, end)); start = end;
            }
        }
        if (changed) { tokens = Collections.unmodifiableList(next); selection = chosen; revision++; }
        return changed;
    }

    Snapshot snapshot() {
        int[] boundaries = new int[tokens.size() * 2], ranges = new int[selection.cardinality() * 2];
        int chosen = 0;
        for (int index = 0; index < tokens.size(); index++) {
            Token token = tokens.get(index); boundaries[index * 2] = token.start; boundaries[index * 2 + 1] = token.end;
            if (selection.get(index)) { ranges[chosen++] = token.start; ranges[chosen++] = token.end; }
        }
        return new Snapshot(text, revision, boundaries, ranges);
    }
    static AtomicWorkbenchTextSelection restore(Snapshot saved) {
        if (saved == null) throw new IllegalArgumentException("Missing selection state");
        return restore(saved.text, saved.spans(), saved.selectedRanges(), saved.revision);
    }
    static AtomicWorkbenchTextSelection restore(String text, int[] boundaries, int[] selectedRanges, long revision) {
        AtomicWorkbenchTextSelection model = new AtomicWorkbenchTextSelection(text, boundaries);
        if (revision < 0 || selectedRanges == null || selectedRanges.length % 2 != 0)
            throw new IllegalArgumentException("Invalid selection state");
        int lastEnd = 0, tokenIndex = 0;
        for (int index = 0; index < selectedRanges.length; index += 2) {
            int start = selectedRanges[index], end = selectedRanges[index + 1];
            if (start < lastEnd || end <= start) throw new IllegalArgumentException("Invalid selection range");
            while (tokenIndex < model.tokens.size() && model.tokens.get(tokenIndex).start < start) tokenIndex++;
            if (tokenIndex >= model.tokens.size()) throw new IllegalArgumentException("Missing selected token");
            Token token = model.tokens.get(tokenIndex);
            if (token.start != start || token.end != end || !token.selectable())
                throw new IllegalArgumentException("Selection does not match token");
            model.selection.set(tokenIndex++); lastEnd = end;
        }
        model.revision = revision; return model;
    }
    private void replaceSelection(BitSet next) {
        if (!next.equals(selection)) { selection = next; revision++; }
    }
    private void requireIndex(int index) {
        if (index < 0 || index >= tokens.size()) throw new IllegalArgumentException("Invalid token index");
    }
    private void requireSelectable(int index) {
        requireIndex(index);
        if (!tokens.get(index).selectable()) throw new IllegalArgumentException("Whitespace is not a word");
    }
    private static void validateText(String text) {
        if (text == null || text.length() > MAX_TEXT) throw new IllegalArgumentException("Text limit exceeded");
        for (int index = 0; index < text.length(); index++) {
            char current = text.charAt(index);
            if (Character.isHighSurrogate(current)) {
                if (index + 1 >= text.length() || !Character.isLowSurrogate(text.charAt(++index)))
                    throw new IllegalArgumentException("Invalid UTF16");
            } else if (Character.isLowSurrogate(current)) throw new IllegalArgumentException("Invalid UTF16");
        }
    }
    private static void validateSpans(String text, int[] boundaries) {
        if (boundaries == null || boundaries.length % 2 != 0 || boundaries.length > text.length() * 2)
            throw new IllegalArgumentException("Invalid segment count");
        int previous = 0;
        for (int index = 0; index < boundaries.length; index += 2) {
            int start = boundaries[index], end = boundaries[index + 1];
            if (start != previous || end <= start || end > text.length()
                    || end < text.length() && Character.isLowSurrogate(text.charAt(end)))
                throw new IllegalArgumentException("Invalid segment boundary");
            previous = end;
        }
        if (previous != text.length()) throw new IllegalArgumentException("Incomplete segmentation");
    }
}
