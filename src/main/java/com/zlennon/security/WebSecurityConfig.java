package com.zlennon.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.encoding.MessageDigestPasswordEncoder;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.access.expression.DefaultWebSecurityExpressionHandler;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;


/**
 * 注解方式配置 Spring Security，注意需要在 Spring 配置文件中扫描此类
 */
@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Override
    public void configure(WebSecurity web) throws Exception {
        // 设置不拦截规则
        web.ignoring().antMatchers("/login","/","/website/**","/common/**","/videos/**", "/error/**","/css/**","/plugins/**", "/help/**", "/images/**", "/js/**", "/res/**");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        // 自定义 accessDecisionManager 访问控制器,并开启表达式语言
        http.authorizeRequests()
                .expressionHandler(webSecurityExpressionHandler())          // 启用 SpEL 表达式
                .antMatchers("/*/website/*").permitAll()                   // 访问 /user/** 必须拥有角色 "0"，在使用标签时 <security:authorize access="hasRole('ROLE_0')">
                .antMatchers("/**").authenticated();    // 指定所有的请求都需登录
              //  .and().exceptionHandling().accessDeniedPage("/error/403")   // 指定登陆认证成功后，用户访问未授权的 URL 将跳转的 URL

        // 开启默认登录页面
        // http.formLogin();

        // 自定义登录页面
        http.formLogin().loginPage("/login")                        // 指定登录页面
                .loginProcessingUrl("/signin")                    // 执行登录操作的 URL
                .usernameParameter("username")                          // 用户请求登录提交的的用户名参数
                .passwordParameter("password")                          // 用户请求登录提交的密码参数
                .failureHandler(this.authenticationFailureHandler())    // 定义登录认证失败后执行的操作
                .successHandler(this.authenticationSuccessHandler());   // 定义登录认证曾工后执行的操作

        // 自定义注销
        http.logout().logoutUrl("/signout")                     // 执行注销操作的 URL
                .logoutSuccessUrl("/login")                             // 注销成功后跳转的页面
                .invalidateHttpSession(true)
                .deleteCookies("JSESSIONID");

        // session 管理
        http.sessionManagement().sessionFixation().none().maximumSessions(1);

        // 禁用 CSRF
        http.csrf().disable();
    }

    /**
     * 登录认证配置
     */
    @Override
    public void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(this.userDetailsService())
                .passwordEncoder(this.messageDigestPasswordEncoder());
    }

    /**
     * 使用自定义的登录密码加密规则，需继承  MessageDigestPasswordEncoder
     */
    @Bean(name = "myMessageDigestPasswordEncoder")
    public MessageDigestPasswordEncoder messageDigestPasswordEncoder() {
        return new MyMessageDigestPasswordEncoder("md5");
    }

    /**
     * 使用自定义的登录认证失败处理类，需继承 AuthenticationFailureHandler
     */
    @Bean(name = "authenticationFailureHandlerImpl")
    public AuthenticationFailureHandler authenticationFailureHandler() {
        return new AuthenticationFailureHandlerImpl();
    }

    /**
     * 使用自定义的登录认证成功处理类，需继承 AuthenticationSuccessHandler
     */
    @Bean(name = "authenticationSuccessHandlerImpl")
    public AuthenticationSuccessHandler authenticationSuccessHandler() {
        return new AuthenticationSuccessHandlerImpl();
    }

    @Bean(name = "userDetailsServiceImpl")
    public UserDetailsService userDetailsService() {
        return new UserDetailsServiceImpl();
    }

    // 表达式控制器
    @Bean(name = "expressionHandler")
    public DefaultWebSecurityExpressionHandler webSecurityExpressionHandler() {
        return new DefaultWebSecurityExpressionHandler();
    }

}