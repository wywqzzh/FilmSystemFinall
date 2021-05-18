package utils;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class TimeConvert {
    public static java.sql.Timestamp timeCovert(String time){

        time=time.replace('T',' ')+":00";
        java.sql.Timestamp ts = new java.sql.Timestamp(System.currentTimeMillis());
        String tsStr = time;
        try {
            ts = java.sql.Timestamp.valueOf(tsStr);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ts;
    }


    public static String TampToString(Timestamp time){

       String tsStr="";
        DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        try {
            //方法一
            tsStr = sdf.format(time);
        } catch (Exception e) {
            e.printStackTrace();
        }
        String mon=tsStr.substring(5,7);
        String day=tsStr.substring(8,10);
        int m=Integer.parseInt(mon);
        int d=Integer.parseInt(day);
        String s=m+"月"+d+"日";
        return s;
    }
}
