package com.aofei.base.common;

import com.aofei.utils.PropertiesLoader;
import com.aofei.utils.StringUtils;
import com.google.common.collect.Maps;
import org.pentaho.di.repository.Repository;

import java.util.Map;

/**
 * 常量类
 * Created by Hao on 2017-03-24.
 */
public class Const {

    /**
     * 保存全局属性值
     */
    public static Repository repository ;

    /**
     * 保存全局属性值
     */
    public static Map<String, Repository> repositorys = Maps.newHashMap();

    /**
     * 保存全局属性值
     */
    private static Map<String, String> map = Maps.newHashMap();

    /**
     * 属性文件加载对象
     */
    private static PropertiesLoader loader = new PropertiesLoader("config/application.properties");

    /** session中存放的用户key*/
    public final static String SESSION_USER = "user";

    public final static String TOKEN_KEY = "token_key";

    public final static String REPOSITORY_USERNAME = "admin";

    public final static String REPOSITORY_PASSWORD = "admin";


    public static final  int YES = 1;

    public static final  int NO = 0;


    /**
     * 获取配置
     * @see ${fns:getConfig('adminPath')}
     */
    public static String getConfig(String key) {
        String value = map.get(key);
        if (value == null){
            value = loader.getProperty(key);
            map.put(key, value != null ? value : StringUtils.EMPTY);
        }
        return value;
    }



}
