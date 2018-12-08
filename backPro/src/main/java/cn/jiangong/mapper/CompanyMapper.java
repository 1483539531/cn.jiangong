package cn.jiangong.mapper;

import cn.jiangong.entity.Company;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface CompanyMapper {

    @Update("update company set name = #{name},position = #{position} where userid=#{userid}")
    boolean updateCompany(Company company);

    @Select("insert into company (userid,name,position) values(#{userid},#{name},#{position})")
    Integer addCompany(Company company);

}
