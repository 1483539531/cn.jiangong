package cn.jiangong.entity;

import lombok.Data;

@Data
public class ZhaoBiao {

  private int id;
  private String zhaobiaoNumber;
  private String zhaobiaoren;
  private String title;
  private int moneySource;
  private java.sql.Date kaibiaoDate;
  private java.sql.Date releaseDate;
  private String content;
  private String money;
  private String phone;
  private int zhaobiaoType;
  private int zhaobiaoHangye;
  private int shengAddress;
  private int cityAddress;


}
