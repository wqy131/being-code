package com.being.conf;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;

import java.io.IOException;
import java.security.SignatureException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.filter.GenericFilterBean;

import com.being.constant.Constant;

/**
 * Check the jwt token from front end if is invalid
 * @program: users
 * @author: 李泰郎:https://blog.csdn.net/ltl112358/article/details/79507148
 * {@link}other:https://blog.csdn.net/wqh8522/article/details/78953379
 * spring boot-使用Filter实现Header认证： https://blog.csdn.net/liuchuanhong1/article/details/72638123
 *  https://blog.csdn.net/haiyan_qi/article/details/77373900
 * HttpPost post = new HttpPost("http://localhost:8990/sendMail");
				StringEntity entity = new StringEntity(json, "utf-8");
				entity.setContentType("application/json");
				post.setEntity(entity);
				// 设置验证头信息
				post.addHeader("token", "WEFGYHJIKLTY4RE6DF29HNBCFD13ER87");


 * 前端：https://blog.csdn.net/why15732625998/article/details/79348718
 * @create: 2018-03-01 11:03
 **/
public class JwtFilter extends GenericFilterBean {

    public void doFilter(final ServletRequest req, final ServletResponse res, final FilterChain chain)
            throws IOException, ServletException {

        // Change the req and res to HttpServletRequest and HttpServletResponse
        final HttpServletRequest request = (HttpServletRequest) req;
        final HttpServletResponse response = (HttpServletResponse) res;

        // Get authorization from Http request
        final String authHeader = request.getHeader("Authorization");

        // If the Http request is OPTIONS then just return the status code 200
        // which is HttpServletResponse.SC_OK in this code
        if ("OPTIONS".equals(request.getMethod())) {
            response.setStatus(HttpServletResponse.SC_OK);

            chain.doFilter(req, res);
        }
        // Except OPTIONS, other request should be checked by JWT
        else {

            // Check the authorization, check if the token is started by "Bearer "
            if (authHeader == null || !authHeader.startsWith("Bearer ")) {
                throw new ServletException("Missing or invalid Authorization header");
            }

            // Then get the JWT token from authorization
            final String token = authHeader.substring(7);
            
            // Use JWT parser to check if the signature is valid with the Key "secretkey"
			final Claims claims = Jwts.parser().setSigningKey(Constant.JWT_SECRETKEY).parseClaimsJws(token).getBody();

			
		
		
			// Add the claim to request header
			request.setAttribute("claims", claims);

            chain.doFilter(req, res);
        }
    }
}