package cn.jiangong.entity;
import lombok.Data;
import java.util.Date;

@Data
public class BackUser {

  private int id;
  private String zhanghao;
  private String password;
  private int state;
  private Date logindate;
  private String roleId;





}
