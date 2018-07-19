package tools;


import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;

/**
 * 日志增强
 */
public class AdviceLog {
    private static final Logger log=Logger.getLogger(AdviceLog.class);

    /**
     * 前置增强
     */
    public void before(JoinPoint joinpoint){
        log.info("~~~~~~~~~~~~~~~~~~~~调用"+joinpoint.getTarget().getClass()+"的"+joinpoint.getSignature().getName()+
                "方法开始~~~~~~~~~~~~~~~~~~~~");
    }
    /**
     * 后置增强
     */
    public void afterReturning(JoinPoint joinpoint){
        log.info("~~~~~~~~~~~~~~~~~~~~调用"+joinpoint.getTarget().getClass()+"的"+joinpoint.getSignature().getName()+
                "方法结束~~~~~~~~~~~~~~~~~~~~");
    }


}
