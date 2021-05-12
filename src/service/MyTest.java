package service;

import beans.Cinema;
import beans.User;
import org.hibernate.Session;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import utils.Hbnutils;

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

}
