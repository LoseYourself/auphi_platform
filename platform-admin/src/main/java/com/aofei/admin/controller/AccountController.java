package com.aofei.admin.controller;

import com.alibaba.fastjson.JSONObject;
import com.aofei.admin.authorization.Token;
import com.aofei.admin.authorization.jwt.JwtConfig;
import com.aofei.admin.authorization.jwt.JwtTokenBuilder;
import com.aofei.base.common.UserUtil;
import com.aofei.base.controller.BaseController;
import com.aofei.base.exception.ApplicationException;
import com.aofei.base.model.response.CurrentUserResponse;
import com.aofei.base.model.response.Response;
import com.aofei.sys.exception.SystemError;
import com.aofei.sys.model.request.UserRequest;
import com.aofei.sys.model.response.UserResponse;
import com.aofei.sys.service.IUserService;
import com.aofei.utils.BeanCopier;
import com.aofei.utils.StringUtils;
import io.swagger.annotations.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import springfox.documentation.annotations.ApiIgnore;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @auther Tony
 * @create 2018-09-15 15:45
 */
@Api(tags = { "系统管理-登录认证模块接口" })
@RestController
@RequestMapping(value = "/auth", produces = {"application/json;charset=UTF-8"})
public class AccountController extends BaseController {

    private static Logger logger = LoggerFactory.getLogger(AccountController.class);

    @Autowired
    private IUserService userService;

    @Autowired
    private JwtConfig jwtConfig;

    @Autowired
    private JwtTokenBuilder jwtTokenBuilder;


    /**
     * 登录
     *
     * @return
     */
    @ApiOperation(value = "用户登录", notes = "用户登录返回Token,后期访问接口在head中添加Authorization={Token}", httpMethod = "POST")
    @ApiResponses(value = {
            @ApiResponse(code = 200001, message = "invalid username or password"),
            @ApiResponse(code = 200002, message = "captcha error"),
            @ApiResponse(code = 200, message = "success")})
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public Response<Token> login(
            @ApiParam(value = "用户名", required = true)  @RequestParam(value = "username") String username,
            @ApiParam(value = "密码",   required = true)  @RequestParam(value = "password") String password,
            @ApiParam(value = "验证码", required = true)  @RequestParam(value = "captcha") String captcha) throws Exception {

        //验证码校验
        UserResponse user = null;
        try {
            //用户名密码验证
            user = userService.auth(username, password);
        }catch (ApplicationException e){
            throw new ApplicationException(SystemError.LOGIN_FAILED.getCode(), SystemError.LOGIN_FAILED.getMessage());
        }

        if(user != null) {
            UserUtil.setSessionUser(BeanCopier.copy(user, CurrentUserResponse.class));
            String host = StringUtils.getRemoteAddr();
            UserRequest userRequest = new UserRequest(user.getUserId());
            userRequest.setLoginIp(host);
            userRequest.setLoginTime(new Date());
            userService.updateLogin(userRequest);

            Map map = new HashMap();
            map.put("username", user.getUsername());
            String subject = JwtTokenBuilder.buildSubject(map);

            String accessToken = jwtTokenBuilder.buildToken(subject, jwtConfig.getExpiresSecond(), jwtConfig.getBase64Secret());
            //String refreshToken = jwtTokenBuilder.buildToken(subject, jwtConfig.getRefreshExpiresSecond(), jwtConfig.getRefreshBase64Secret());
            Token token = new Token();
            token.setAccess_token(accessToken);
            //token.setRefresh_token(refreshToken);
            token.setToken_type("bearer");
            token.setExpires_in(jwtConfig.getExpiresSecond());

            //存储到redis
            //tokenManager.createRelationship(user.getUsername(), accessToken);

            return Response.ok(token);
        } else {
            throw new ApplicationException(SystemError.LOGIN_FAILED.getCode(), SystemError.LOGIN_FAILED.getMessage());
        }
    }


    /**
     * 登录
     *
     * @return
     */
    @ApiIgnore
    @RequestMapping(value = "/client/login", method = RequestMethod.POST)
    @ResponseBody
    public Response<JSONObject> login(
           @RequestParam(value = "username") String username,
           @RequestParam(value = "password") String password) throws Exception {

        //验证码校验
        UserResponse user = null;
        try {
            //用户名密码验证
            user = userService.auth(username, password);
        }catch (ApplicationException e){
            throw new ApplicationException(SystemError.LOGIN_FAILED.getCode(), SystemError.LOGIN_FAILED.getMessage());
        }

        if(user != null) {
            UserUtil.setSessionUser(BeanCopier.copy(user, CurrentUserResponse.class));
            String host = StringUtils.getRemoteAddr();
            UserRequest userRequest = new UserRequest(user.getUserId());
            userRequest.setLoginIp(host);
            userRequest.setLoginTime(new Date());
            userService.updateLogin(userRequest);

            JSONObject object = new JSONObject();
            object.put("user",user);



            return Response.ok(object);




        } else {
            throw new ApplicationException(SystemError.LOGIN_FAILED.getCode(), SystemError.LOGIN_FAILED.getMessage());
        }
    }



}
