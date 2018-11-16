package com.aofei.joblog.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 *
 * </p>
 *
 * @author Tony
 * @since 2018-11-11
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("LOG_JOB")
public class LogJob extends Model<LogJobStep> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "JOB_ID", type = IdType.ID_WORKER)
    private Long jobId;
    /**
     * 对应r_job表中的ID_JOB主键
     */
    @TableField("JOB_CONFIG_ID")
    private Long jobConfigId;
    /**
     * 唯一，通UUID表示

     */
    @TableField("CHANNEL_ID")
    private String channelId;
    @TableField("JOB_NAME")
    private String jobName;
    @TableField("JOB_CN_NAME")
    private String jobCnName;
    @TableField("STATUS")
    private String status;
    @TableField("LINES_READ")
    private Long linesRead;
    @TableField("LINES_WRITTEN")
    private Long linesWritten;
    @TableField("LINES_UPDATED")
    private Long linesUpdated;
    @TableField("LINES_INPUT")
    private Long linesInput;
    @TableField("LINES_OUTPUT")
    private Long linesOutput;
    @TableField("LINES_REJECTED")
    private Long linesRejected;
    @TableField("ERRORS")
    private Long errors;
    @TableField("STARTDATE")
    private Date startdate;
    @TableField("ENDDATE")
    private Date enddate;
    @TableField("LOGDATE")
    private Date logdate;
    @TableField("DEPDATE")
    private Date depdate;
    @TableField("REPLAYDATE")
    private Date replaydate;
    @TableField("LOG_FIELD")
    private String logField;
    @TableField("EXECUTING_SERVER")
    private String executingServer;
    @TableField("EXECUTING_USER")
    private String executingUser;
    /**
     * 1:表示本地，2表示远程，3表示集群
     */
    @TableField("EXCUTOR_TYPE")
    private Integer excutorType;
    @TableField("JOB_LOG")
    private String jobLog;


    @Override
    protected Serializable pkVal() {
        return this.jobId;
    }

}
