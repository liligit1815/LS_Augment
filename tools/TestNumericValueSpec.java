package ls.augment.com;

public final class TestNumericValueSpec {
    private static int checks;
    private static void check(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
    public static void main(String[] args){
        NumericValueSpec signed=new NumericValueSpec(-.2,1,.01,"");
        for(String value:new String[]{"-0.20","-.12","0",".99","1.00"})check(signed.normalize(value)!=null,"Valid signed decimal: "+value);
        for(String value:new String[]{""," ","NaN","Infinity","1e0","-0.21","1.01","0.001","1,00","--1"})check(signed.normalize(value)==null,"Reject invalid decimal: "+value);
        NumericValueSpec step=new NumericValueSpec(100,300,5,"%");
        check(step.normalize("105.00").equals("105"),"Canonical decimal input");
        check(step.normalize("107")==null,"Special step preserved");
        for(int i=0;i<=40;i++){
            String value=NumericValueSpec.valueAt(i,100,5);
            check(step.normalize(value)!=null,"Mapped value is valid");
            check(NumericValueSpec.progressOf(value,100,5)==i,"Exact stepped round trip");
        }
        for(int i=-20;i<=100;i++){
            String value=NumericValueSpec.valueAt(i,0,.01);
            check(signed.normalize(value)!=null,"Decimal progress does not drift");
            check(NumericValueSpec.progressOf(value,0,.01)==i,"Signed round trip");
        }
        NumericValueSpec count=new NumericValueSpec(1,1000000,1,"");
        check(count.normalize("1000000").equals("1000000"),"Large count remains exact");
        check(count.normalize("1.5")==null&&count.normalize("0")==null,"Integer constraints preserved");
        boolean threw=false;try{NumericValueSpec.progressOf("107",100,5);}catch(ArithmeticException expected){threw=true;}
        check(threw,"Conversion cannot silently truncate an invalid step");
        System.out.println("Numeric range, input and mapping: "+checks+" checks PASS");
    }
}
