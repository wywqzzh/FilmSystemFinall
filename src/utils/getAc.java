package utils;

import org.apache.struts2.ServletActionContext;
import org.springframework.web.context.WebApplicationContext;

import javax.servlet.ServletContext;

public class getAc {
    public static WebApplicationContext getAC(){
        javax.servlet.http.HttpServletRequest request = ServletActionContext.getRequest();
        ServletContext application=request.getSession().getServletContext();
        WebApplicationContext ac=(WebApplicationContext)application.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
        return ac;
    }
}
