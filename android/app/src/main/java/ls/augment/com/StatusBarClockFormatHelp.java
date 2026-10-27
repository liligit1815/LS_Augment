package ls.augment.com;

import java.util.Calendar;
import java.util.Locale;
import ls.augment.com.hook.StatusBarClockFormatter;

/** One format reference shared by both status-bar editors. */
final class StatusBarClockFormatHelp {
    private StatusBarClockFormatHelp() { }

    static String text() {
        StringBuilder help=new StringBuilder(
                "格式区分大小写。下面列出标准格式和本模块扩展；内容可长按选择、复制。\n\n"
                + "时间\n"
                + "H / HH：24 小时，0–23 / 00–23。\n"
                + "h / hh：12 小时，1–12 / 01–12。\n"
                + "K / KK：12 小时，0–11 / 00–11。\n"
                + "k / kk：24 小时，1–24 / 01–24；午夜为 24。\n"
                + "m / mm：分钟，0–59 / 00–59。\n"
                + "小时或分钟字段后可接 +整数 或 -整数，例如 HH-15:mm-10 表示整体减去 15 小时 10 分钟；实际 02:05 时显示前一天的 10:55。H、h、K、k、m 都支持，数值为 0–999999，可连续加减。\n"
                + "同一行的偏移合并计算，分钟会向小时进位／借位，日期、星期和时段也随之变化；两行分别计算。要原样显示减号与数字，用单引号包住，例如 HH'-15':mm。\n"
                + "s / ss：秒，0–59 / 00–59。\n"
                + "S / SS / SSS：毫秒字段，建议用 SSS 显示三位；短格式的精度按系统实现。\n"
                + "a：系统语言的上午／下午（如 AM、PM）。\n"
                + "aa 及更多 a：本模块时段；中文为凌晨（0–4 时）、早上（5–7 时）、上午（8–10 时）、中午（11–12 时）、下午（13–17 时）、傍晚（18–19 时）、晚上（20–23 时）；其他语言为 AM／PM。\n\n"
                + "日期与星期\n"
                + "y / yy / yyyy：年份 / 年份末两位 / 至少四位年份。\n"
                + "M / MM：月份，1–12 / 01–12；MMM 月份简称、MMMM 月份全称。\n"
                + "L / LL / LLL / LLLL：独立形式的月份数字、两位数字、简称、全称。\n"
                + "MMMMM / LLLLL：系统提供的月份窄形式，部分系统与全称相同。\n"
                + "d / dd：月内日期，1–31 / 01–31。\n"
                + "E / EE / EEE：星期简称；EEEE 星期全称；EEEEE 为系统提供的窄形式，部分系统与全称相同。\n"
                + "u：星期数字，星期一为 1，星期日为 7。\n"
                + "D / DD / DDD：年内第几天；重复字母指定最少位数。\n"
                + "w / ww：年内第几周；W：月内第几周，周起始日和首周规则跟随系统语言。\n"
                + "F：本月第几个同名星期，例如第二个星期二为 2。\n"
                + "G：固定显示“公元”。\n\n"
                + "时区\n"
                + "z / zz / zzz：时区简称；zzzz 及更多 z：时区全称。\n"
                + "Z / ZZ / ZZZ：时区偏移，通常如 +0800；ZZZZ / ZZZZZ 的长形式由系统决定。\n"
                + "X：小时偏移，如 +08；XX：小时分钟，如 +0800；XXX：带冒号，如 +08:00。零偏移显示 Z；X 会省略非整小时部分，需要准确分钟时使用 XX 或 XXX。只支持 1–3 个 X。\n\n"
                + "农历、干支与节气\n"
                + "N：农历月名，如正、七、冬、腊、闰六；不带“月”字。\n"
                + "NN：农历月干支，如丙申。\n"
                + "NNN：农历月日，如八月十三；不含年份。\n"
                + "NNNN 及更多 N：农历月日与当天节气；非节气日只显示月日。\n"
                + "e：农历日，如初一、廿七、三十。\n"
                + "Y：农历干支年，如丙午。大写 Y 在本模块中不表示周年份；公历年份使用小写 y。\n"
                + "A：生肖，如马。\n"
                + "t：当天节气，如秋分；非节气日为空。\n"
                + "I：时辰地支，如子、午；II 及更多 I：时干支，按午夜换日。\n"
                + "Y、A、e、t、G 重复字母不会改变含义。农历和节气按手机当地公历日期查询香港天文台 1901–2100 年历表，超出范围无效。\n\n"
                + "书写与刷新规则\n"
                + "普通数字、中文、空格、冒号、斜线和连字符可直接输入。固定英文字母用单引号包住，如 'UTC'；两个单引号 '' 显示一个单引号。单引号必须成对。\n"
                + "数字字段重复通常表示最少位数，较短时补零；不是截断位数。年份 yy、文字字段和上述模块扩展按各自规则显示。\n"
                + "M 是月份，m 是分钟；d 是月内日期，D 是年内第几天。未支持的字母或重复方式会原样显示，不代表已成功转换。\n"
                + "第一行留空使用默认时间；第二行留空不绘制第二行。双排请分别填写两行，不要输入字面量 \\n。默认 24 小时制和显示秒只作用于留空的第一行。默认 12 小时制显示系统上午／下午，开启显示时段后改用本模块时段。显示时段、显示星期也会追加到非空自定义第一行，不会自动去重；格式已含 aa、E 时，请关闭对应选项。\n"
                + "含未加引号的 s 或 S 会按秒刷新；需要更快更新毫秒时另开“启用时钟毫秒刷新”。显示文字与时区跟随系统设置，格式本身不会切换时区。\n\n");

        Calendar sample=Calendar.getInstance(Locale.ROOT);sample.clear();
        sample.set(2026,Calendar.SEPTEMBER,23,14,5,9);sample.set(Calendar.MILLISECOND,123);
        String[][] candidates={
                {"c cc ccc cccc ccccc","c / cc / ccc / cccc / ccccc","独立形式的星期文字","c cccc ccccc"},
                {"b bbbb bbbbb","b / bbbb / bbbbb","系统时段字段","b bbbb bbbbb"},
                {"B BBBB BBBBB","B / BBBB / BBBBB","系统灵活时段字段","B BBBB BBBBB"}};
        boolean[] supported=new boolean[candidates.length];
        StringBuilder extra=new StringBuilder();
        for(int i=0;i<candidates.length;i++) {
            String[] entry=candidates[i];
            supported[i]=supportsTokens(sample,entry[0]);
            if(supported[i])extra.append(entry[1]).append("：").append(entry[2]).append("；具体文字以本机示例为准。\n");
        }
        if(extra.length()>0)help.append("本机额外支持\n").append(extra).append('\n');
        if(!supported[1]||!supported[2]) {
            String unavailable=!supported[1]&&!supported[2]?"b / B":!supported[1]?"b":"B";
            help.append("本机未提供可用的 ").append(unavailable)
                    .append(" 时段示例；请使用 a（系统上午／下午）或 aa（本模块时段）。\n\n");
        }
        help.append("可复制示例\n示例时间：2026-09-23 14:05:09.123，使用本机语言和时区。\n");
        for(String pattern:new String[]{"HH:mm","HH:mm:ss","HH:mm:ss.SSS","aa h:mm",
                "yyyy-MM-dd EEEE","MM/dd E","NNNN","Y'年' N'月'e","A'年' II'时'",
                "HH'时'mm'分'","yyyy-MM-dd'T'HH:mm:ssXXX","'o''clock' HH:mm",
                "S SS SSS","Z ZZZZ ZZZZZ","MMMMM LLLLL EEEEE"})appendExample(help,sample,pattern);
        for(int i=0;i<candidates.length;i++)if(supported[i])appendExample(help,sample,candidates[i][3]);
        return help.toString();
    }

    private static boolean supportsTokens(Calendar sample,String patterns) {
        // Android may accept b/B construction but format them as empty text.
        // Check every advertised token; separator spaces are not usable output.
        for(String token:patterns.split(" ")) {
            StatusBarClockFormatter.FormatResult result=StatusBarClockFormatter.formatDetailed(
                    sample.getTimeInMillis(),Locale.getDefault(),true,false,false,false,token,"");
            if(!result.valid||blank(result.text)||token.equals(result.text))return false;
        }
        return true;
    }

    private static boolean blank(String text) {
        if(text==null||text.isEmpty())return true;
        for(int i=0;i<text.length();i++)if(!Character.isWhitespace(text.charAt(i))&&!Character.isSpaceChar(text.charAt(i)))return false;
        return true;
    }

    private static void appendExample(StringBuilder help,Calendar sample,String pattern){
        StatusBarClockFormatter.FormatResult result=StatusBarClockFormatter.formatDetailed(
                sample.getTimeInMillis(),Locale.getDefault(),true,false,false,false,pattern,"");
        help.append(pattern).append("  →  ").append(result.valid?result.text:result.error).append('\n');
    }
}
