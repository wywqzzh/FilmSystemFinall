package actions;

import beans.*;
import javafx.util.Pair;
import net.sf.ehcache.search.expression.Or;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.context.WebApplicationContext;
import service.*;
import utils.TimeConvert;

import javax.servlet.ServletContext;
import java.sql.Timestamp;
import java.util.*;

public class FilmAction {
    public String searchFilm(){

        javax.servlet.http.HttpServletRequest request = ServletActionContext.getRequest();
        String resource="applicationContext.xml";
        ApplicationContext ac=new ClassPathXmlApplicationContext(resource);
        IFilmService filmService= (IFilmService) ac.getBean("filmService");
        String keywords=request.getParameter("searchInput");
        List<Film> films=filmService.findFilmByKeywords(keywords);

        request.getSession().setAttribute("films",films);
        for(Film film:films){
            System.out.println(film);
        }
        return "success";
    }

    public String addReview(){
        javax.servlet.http.HttpServletRequest request = ServletActionContext.getRequest();
        String userName= (String) request.getSession().getAttribute("userName");
        if("".equals(userName)||userName==null){
            return "login";
        }
        String filmId= (String) request.getSession().getAttribute("filmId");
        request.setAttribute("film",filmId);
//        System.out.println("filmId:"+filmId);
        int index= (int) request.getSession().getAttribute("index");
        request.setAttribute("index",index);

        String rate=request.getParameter("rate");
        int Rate=0;
        if("很差".equals(rate)) Rate=2;
        else if("较差".equals(rate)) Rate=4;
        else if("还行".equals(rate)) Rate=6;
        else if("推荐".equals(rate)) Rate=8;
        else Rate=10;
        String reviewtext=request.getParameter("review");
        Review review=new Review();
        review.setFilmId(filmId);
        review.setUserName(userName);
        review.setFilmRating(Rate);
        review.setFilmReview(reviewtext);

        String resource="applicationContext.xml";
        ApplicationContext ac=new ClassPathXmlApplicationContext(resource);
        IReviewService service= (IReviewService) ac.getBean("reviewService");
        String result=service.addReview(review);
        request.getSession().setAttribute("addReviewState",result);
        return "success";
    }

    public String willFilm(){
        javax.servlet.http.HttpServletRequest request = ServletActionContext.getRequest();
        String resource="applicationContext.xml";
        ApplicationContext ac=new ClassPathXmlApplicationContext(resource);
        IFilmService filmService= (IFilmService) ac.getBean("filmService");
        IArrangeService arrangeService= (IArrangeService) ac.getBean("arrangeService");
        Timestamp timestamp=new Timestamp(System.currentTimeMillis());
        List<Filearrangementmessage> arranges=arrangeService.findArrangeWill(timestamp);
        List<String> filmIds=new ArrayList<String>();
        List<String> saleTimes=new ArrayList<String>();
        Map<String, Integer> map=new HashMap<String, Integer>();

        List<Film> films=new ArrayList<Film>();
        for(Filearrangementmessage arrange:arranges){
            if(map.get(arrange.getFilmId())==null){
                map.put(arrange.getFilmId(),1);
                filmIds.add(arrange.getFilmId());
                saleTimes.add(TimeConvert.TampToString(arrange.getArrangeSaleTime()));
            }
        }
        for(String filmId:filmIds){
            films.add(filmService.findFilmById(filmId));
        }
        request.getSession().setAttribute("films",films);
        request.getSession().setAttribute("saleTimes",saleTimes);

        return "success";
    }

    public String buyTicket(){
        javax.servlet.http.HttpServletRequest request = ServletActionContext.getRequest();
        String resource="applicationContext.xml";
        ApplicationContext ac=new ClassPathXmlApplicationContext(resource);
        IFilmService filmService= (IFilmService) ac.getBean("filmService");
        IArrangeService arrangeService= (IArrangeService) ac.getBean("arrangeService");
        ICinemaService cinemaService= (ICinemaService) ac.getBean("cinemaService");
        String filmId=request.getParameter("filmId");
        System.out.println("filmId:"+filmId);
        Film film=filmService.findFilmById(filmId);
        Timestamp timestamp=new Timestamp(System.currentTimeMillis());
        List<Filearrangementmessage> arranges=arrangeService.findArrangeByTimeFilmId(timestamp,filmId);
        List<Cinema> cinemas=new ArrayList<Cinema>();
        for(Filearrangementmessage arrange:arranges){
            cinemas.add(cinemaService.findCinemaById(arrange.getCinemaId()));
        }
        request.getSession().setAttribute("film",film);
        request.getSession().setAttribute("arranges",arranges);
        request.getSession().setAttribute("cinemas",cinemas);

        return "success";

    }

    public String choiseSeat(){

        javax.servlet.http.HttpServletRequest request = ServletActionContext.getRequest();
        String userName= (String) request.getSession().getAttribute("userName");
        if(userName==null||"".equals(userName)){
            return "login";
        }
        String arrangeId=request.getParameter("arrangeId");
        System.out.println("arrangeId:"+arrangeId);
        String resource="applicationContext.xml";
        ApplicationContext ac=new ClassPathXmlApplicationContext(resource);
        ISeatService seatService= (ISeatService) ac.getBean("seatService");
        IArrangeService arrangeService= (IArrangeService) ac.getBean("arrangeService");
        List<Seat> seats=seatService.findByArrangeId(arrangeId);
        Filearrangementmessage arrange=arrangeService.findArrangeById(arrangeId);
        IHallService hallService= (IHallService) ac.getBean("hallService");
        Hall hall=hallService.findHallByCinemaIdAndNum(arrange.getCinemaId(),arrange.getHallNum());
        Map<Pair<Integer,Integer>, Boolean> iSseat=new HashMap<Pair<Integer,Integer>, Boolean>();
        for(Seat seat:seats){
            iSseat.put(new Pair<Integer, Integer>(seat.getRow(),seat.getCol()),true);
        }
        System.out.println(iSseat);
        request.getSession().setAttribute("hall",hall);
        request.getSession().setAttribute("arrange",arrange);
        request.getSession().setAttribute("seats",seats);
        request.getSession().setAttribute("iSseat",iSseat);
        request.getSession().removeAttribute("choiceSeat");
        request.getSession().removeAttribute("order");
        request.getSession().removeAttribute("seatHave");
        return "success";

    }

    public String addSeat(){
//        javax.servlet.http.HttpServletRequest request = ServletActionContext.getRequest();
//        String resource="applicationContext.xml";
//        ApplicationContext ac=new ClassPathXmlApplicationContext(resource);
        javax.servlet.http.HttpServletRequest request = ServletActionContext.getRequest();
        ServletContext application=request.getSession().getServletContext();
        WebApplicationContext ac=(WebApplicationContext)application.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
        ISeatService seatService= (ISeatService) ac.getBean("seatService");
        IArrangeService arrangeService= (IArrangeService) ac.getBean("arrangeService");
        IOrderService orderService= (IOrderService) ac.getBean("orderService");
        IFilmService filmService= (IFilmService) ac.getBean("filmService");
        ICinemaService cinemaService= (ICinemaService) ac.getBean("cinemaService");
        int col=Integer.parseInt(request.getParameter("col"));
        int row=Integer.parseInt(request.getParameter("row"));
        double cost=Double.parseDouble(request.getParameter("cost"));
        Filearrangementmessage arrange= (Filearrangementmessage) request.getSession().getAttribute("arrange");

        String userName= (String) request.getSession().getAttribute("userName");
        Timestamp timestamp=new Timestamp(System.currentTimeMillis());

        String orderId= UUID.randomUUID().toString();
        Order order=new Order();
        order.setCost(cost);
        order.setArrangeId(arrange.getArrangeId());
        order.setOrderState(0);
        order.setUserName(userName);
        order.setOrderDate(timestamp);
        order.setOrderId(orderId);

        System.out.println(order);
        orderService.addOrder(order);

        Seat seat=new Seat();
        seat.setArrangeId(arrange.getArrangeId());
        seat.setCol(col);
        seat.setRow(row);
        Seat seat1=seatService.findSeat(seat);
        if(seat1!=null){
            request.getSession().setAttribute("seatHave","yes");
            return "exist";
        }
        seatService.addSeat(seat);
        Film film=filmService.findFilmById(arrange.getFilmId());
        Cinema cinema=cinemaService.findCinemaById(arrange.getCinemaId());
        request.getSession().setAttribute("cinema",cinema);
        request.getSession().setAttribute("film",film);
        request.getSession().setAttribute("choiceSeat",seat);
        request.getSession().setAttribute("order",order);
        return "success";
    }

    public String cancleOrder(){
        javax.servlet.http.HttpServletRequest request = ServletActionContext.getRequest();
        ServletContext application=request.getSession().getServletContext();
        WebApplicationContext ac=(WebApplicationContext)application.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
        ISeatService seatService= (ISeatService) ac.getBean("seatService");
        IOrderService orderService= (IOrderService) ac.getBean("orderService");

        Order order= (Order) request.getSession().getAttribute("order");
        Seat seat= (Seat) request.getSession().getAttribute("choiceSeat");

        seatService.removeSeat(seat);
        orderService.removeOrder(order);
        request.getSession().removeAttribute("choiceSeat");
        request.getSession().removeAttribute("order");
        request.getSession().removeAttribute("seatHave");
        return "success";
    }

    public String myOrder(){
        javax.servlet.http.HttpServletRequest request = ServletActionContext.getRequest();
        ServletContext application=request.getSession().getServletContext();
        WebApplicationContext ac=(WebApplicationContext)application.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
        ISeatService seatService= (ISeatService) ac.getBean("seatService");
        IArrangeService arrangeService= (IArrangeService) ac.getBean("arrangeService");
        IOrderService orderService= (IOrderService) ac.getBean("orderService");
        IFilmService filmService= (IFilmService) ac.getBean("filmService");
        ICinemaService cinemaService= (ICinemaService) ac.getBean("cinemaService");
        String userName= (String) request.getSession().getAttribute("userName");
        if(userName==null||"".equals(userName)){
            return "login";
        }
        List<Order> orders=orderService.findAllOrderByUserName(userName);
        List<Filearrangementmessage> arranges=new ArrayList<Filearrangementmessage>();
        for(Order order:orders){
            arranges.add(arrangeService.findArrangeById(order.getArrangeId()));
        }
        List<Cinema> cinemas=new ArrayList<Cinema>();
        List<Film> films=new ArrayList<Film>();
        for(Filearrangementmessage arrange:arranges){
            cinemas.add(cinemaService.findCinemaById(arrange.getCinemaId()));
            films.add(filmService.findFilmById(arrange.getFilmId()));
        }
        request.getSession().setAttribute("films",films);
        request.getSession().setAttribute("cinemas",cinemas);
        request.getSession().setAttribute("arranges",arranges);
        request.getSession().setAttribute("orders",orders);
        return "success";
    }

    public String collection(){
        javax.servlet.http.HttpServletRequest request = ServletActionContext.getRequest();
        ServletContext application=request.getSession().getServletContext();
        WebApplicationContext ac=(WebApplicationContext)application.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);

        String userName= (String) request.getSession().getAttribute("userName");
        if("".equals(userName)||userName==null){
            return "login";
        }
        Film film= (Film) request.getSession().getAttribute("film");

        Favorite favorite=new Favorite();
        favorite.setFilmId(film.getFilmId());
        favorite.setUserName(userName);

        IFavoriteService favoriteService= (IFavoriteService) ac.getBean("favoriteService");
        favoriteService.addFavorite(favorite);
        request.getSession().setAttribute("favorite",favorite);
        return "success";
    }

    public String cancleCollection(){
        javax.servlet.http.HttpServletRequest request = ServletActionContext.getRequest();
        ServletContext application=request.getSession().getServletContext();
        WebApplicationContext ac=(WebApplicationContext)application.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
        String userName= (String) request.getSession().getAttribute("userName");

        Film film= (Film) request.getSession().getAttribute("film");

        Favorite favorite=new Favorite();
        favorite.setFilmId(film.getFilmId());
        favorite.setUserName(userName);

        IFavoriteService favoriteService= (IFavoriteService) ac.getBean("favoriteService");

        favoriteService.removeFavorite(favorite);

        request.removeAttribute("favorite");
        return "success";
    }
}
