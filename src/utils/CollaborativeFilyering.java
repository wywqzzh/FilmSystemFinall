package utils;

import org.apache.struts2.ServletActionContext;
import org.springframework.web.context.WebApplicationContext;

import javax.servlet.ServletContext;
import java.util.ArrayList;
import java.util.List;

public class CollaborativeFilyering {
    public List<String> recommend(String userName){
        String [] type={"剧情","喜剧","动作","爱情","科幻","动画","悬疑","惊悚","恐怖","犯罪","同性","音乐","歌舞","传记","历史","战争","西部","奇幻","冒险","灾难","武侠","情色","纪录片"};
        javax.servlet.http.HttpServletRequest request = ServletActionContext.getRequest();
        ServletContext application=request.getSession().getServletContext();
        WebApplicationContext ac=(WebApplicationContext)application.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);

       return null;
    }
}
