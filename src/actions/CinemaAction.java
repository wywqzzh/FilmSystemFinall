package actions;

import beans.Cinema;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.context.WebApplicationContext;
import service.ICinemaService;
import service.IUserService;

import javax.servlet.ServletContext;
import java.util.List;

public class CinemaAction extends ActionSupport implements ModelDriven<Cinema> {
    private Cinema cinema;

    public Cinema getCinema() {
        return cinema;
    }

    public void setCinema(Cinema cinema) {
        this.cinema = cinema;
    }

    public String showCinema(){
        javax.servlet.http.HttpServletRequest request = ServletActionContext.getRequest();
        String resource="applicationContext.xml";
        ApplicationContext ac=new ClassPathXmlApplicationContext(resource);
        ICinemaService service=(ICinemaService)ac.getBean("cinemaService");

        List<Cinema> cinemas=service.findAllCinema();
        for(Cinema cinema:cinemas){
            System.out.println("cinema:"+cinema);
        }
        request.getSession().setAttribute("cinemas",cinemas);
        return "success";
    }
    @Override
    public Cinema getModel() {
        if(cinema==null){
            cinema=new Cinema();
        }
        return cinema;
    }
}
