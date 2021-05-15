package actions;

import org.apache.struts2.ServletActionContext;

public class TimeTest {
    private String dateTime;

    public String getDateTime() {
        return dateTime;
    }

    public void setDateTime(String dateTime) {
        this.dateTime = dateTime;
    }

    public String execute(){
        javax.servlet.http.HttpServletRequest request = ServletActionContext.getRequest();
        String time=request.getParameter("dateTime");
        System.out.println(dateTime);
        System.out.println(time);
//        java.sql.Timestamp timestamp=
        return "success";
    }
}
