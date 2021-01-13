package com.scu.coatsubsidy.common;

public class JsonResult <T>{
    private  Integer code;
    private  T data;

    public T getData() {
        return data;
    }

    public JsonResult<T> setData(T data) {
        this.data = data;
        return this;
    }

    public JsonResult(T data) {
        this.data = data;
    }


    public static JsonResult ok(Object data){
        return new JsonResult(200,data);
    }

    public static JsonResult error(Object data){
        return new JsonResult(500,data);
    }

    public JsonResult(Integer code, T data) {
        this.code = code;
        this.data = data;
    }

    public Integer getCode() {
        return code;
    }

    public JsonResult<T> setCode(Integer code) {
        this.code = code;
        return this;
    }

}
