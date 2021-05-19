package utils;

import beans.Favorite;
import beans.Film;
import beans.Review;
import beans.User;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.context.WebApplicationContext;
import service.IFavoriteService;
import service.IFilmService;
import service.IReviewService;

import javax.servlet.ServletContext;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CollaborativeFilyering {
        public static int[] Arraysort(double[] arr, boolean desc) {
            double temp;
            int index;
            int k = arr.length;
            int[] Index = new int[k];
            for (int i = 0; i < k; i++) {
                Index[i] = i;
            }

            for (int i = 0; i < arr.length; i++) {
                for (int j = 0; j < arr.length - i - 1; j++) {
                    if (desc) {
                        if (arr[j] < arr[j + 1]) {
                            temp = arr[j];
                            arr[j] = arr[j + 1];
                            arr[j + 1] = temp;

                            index = Index[j];
                            Index[j] = Index[j + 1];
                            Index[j + 1] = index;
                        }
                    } else {
                        if (arr[j] > arr[j + 1]) {
                            temp = arr[j];
                            arr[j] = arr[j + 1];
                            arr[j + 1] = temp;

                            index = Index[j];
                            Index[j] = Index[j + 1];
                            Index[j + 1] = index;
                        }
                    }
                }
            }
            return Index;
        }
    public static int[] getFeature(String userName){
        String [] Types={"剧情","喜剧","动作","爱情","科幻","动画","悬疑","惊悚","恐怖","犯罪","同性","音乐","歌舞","传记","历史","战争","西部","奇幻","冒险","灾难","武侠","情色","纪录片"};
        int [] feature=new int[23];
        Map<String,Integer> map=new HashMap<String, Integer>();
        for(int i=0;i<Types.length;i++){
            map.put(Types[i],i);
            feature[i]=0;
        }
//        javax.servlet.http.HttpServletRequest request = ServletActionContext.getRequest();
//        ServletContext application=request.getSession().getServletContext();
//        WebApplicationContext ac=(WebApplicationContext)application.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
        String resource="applicationContext.xml";
        ApplicationContext ac=new ClassPathXmlApplicationContext(resource);
        IFavoriteService favoriteService= (IFavoriteService) ac.getBean("favoriteService");
        IFilmService filmService= (IFilmService) ac.getBean("filmService");
        IReviewService reviewService= (IReviewService) ac.getBean("reviewService");
        List<Favorite> favorites=favoriteService.findFavoriteByUserName(userName);
//        List<Review> reviews=reviewService.
        List<Film> films=new ArrayList<Film>();
        for(int i=0;i<favorites.size();i++){
            films.add(filmService.findFilmById(favorites.get(i).getFilmId()));
        }
        for(int i=0;i<films.size();i++){
            String types=films.get(i).getFilmType();
            for(String type:types.split(" ")){
                feature[map.get(type)]+=1;
            }
        }
        return feature;
    }

    public static double getCorrelation(int[] x, int[] y){
        double relation=0;
        for(int i=0;i<x.length;i++){
            relation+=(1.0*(x[i]-y[i])*(x[i]-y[i]));
        }
        relation=Math.sqrt(relation);
        return relation;
    }
    public static List<Film> recommend(String userName){
//        String [] type={"剧情","喜剧","动作","爱情","科幻","动画","悬疑","惊悚","恐怖","犯罪","同性","音乐","歌舞","传记","历史","战争","西部","奇幻","冒险","灾难","武侠","情色","纪录片"};
//        javax.servlet.http.HttpServletRequest request = ServletActionContext.getRequest();
//        ServletContext application=request.getSession().getServletContext();
//        WebApplicationContext ac=(WebApplicationContext)application.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
        String resource="applicationContext.xml";
        ApplicationContext ac=new ClassPathXmlApplicationContext(resource);
        IFavoriteService favoriteService= (IFavoriteService) ac.getBean("favoriteService");
        IFilmService filmService= (IFilmService) ac.getBean("filmService");
        IReviewService reviewService= (IReviewService) ac.getBean("reviewService");

        List<Film> films=filmService.findAllFilm();
        int[] feature=getFeature(userName);
        double[] scores=new double[films.size()];
        for(int i=0;i<films.size();i++)
        {
            double relation_sum=0;
            double sorce_sum=0;
            List<Review> reviews=reviewService.findReviewByFilmId(films.get(i).getFilmId());
            List<String> userNames=new ArrayList<String>();
            Map<String,Boolean> map=new HashMap<String,Boolean>();
            List<Double> rates=new ArrayList<Double>();

            for(int j=0;j<reviews.size();j++){
                if(map.get(reviews.get(j).getUserName())==null && !reviews.get(j).getUserName().equals(userName)){
                    userNames.add(reviews.get(j).getUserName());
                    rates.add((double) reviews.get(j).getFilmRating());
                }
            }
            for(int j=0;j<userNames.size();j++)
            {
                int[] feature1=getFeature(userNames.get(j));
                double relation=getCorrelation(feature,feature1);
                relation_sum+=relation;
                sorce_sum+=(relation*rates.get(j));
            }
            if(sorce_sum!=0)
                scores[i]=(sorce_sum/relation_sum);
            else
                scores[i]=0;
        }
        int[] index=Arraysort(scores,true);
        List<Film> films1=new ArrayList<Film>();
//        for(int i=0;i<scores.length;i++)
//        {
//            System.out.print(scores[i]+" ");
//        }
//        System.out.println();
//        for(int i=0;i<scores.length;i++)
//        {
//            System.out.print(index[i]+" ");
//        }
//        for(int i=0;i<scores.length;i++)
//        {
//            System.out.println(films.get(index[i]).getFilmName()+" "+films.get(i).getFilmType());
//        }
        for(int i=0;i<index.length;i++)
        {
            films1.add(films.get(index[i]));
        }
        return films1;
    }
}
