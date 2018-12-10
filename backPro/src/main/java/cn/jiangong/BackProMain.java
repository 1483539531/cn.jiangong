package cn.jiangong;

import cn.jiangong.intercept.LoginIntercept;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@MapperScan(basePackages = {"cn.jiangong.mapper"})
@SpringBootApplication
public class  BackProMain  implements WebMvcConfigurer {
/*extends SpringBootServletInitializer*/
   /*@Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(BackProMain.class);
    }*/
   public static void main(String[] args) {
       SpringApplication.run(BackProMain.class,args);
   }


    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new LoginIntercept()).addPathPatterns("/**");
    }
}
