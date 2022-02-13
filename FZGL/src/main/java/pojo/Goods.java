package pojo;

import lombok.Data;

import java.io.Serializable;

@Data
public class Goods implements Serializable {
    private Integer id;
    private String name;
    private double price;
    private Integer repertory;
    private Integer type;
    private Integer g_delete;
}
