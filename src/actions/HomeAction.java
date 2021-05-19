package actions;

import beans.Favorite;
import beans.Film;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.context.WebApplicationContext;
import service.ICinemaService;
import service.IFavoriteService;
import service.IFilmService;
import utils.CollaborativeFilyering;

import javax.servlet.ServletContext;
import java.sql.Timestamp;
import java.util.List;

public class HomeAction {
    public String Home(){
        javax.servlet.http.HttpServletRequest request = ServletActionContext.getRequest();
        String resource="applicationContext.xml";
        ApplicationContext ac=new ClassPathXmlApplicationContext(resource);
        IFilmService filmService= (IFilmService) ac.getBean("filmService");
        Timestamp time=new Timestamp(System.currentTimeMillis());
        List<Film> films=filmService.findHotFilm(time);

        request.getSession().setAttribute("films",films);
        request.getSession().setAttribute("home","yes");

        String userName= (String) request.getSession().getAttribute("userName");
        if(userName!=null && !"".equals(userName)){
            List<Film> recommendFilms= CollaborativeFilyering.recommend(userName);
            request.getSession().setAttribute("Rfilms",recommendFilms);
        }
        return "success";
    }

    public String hotFilm(){
        javax.servlet.http.HttpServletRequest request = ServletActionContext.getRequest();
        String resource="applicationContext.xml";
        ApplicationContext ac=new ClassPathXmlApplicationContext(resource);
        IFilmService filmService= (IFilmService) ac.getBean("filmService");
        Timestamp time=new Timestamp(System.currentTimeMillis());
        List<Film> films=filmService.findHotFilm(time);

        request.getSession().setAttribute("films",films);

        return "success";
    }


    public String FilmToDetail(){
        javax.servlet.http.HttpServletRequest request = ServletActionContext.getRequest();
        ServletContext application=request.getSession().getServletContext();
        WebApplicationContext ac=(WebApplicationContext)application.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
        String filmId=request.getParameter("filmId");
        IFilmService filmService= (IFilmService) ac.getBean("filmService");
        Film film=filmService.findFilmById(filmId);
        System.out.println("filmId"+filmId);
        request.getSession().setAttribute("film",film);
        System.out.println(film);
        request.getSession().removeAttribute("favorite");

        String userName= (String) request.getSession().getAttribute("userName");
        if(userName==null||"".equals(userName)){
            return "success";
        }else {
            IFavoriteService favoriteService= (IFavoriteService) ac.getBean("favoriteService");
            Favorite favorite=new Favorite();
            favorite.setUserName(userName);
            favorite.setFilmId(filmId);
            Favorite favorite1=favoriteService.findFavorite(favorite);
            if(favorite1!=null)
                request.getSession().setAttribute("favorite",favorite);
        }
        return "success";
    }
}
