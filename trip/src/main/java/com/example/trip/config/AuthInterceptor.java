package com.example.trip.config;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.example.trip.CustomException;
import com.example.trip.entity.User;
import com.example.trip.mapper.UserMapper;
import com.example.trip.utils.TokenUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
public class AuthInterceptor implements HandlerInterceptor {

    @Resource
    private UserMapper userMapper;

    Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {


        String token = request.getHeader("token");
        logger.info("====== PreHandle Interceptor Request ======"+ request.getRequestURI());
        logger.info("====== PreHandle Interceptor to do authentication logic ======");
        if (token == null ) {
            response.setContentType("application/json");
            response.setStatus(HttpStatus.UNAUTHORIZED.value());
            logger.info("haven't received token, please re-login");
            return false;
            //throw new CustomException("401", "haven't received token, please re-login");
        }
        Integer userId = Integer.valueOf(JWT.decode(token).getAudience().get(0));
        User user = userMapper.selectById(userId);
        logger.info("====== PreHandle finding user ======"+ user);
        if (user == null) {
            response.setContentType("application/json");
            response.setStatus(HttpStatus.UNAUTHORIZED.value());
            logger.info("token is illegal");
            return false;
            //throw new CustomException("401", "token is illegal");
        }
        // validate token
        JWTVerifier jwtVerifier = JWT.require(Algorithm.HMAC256(user.getPassword())).build();
        try {
            jwtVerifier.verify(token);
        } catch (Exception e) {
            response.setContentType("application/json");
            response.setStatus(HttpStatus.UNAUTHORIZED.value());
            logger.info("======Verfiy Token Error: " + e);
            return false;
            // throw new CustomException("401", "token is illegal");
        }

        return true;


    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) {
        logger.info("====== PostHandle Interceptor ======");
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler,
                                Exception exception) {
        logger.info("====== AfterCompletion Interceptor ======");
    }
}

