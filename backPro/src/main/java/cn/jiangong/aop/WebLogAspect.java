package cn.jiangong.aop;


import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;
import java.util.Enumeration;

@Aspect
@Component
public class WebLogAspect {
    private  static final Logger logger = LoggerFactory.getLogger(WebLogAspect.class);

        @Around("execution(* cn.jiangong.controller.*.*(..))")
        public Object aroundLogger(ProceedingJoinPoint jp){
            //接收到请求，记录请求内容到nosql缓存   最多 半年数据迁移云备份
            ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
            HttpServletRequest request = (HttpServletRequest) attributes.getRequest();
            //记录请求内容
            logger.info("URL :"+request.getRequestURI().toString());
            logger.info("HTTP_METHOD: "+request.getMethod());
            logger.info("IP :"+request.getRemoteAddr());             //请求的ip

            //随便输出点信息相当于前置增强(就是在目标方法之前输出)
            logger.info("调用"+jp.getTarget().getClass().getName()+"的"+jp.getSignature().getName()
            +"方法，方法入参"+ Arrays.toString(jp.getArgs()));
            try {
                Object result = jp.proceed();
                //随便输出点信息，相当于后置增强  出现异常就不会执行额
                logger.error("调用"+jp.getTarget().getClass().getName()+"的"+jp.getSignature().getName()
                +"方法，方法返回值:"+result);
                return result;
            } catch (Throwable e) {
                //异常增强
                logger.error(jp.getSignature().getName()+"方法发生异常");
                e.printStackTrace();
            }finally {
                //最终增强
                logger.info(jp.getSignature().getName()+"方法结束");
            }
            return null;
        }

}
