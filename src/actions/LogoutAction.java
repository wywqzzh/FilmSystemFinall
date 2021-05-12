package actions;

import org.apache.struts2.ServletActionContext;

public class LogoutAction {
    public String execute(){
        javax.servlet.http.HttpServletRequest request = ServletActionContext.getRequest();
        request.getSession().removeAttribute("userName");
        return "success";
    }
}
