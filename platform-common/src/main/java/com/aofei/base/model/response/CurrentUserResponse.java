package com.aofei.base.model.response;

import lombok.Data;

/**
 * @auther Tony
 * @create 2018-09-18 12:45
 */
@Data
public class CurrentUserResponse {

    private Long userId;
    /**
     * 用户名
     */
    private String username;
    /**
     * 密码
     */
    private String password;
    /**
     * 邮箱
     */
    private String email;
    /**
     * 手机号
     */
    private String mobile;

    /**
     * 组织ID
     */
    private Long organizerId;

    /**
     * 组织ID
     */
    private Long organizerName;
}
