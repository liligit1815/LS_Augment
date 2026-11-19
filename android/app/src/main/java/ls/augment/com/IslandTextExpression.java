package ls.augment.com;

import java.util.*;
import java.util.regex.*;

/** Local text substitutions only. No script execution, network, state changes or unbounded regex work. */
public final class IslandTextExpression {
    public static final int MAX_EXPRESSION=320,MAX_RESULT=16384;
    public static final Set<String> VARIABLES=Set.of("default","title","text","subtext","bigtext","info","lines",
            "app","package","channel","progress","state","count","notification_count");
    private IslandTextExpression(){}
    private static final class Invalid extends RuntimeException {}
    private static final class Limit extends RuntimeException {}
    private static final class Budget {
        int steps=24000;
        final long deadline=System.nanoTime()+8_000_000L;
        void step(){if(--steps<0||(steps&127)==0&&System.nanoTime()>deadline)throw new Limit();}
    }
    private static final class Input implements CharSequence {
        final String text;final int start,end;final Budget budget;
        Input(String text,Budget budget){this(text,0,text.length(),budget);}
        Input(String text,int start,int end,Budget budget){this.text=text;this.start=start;this.end=end;this.budget=budget;}
        public int length(){return end-start;}
        public char charAt(int index){budget.step();if(index<0||index>=length())throw new IndexOutOfBoundsException();return text.charAt(start+index);}
        public CharSequence subSequence(int a,int b){budget.step();if(a<0||b<a||b>length())throw new IndexOutOfBoundsException();return new Input(text,start+a,start+b,budget);}
        public String toString(){return text.substring(start,end);}
    }
    public static String error(String expression){
        if(expression==null||expression.length()>MAX_EXPRESSION)return "表达式最多320字";
        for(int i=0;i<expression.length();i++){
            char ch=expression.charAt(i);
            if(Character.isISOControl(ch)&&ch!='\n'&&ch!='\t')return "表达式含不可用的控制字符";
            if(Character.isHighSurrogate(ch)){if(++i>=expression.length()||!Character.isLowSurrogate(expression.charAt(i)))return "表达式含不完整字符";}
            else if(Character.isLowSurrogate(ch))return "表达式含不完整字符";
        }
        try{evaluate(expression,Map.of(),true,new Budget());return "";}
        catch(RuntimeException invalid){return "请检查变量、括号、引号和正则表达式";}
    }
    /** An invalid/empty/over-budget result keeps the exact original field. */
    public static String render(String expression,Map<String,String> variables,String fallback){
        if(expression==null||expression.isEmpty())return fallback;
        try{
            if(!error(expression).isEmpty())return fallback;
            Map<String,String> values=new HashMap<>(variables);values.put("default",fallback);
            String result=evaluate(expression,values,false,new Budget());
            return result.isBlank()?fallback:result;
        }catch(RuntimeException|StackOverflowError invalid){return fallback;}
    }
    private static String evaluate(String expression,Map<String,String> values,boolean validate,Budget budget){
        StringBuilder result=new StringBuilder();int from=0;
        while(from<expression.length()){
            int start=expression.indexOf("${",from);
            if(start<0){append(result,expression.substring(from));break;}
            append(result,expression.substring(from,start));int end=tokenEnd(expression,start+2);
            append(result,token(expression.substring(start+2,end).trim(),values,validate,budget));from=end+1;
        }
        return result.toString();
    }
    private static int tokenEnd(String expression,int start){
        char quote=0;boolean escape=false;int depth=0;
        for(int i=start;i<expression.length();i++){
            char ch=expression.charAt(i);
            if(quote!=0){if(escape)escape=false;else if(ch=='\\')escape=true;else if(ch==quote)quote=0;continue;}
            if(ch=='\''||ch=='"'){quote=ch;continue;}
            if(ch=='(')depth++;else if(ch==')'){if(--depth<0)throw new Invalid();}
            else if(ch=='}'&&depth==0)return i;
        }throw new Invalid();
    }
    private static String token(String token,Map<String,String> values,boolean validate,Budget budget){
        if(VARIABLES.contains(token))return values.getOrDefault(token,"");
        int open=token.indexOf('(');if(open<1||!token.endsWith(")"))throw new Invalid();
        String fn=token.substring(0,open).trim();List<String> args=arguments(token.substring(open+1,token.length()-1));
        if(fn.equals("trim")&&args.size()==1)return argument(args.get(0),values,false).trim();
        if((!fn.equals("regex")&&!fn.equals("replace"))||args.size()<(fn.equals("replace")?3:2)||args.size()>3)throw new Invalid();
        String source=argument(args.get(0),values,false),pattern=argument(args.get(1),values,true);
        Pattern compiled=Pattern.compile(pattern);
        if(fn.equals("regex")){
            int group=args.size()==3?Integer.parseInt(args.get(2).trim()):0;
            if(group<0||group>compiled.matcher("").groupCount())throw new Invalid();
            if(validate)return "";
            Matcher match=compiled.matcher(new Input(source,budget));
            return match.find()?Objects.toString(match.group(group),""):"";
        }
        String replacement=argument(args.get(2),values,true);
        validateReplacement(replacement,compiled.matcher("").groupCount());
        if(validate)return "";
        Matcher match=compiled.matcher(new Input(source,budget));StringBuilder out=new StringBuilder();int cursor=0;
        // Matcher expands capture references, but bounded output prevents repeated empty matches
        // or large replacement text from allocating a result proportional to input*replacement.
        while(match.find()){
            budget.step();append(out,source.substring(cursor,match.start()));
            append(out,replacement(replacement,match));cursor=match.end();
        }
        append(out,source.substring(cursor));return out.toString();
    }
    private static String replacement(String value,Matcher match){
        StringBuilder result=new StringBuilder();
        for(int i=0;i<value.length();i++){
            char c=value.charAt(i);
            if(c=='\\'){if(++i==value.length())throw new Invalid();result.append(value.charAt(i));}
            else if(c=='$'){
                if(++i==value.length()||!Character.isDigit(value.charAt(i)))throw new Invalid();
                int group=value.charAt(i)-'0';
                while(i+1<value.length()&&Character.isDigit(value.charAt(i+1))){int next=group*10+value.charAt(i+1)-'0';if(next>match.groupCount())break;group=next;i++;}
                if(group>match.groupCount())throw new Invalid();result.append(Objects.toString(match.group(group),""));
            }else result.append(c);
        }return result.toString();
    }
    private static void validateReplacement(String value,int groups){
        for(int i=0;i<value.length();i++){
            char c=value.charAt(i);
            if(c=='\\'){if(++i==value.length())throw new Invalid();}
            else if(c=='$'){
                if(++i==value.length()||value.charAt(i)<'0'||value.charAt(i)>'9'||value.charAt(i)-'0'>groups)throw new Invalid();
                int group=value.charAt(i)-'0';
                while(i+1<value.length()&&value.charAt(i+1)>='0'&&value.charAt(i+1)<='9'){
                    int next=group*10+value.charAt(i+1)-'0';if(next>groups)break;group=next;i++;
                }
            }
        }
    }
    private static String argument(String raw,Map<String,String> values,boolean literal){
        raw=raw.trim();
        if(raw.length()>=2&&(raw.charAt(0)=='"'||raw.charAt(0)=='\'')&&raw.charAt(raw.length()-1)==raw.charAt(0)){
            String text=raw.substring(1,raw.length()-1);StringBuilder result=new StringBuilder();
            for(int i=0;i<text.length();i++){
                char ch=text.charAt(i);
                if(ch=='\\'&&i+1<text.length()&&(text.charAt(i+1)=='\\'||text.charAt(i+1)==raw.charAt(0)))ch=text.charAt(++i);
                result.append(ch);
            }return result.toString();
        }
        if(!literal&&VARIABLES.contains(raw))return values.getOrDefault(raw,"");
        throw new Invalid();
    }
    private static List<String> arguments(String text){
        List<String> result=new ArrayList<>();char quote=0;boolean escape=false;int from=0;
        for(int i=0;i<text.length();i++){
            char ch=text.charAt(i);
            if(quote!=0){if(escape)escape=false;else if(ch=='\\')escape=true;else if(ch==quote)quote=0;continue;}
            if(ch=='\''||ch=='"')quote=ch;
            else if(ch==','){result.add(text.substring(from,i).trim());from=i+1;}
            else if(ch=='('||ch==')')throw new Invalid();
        }
        if(quote!=0)throw new Invalid();result.add(text.substring(from).trim());return result;
    }
    private static void append(StringBuilder result,String text){if(result.length()+text.length()>MAX_RESULT)throw new Limit();result.append(text);}
}
