package service;

import beans.Cinema;
import beans.Filearrangementmessage;
import beans.Film;
import beans.User;
import dao.IFilearrangementmessageDao;
import dao.IFilmDao;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.junit.Test;
import org.omg.PortableInterceptor.SYSTEM_EXCEPTION;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import utils.Hbnutils;
import utils.TimeConvert;

import java.sql.Timestamp;
import java.util.List;

public class MyTest {
    @Test
    public void test(){
            String resource="applicationContext.xml";
            ApplicationContext ac=new ClassPathXmlApplicationContext(resource);
            IUserService service=(IUserService)ac.getBean("userService");
            User user=new User("zzh","1234");
            String result=service.verifyUser(user);
            System.out.println(result);
    }
    @Test
    public void testCinema(){
        String resource="applicationContext.xml";
        ApplicationContext ac=new ClassPathXmlApplicationContext(resource);
        ICinemaService service=(ICinemaService)ac.getBean("cinemaService");
        List<Cinema> cinemas=service.findAllCinema();
        for(Cinema cinema:cinemas){
            System.out.println(cinema);
        }
    }

    @Test
    public void Timetest(){
        String resource="applicationContext.xml";
        ApplicationContext ac=new ClassPathXmlApplicationContext(resource);
        IFilearrangementmessageDao service= (IFilearrangementmessageDao) ac.getBean("arrangeDao");
//        java.sql.Timestamp t=TimeConvert.timeCovert("sss");
//        Filearrangementmessage f=new Filearrangementmessage();
//        f.setFilmId("'b284559c-b3ce-11eb-8064-38f3ab9328a0'");
//        f.setCinemaId("156");
//        f.setHallNum(1);
//        f.setArrangeStartDatetime(t);
//        f.setArrangeEndDatetime(t);
//        f.setPrice(12.9);
//        f.setArrangeSaleTime(t);
//        f.setArrangeOnSale(100);
//        f.setArrangeSold(10);
//        service.insertA(f);
        String time1="2021-03-31T14:38";
        String time2="2021-03-31T15:38";



        java.sql.Timestamp t1=TimeConvert.timeCovert(time1);
        java.sql.Timestamp t2=TimeConvert.timeCovert(time2);

        List<Filearrangementmessage> filearrangementmessages=service.selectAByTime(t2);

        for(Filearrangementmessage filearrangementmessage:filearrangementmessages){
            System.out.println(filearrangementmessage);
        }
    }

    @Test
    public void  testLike(){
        String resource="applicationContext.xml";
        ApplicationContext ac=new ClassPathXmlApplicationContext(resource);
        IFilmDao service= (IFilmDao) ac.getBean("filmDao");
        List<Film> films=service.SselectFilmByName("肖");
        for(Film film:films){
            System.out.println(film);
        }

    }

}
