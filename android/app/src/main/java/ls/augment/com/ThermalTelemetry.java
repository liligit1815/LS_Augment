package ls.augment.com;

/** Read actual sensor temperatures; threshold/trip nodes are never measurements. */
public final class ThermalTelemetry {
    private ThermalTelemetry() { }
    public static double[] parse(String text) {
        double[] result={Double.NaN,Double.NaN};
        if(text==null)return result;
        for(String line:text.split("\n")){
            String[] parts=line.trim().split("\\|",-1);if(parts.length!=2)continue;
            String type=parts[0].toLowerCase(java.util.Locale.ROOT);
            if(type.contains("trip")||type.contains("limit")||type.contains("thresh"))continue;
            int index=type.contains("cpu")?0:type.contains("gpu")?1:-1;if(index<0)continue;
            try{
                double value=Double.parseDouble(parts[1]);if(Math.abs(value)>300)value/=1000;
                if(!Double.isFinite(value)||value<-20||value>150)continue;
                if(Double.isNaN(result[index])||value>result[index])result[index]=value;
            }catch(NumberFormatException ignored){ }
        }
        return result;
    }
}
