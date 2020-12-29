package cn.jjxy.exception;

public class MyException extends Exception {
    private String msg;

    public MyException() {
    }

    public MyException(String msg) {
        this.msg = msg;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
