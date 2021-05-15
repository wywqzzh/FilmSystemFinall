package actions;

import beans.Cinema;
import beans.Hall;
import beans.User;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.context.WebApplicationContext;
import service.ICinemaService;
import service.IHallService;
import service.IUserService;

import javax.servlet.ServletContext;
import java.util.ArrayList;
import java.util.List;

public class ManageAction {
    private String operateUserName;
    private String operator;
    private String cinemaName;
    private String cinemaAddress;
    private String cinemaphone;
    private String cinemaId;


    private int hallRow;
    private int hallCol;
    private int hallNum;

    public int getHallRow() {
        return hallRow;
    }

    public void setHallRow(int hallRow) {
        this.hallRow = hallRow;
    }

    public int getHallCol() {
        return hallCol;
    }

    public void setHallCol(int hallCol) {
        this.hallCol = hallCol;
    }

    public int getHallNum() {
        return hallNum;
    }

    public void setHallNum(int hallNum) {
        this.hallNum = hallNum;
    }

    public String getCinemaId() {
        return cinemaId;
    }

    public void setCinemaId(String cinemaId) {
        this.cinemaId = cinemaId;
    }

    public String getOperateUserName() {
        return operateUserName;
    }

    public void setOperateUserName(String operateUserName) {
        this.operateUserName = operateUserName;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    public String getCinemaName() {
        return cinemaName;
    }

    public void setCinemaName(String cinemaName) {
        this.cinemaName = cinemaName;
    }

    public String getCinemaAddress() {
        return cinemaAddress;
    }

    public void setCinemaAddress(String cinemaAddress) {
        this.cinemaAddress = cinemaAddress;
    }

    public String getCinemaphone() {
        return cinemaphone;
    }

    public void setCinemaphone(String cinemaphone) {
        this.cinemaphone = cinemaphone;
    }

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
//        System.out.println(operateUserName);
//        System.out.println(operator);

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


    public String searchUser(){
        javax.servlet.http.HttpServletRequest request = ServletActionContext.getRequest();
        ServletContext application=request.getSession().getServletContext();
        WebApplicationContext ac=(WebApplicationContext)application.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
//        System.out.println(ac);
        IUserService service=(IUserService)ac.getBean("userService");

        String name=request.getParameter("input");
        System.out.println(name);
        User user=service.findUserByName(name);
        List<User> users = new ArrayList<User>();
        users.add(user);
        request.getSession().setAttribute("manageUsers",users);

        if(user!=null) return "success";
        else return "input";

    }
    public String mamageAllCinema(){
        javax.servlet.http.HttpServletRequest request = ServletActionContext.getRequest();
        String resource="applicationContext.xml";
        ApplicationContext ac=new ClassPathXmlApplicationContext(resource);
        ICinemaService service=(ICinemaService)ac.getBean("cinemaService");

        List<Cinema> cinemas=service.findAllCinema();

        request.getSession().setAttribute("manageCinemas",cinemas);

        if(cinemas!=null) return "success";
        else return "input";
    }
    public String addCinema(){
        javax.servlet.http.HttpServletRequest request = ServletActionContext.getRequest();
        String resource="applicationContext.xml";
        ApplicationContext ac=new ClassPathXmlApplicationContext(resource);
        ICinemaService service=(ICinemaService)ac.getBean("cinemaService");
        Cinema cinema=new Cinema();
        cinema.setCinemaName(cinemaName);
        cinema.setCinemaAddress(cinemaAddress);
        cinema.setCinemaphone(cinemaphone);

        String result=service.addCinema(cinema);
        System.out.println(result);

        List<Cinema> cinemas=service.findAllCinema();
        request.getSession().setAttribute("manageCinemas",cinemas);
        request.getSession().setAttribute("addCinemaStatus",result);
        return result;
    }

    public String updateCinema(){
        javax.servlet.http.HttpServletRequest request = ServletActionContext.getRequest();
        String resource="applicationContext.xml";
        ApplicationContext ac=new ClassPathXmlApplicationContext(resource);
        ICinemaService service=(ICinemaService)ac.getBean("cinemaService");
        Cinema cinema=new Cinema();
        cinema.setCinemaName(cinemaName);
        cinema.setCinemaAddress(cinemaAddress);
        cinema.setCinemaphone(cinemaphone);

        String cinemaId=request.getParameter("cinemaId");
        cinema.setCinemaId(cinemaId);

        System.out.println(cinema);
        service.updateCinema(cinema);

        List<Cinema> cinemas=service.findAllCinema();
        request.getSession().setAttribute("manageCinemas",cinemas);
        return "success";
    }

    public String addHall(){
        javax.servlet.http.HttpServletRequest request = ServletActionContext.getRequest();
        ServletContext application=request.getSession().getServletContext();
        WebApplicationContext ac=(WebApplicationContext)application.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
        IHallService service=(IHallService)ac.getBean("hallService");

        Hall hall=new Hall();
        hall.setCinemaId(cinemaId);
        hall.setHallCol(hallCol);
        hall.setHallNum(hallNum);
        hall.setHallRow(hallRow);

        return service.addHall(hall);

    }
}
