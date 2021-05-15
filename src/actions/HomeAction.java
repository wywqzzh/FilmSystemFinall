package actions;

import beans.Film;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import service.ICinemaService;
import service.IFilmService;

import java.util.List;

public class HomeAction {
    public String Home(){
        javax.servlet.http.HttpServletRequest request = ServletActionContext.getRequest();
        String resource="applicationContext.xml";
        ApplicationContext ac=new ClassPathXmlApplicationContext(resource);
        IFilmService filmService= (IFilmService) ac.getBean("filmService");
        List<Film> films=filmService.findWillFilm(4);

        request.getSession().setAttribute("willFilm",films);
        request.getSession().setAttribute("home","yes");
        for(Film film:films){
            System.out.println(film);
        }
        return "success";
    }
}
