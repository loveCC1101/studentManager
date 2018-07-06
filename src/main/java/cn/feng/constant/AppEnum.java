package cn.feng.constant;


/**
 * Created by rf on 2018/6/15.
 */
public enum  AppEnum {
    OK(0,"操作成功"),
    PARAM_NOT_NULL(10,"参数不能为空"),
    USER_NOT_NULL(11,"用户名不能为空"),
    PASSWORD_NOT_NULL(12,"密码不能为空"),
    CLASS_NOT_NULL(13,"班级不能为空"),
    MAJOR_NOT_NULL(13,"专业不能为空"),
    P_KEY_NOT_NULL(13,"主键ID不能为空"),
    BAD_PARAM(20,"参数解析错误"),
    APP_EXCEPTION(30,"系统错误"),
    BUSINESS_Exception(40,"业务异常"),
    USER_NOT_EXIST(41,"用户名不能重复"),
    USER_ERROR(42,"用户名错误"),
    USER_PASS_ERROR(43,"用户名错误或者密码错误"),
    USER_REPEAT(44,"用户名不能重复");
    private int errorCode;
    private String msg;

    public int getErrorCode() {
        return errorCode;
    }

    public void setErrorCode(int errorCode) {
        this.errorCode = errorCode;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    AppEnum(int errorCode, String msg) {
        this.errorCode = errorCode;
        this.msg = msg;
    }

}
