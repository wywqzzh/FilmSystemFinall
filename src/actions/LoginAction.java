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

        if("success".equals(result)){
            request.getSession().setAttribute("userName",user.getUserName());
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
