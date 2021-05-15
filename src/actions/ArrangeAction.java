package actions;

import beans.Cinema;
import beans.Filearrangementmessage;
import beans.Film;
import beans.Hall;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import service.IArrangeService;
import service.ICinemaService;
import service.IFilmService;
import service.IHallService;
import utils.TimeConvert;

import java.util.List;

public class ArrangeAction {
    private String filmId;
    private String cinemaId;
    private int hallNum;
    private String arrangeSartTime;
    private String arrangeEndTime;
    private String arrangeSaleTime;
    private double price;

    public String getFilmId() {
        return filmId;
    }

    public void setFilmId(String filmId) {
        this.filmId = filmId;
    }

    public String getCinemaId() {
        return cinemaId;
    }

    public void setCinemaId(String cinemaId) {
        this.cinemaId = cinemaId;
    }

    public int getHallNum() {
        return hallNum;
    }

    public void setHallNum(int hallNum) {
        this.hallNum = hallNum;
    }

    public String getArrangeSartTime() {
        return arrangeSartTime;
    }

    public void setArrangeSartTime(String arrangeSartTime) {
        this.arrangeSartTime = arrangeSartTime;
    }

    public String getArrangeEndTime() {
        return arrangeEndTime;
    }

    public void setArrangeEndTime(String arrangeEndTime) {
        this.arrangeEndTime = arrangeEndTime;
    }

    public String getArrangeSaleTime() {
        return arrangeSaleTime;
    }

    public void setArrangeSaleTime(String arrangeSaleTime) {
        this.arrangeSaleTime = arrangeSaleTime;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getInitarrange(){
        javax.servlet.http.HttpServletRequest request = ServletActionContext.getRequest();
        String resource="applicationContext.xml";
        ApplicationContext ac=new ClassPathXmlApplicationContext(resource);
        ICinemaService cinemaservice=(ICinemaService)ac.getBean("cinemaService");
        IFilmService filmService= (IFilmService) ac.getBean("filmService");

        List<Film> films=filmService.findAllFilm();
        List<Cinema> cinemas=cinemaservice.findAllCinema();
        request.getSession().setAttribute("cinemas",cinemas);
        request.getSession().setAttribute("films",films);
        request.getSession().removeAttribute("isHall");
        request.getSession().removeAttribute("halls");
        return "success";
    }


    public String findHallByCinameId(){
        javax.servlet.http.HttpServletRequest request = ServletActionContext.getRequest();
        String resource="applicationContext.xml";
        ApplicationContext ac=new ClassPathXmlApplicationContext(resource);
        IHallService service=(IHallService)ac.getBean("hallService");

        String cinemaId=request.getParameter("cinemaId");
        String filmId=request.getParameter("filmId");
        request.getSession().setAttribute("cinemaId",cinemaId);
        request.getSession().setAttribute("filmId",filmId);



        List<Hall> halls=service.findAllHallByCinemaId(cinemaId);
        request.getSession().setAttribute("halls",halls);
        if(halls.size()!=0)
            request.getSession().setAttribute("isHall","yes");
        else
            request.getSession().setAttribute("isHall","no");
        if(halls==null) return "inputs";
        else return "success";
    }

    public String addArrange(){

        javax.servlet.http.HttpServletRequest request = ServletActionContext.getRequest();
        String resource="applicationContext.xml";
        ApplicationContext ac=new ClassPathXmlApplicationContext(resource);
        IArrangeService service=(IArrangeService)ac.getBean("arrangeService");
        Filearrangementmessage arrange=new Filearrangementmessage();
        arrange.setFilmId(filmId);
        arrange.setCinemaId(cinemaId);
        arrange.setHallNum(hallNum);
        arrange.setArrangeStartDatetime(TimeConvert.timeCovert(arrangeSartTime));
        arrange.setArrangeEndDatetime(TimeConvert.timeCovert(arrangeEndTime));
        arrange.setArrangeSaleTime(TimeConvert.timeCovert(arrangeSaleTime));
        arrange.setPrice(price);
        System.out.println(arrange);
        service.addArrange(arrange);

        return "success";
    }

}
