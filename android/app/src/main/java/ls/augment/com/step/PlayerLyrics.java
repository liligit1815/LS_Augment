package ls.augment.com.step;

/** Normalizes the two observed session metadata forms before keying a lyrics lookup. */
final class PlayerLyrics {
    final String title, artist, line;
    private PlayerLyrics(String title, String artist, String line) {
        this.title = title;
        this.artist = artist;
        this.line = line;
    }

    static PlayerLyrics from(String pkg, String title, String artist) {
        // Qishui optionally publishes the current lyric as TITLE and a stable
        // "song – performer" as ARTIST. A lyric tick is not a track change.
        if ("com.luna.music".equals(pkg)) {
            for (String separator : new String[]{" - ", "–", "—", "－", " − "}) {
                int split = artist.indexOf(separator);
                if (split <= 0) continue;
                String song = artist.substring(0, split).trim();
                String by = artist.substring(split + separator.length()).trim();
                if (!song.isEmpty() && !by.isEmpty()) {
                    return new PlayerLyrics(song, by, song.equals(title) ? "" : title);
                }
            }
        }
        return new PlayerLyrics(title, artist, "");
    }

    static int source(String pkg) {
        switch (pkg) {
            case "com.netease.cloudmusic": return 0;
            case "com.kugou.android": return 1;
            case "com.luna.music": return 2;
            default: return -1;
        }
    }
}
