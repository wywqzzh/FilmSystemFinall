package actions;

import beans.User;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.context.WebApplicationContext;
import service.IUserService;
import org.springframework.web.context.support.WebApplicationContextUtils;
import javax.servlet.ServletContext;
import java.util.List;

public class LoginAction extends ActionSupport implements ModelDriven<User>{
    private User user;

    public User getUser() {
//        System.out.println("get");
        return user;
    }

    public void setUser(User user) {
//        System.out.println("set");
        this.user = user;
    }

    public String execute(){
//        System.out.println("user"+user);
//        String resource="applicationContext.xml";


        javax.servlet.http.HttpServletRequest request = ServletActionContext.getRequest();
        ServletContext application=request.getSession().getServletContext();
        WebApplicationContext ac=(WebApplicationContext)application.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
//        System.out.println(ac);
        IUserService service=(IUserService)ac.getBean("userService");

        String result=service.verifyUser(user);

        request.getSession().setAttribute("loginStatus",result);
        System.out.println("userType"+result);
        if("success".equals(result) ||"manager".equals(result) ||"root".equals(result)  ) {
            request.getSession().setAttribute("userName", user.getUserName());
            request.getSession().setAttribute("userType", result);
        }
        if("root".equals(result)){
            List<User> users=service.findUserByType(2);
            request.getSession().setAttribute("manageUsers",users);
        }else if("manager".equals(result)){
            List<User> users=service.findUserByType(1);
            request.getSession().setAttribute("manageUsers",users);
            for(User user:users){
                System.out.println(user);
            }
        }

        return result;
    }


    @Override
    public User getModel() {
        if(user==null){
            user=new User();
        }
        return user;
    }


}
