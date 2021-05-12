package actions;

import beans.User;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.context.WebApplicationContext;
import service.IUserService;

import javax.servlet.ServletContext;

public class RegisterAction extends ActionSupport {
    private String UserName;
    private String UserPhone;
    private String UserPassword;
    private String reUserPassword;
    private int UserAge;
    private String UserArea;
    private String UserPreferences;
    private String UserSex;

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String userName) {
        UserName = userName;
    }

    public String getUserPhone() {
        return UserPhone;
    }

    public void setUserPhone(String userPhone) {
        UserPhone = userPhone;
    }

    public String getUserPassword() {
        return UserPassword;
    }

    public void setUserPassword(String userPassword) {
        UserPassword = userPassword;
    }

    public String getReUserPassword() {
        return reUserPassword;
    }

    public void setReUserPassword(String reUserPassword) {
        this.reUserPassword = reUserPassword;
    }

    public int getUserAge() {
        return UserAge;
    }

    public void setUserAge(int userAge) {
        UserAge = userAge;
    }

    public String getUserArea() {
        return UserArea;
    }

    public void setUserArea(String userArea) {
        UserArea = userArea;
    }

    public String getUserPreferences() {
        return UserPreferences;
    }

    public void setUserPreferences(String userPreferences) {
        UserPreferences = userPreferences;
    }

    public String getUserSex() {
        return UserSex;
    }

    public void setUserSex(String userSex) {
        UserSex = userSex;
    }

    public String execute(){
        javax.servlet.http.HttpServletRequest request = ServletActionContext.getRequest();
        ServletContext application=request.getSession().getServletContext();
        WebApplicationContext ac=(WebApplicationContext)application.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
        IUserService service=(IUserService)ac.getBean("userService");
        User user=new User();

        user.setUserName(UserName);
        user.setUserPhone(UserPhone);
        user.setUserPassword(UserPassword);
        user.setUserAge(UserAge);
        user.setUserArea(UserArea);
        user.setUserSex(UserSex);
        user.setUserPreferences(UserPreferences);
        String result=service.addUser(user);

        request.getSession().setAttribute("registerStatus",result);
        return result;
    }

}
