package pojo;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;
@Data
public class G_Record implements Serializable {
    private Integer id;
    private String flag;
    private Integer uid;
    private Integer gid;
    private Date time;
    private Integer num;
}