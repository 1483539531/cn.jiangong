package cn.jiangong.entity;

import lombok.Data;

@Data
public class Categorys {

  private int id;
  private String value;
  private int parentId;
  private String leixing;
  private String parentname; //父级name  多表查询出来的


}
