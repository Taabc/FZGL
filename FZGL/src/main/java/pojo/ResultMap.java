package pojo;

import lombok.Data;

import java.io.Serializable;
@Data
public class ResultMap implements Serializable {
    //    状态
    private boolean status;
//    信息
    private String message;

//    public boolean isStatus() {
//        return status;
//    }
//    public boolean getStatus(){
//        return status;
//    }
//    public void setStatus(boolean status) {
//        this.status = status;
//    }
//
//    public String getMessage() {
//        return message;
//    }
//
//    public void setMessage(String message) {
//        this.message = message;
//    }
}
