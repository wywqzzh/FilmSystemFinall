package utils;

public class TimeConvert {
    public static java.sql.Timestamp timeCovert(String time){

        time=time.replace('T',' ')+":00";
        System.out.println(time);
        java.sql.Timestamp ts = new java.sql.Timestamp(System.currentTimeMillis());
        String tsStr = time;
        try {
            ts = java.sql.Timestamp.valueOf(tsStr);
            System.out.println(ts);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ts;
    }
}
