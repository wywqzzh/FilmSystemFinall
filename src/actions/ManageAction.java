package actions;

import beans.User;
import org.apache.struts2.ServletActionContext;
import org.springframework.web.context.WebApplicationContext;
import service.IUserService;

import javax.servlet.ServletContext;
import java.util.List;

public class ManageAction {
    private String operateUserName;
    private String operator;
    public String userManageAllUser(){
        javax.servlet.http.HttpServletRequest request = ServletActionContext.getRequest();
        ServletContext application=request.getSession().getServletContext();
        WebApplicationContext ac=(WebApplicationContext)application.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
//        System.out.println(ac);
        IUserService service=(IUserService)ac.getBean("userService");

        String status= (String) request.getSession().getAttribute("userType");
        int type=0;
        if("root".equals(status)) type=2;
        else if("manager".equals(status)) type=1;

        List<User> users=service.findUserByType(type);

        request.getSession().setAttribute("manageUsers",users);

        return "success";
    }
    public String updateUser(){
        javax.servlet.http.HttpServletRequest request = ServletActionContext.getRequest();
        ServletContext application=request.getSession().getServletContext();
        WebApplicationContext ac=(WebApplicationContext)application.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
        IUserService service=(IUserService)ac.getBean("userService");
        operateUserName=request.getParameter("operateUserName");
        operator=request.getParameter("operator");
        System.out.println(operateUserName);
        System.out.println(operator);

        String status= (String) request.getSession().getAttribute("userType");
        int type=0;
        if("root".equals(status)) type=2;
        else if("manager".equals(status)) type=1;
        List<User> users;
        if("冻结".equals(operator)){
            users=service.updateUserForState(operateUserName,1,type);
        }else if( "解冻".equals(operator)){
            users=service.updateUserForState(operateUserName,0,type);
        }else if("设为管理员".equals(operator)){
            users=service.updateUserForType(operateUserName,1,type);
        }else if("取消管理员".equals(operator)){
            users=service.updateUserForType(operateUserName,0,type);
        }else users=null;
        request.getSession().setAttribute("manageUsers",users);
        if(users!=null) return "success";
        else return "fail";
    }
}
