package cn.jiangong.mapper;

import cn.jiangong.entity.Zhaobiao;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface ZhaobiaoMapper {

    List<Zhaobiao> selectZhaobiaoList(
            @Param("zhaobiao") Zhaobiao zhaobiao,@Param("startdate") String startdate,
            @Param("enddate") String enddate);


    @Select("select * from zhaobiao where id = #{id}")
    List<Zhaobiao> selectZhaobiaoListToId(String id);


    @Select("SELECT zhaobiao_number,city_address,c.`value` cityAddressValue FROM zhaobiao z JOIN categorys c ON z.`city_address`=c.`id`")
    List<Zhaobiao> selectNumber();


    @Update("update zhaobiao set zhuangtai = #{zhuangtai} where id = #{id}")
    boolean updateState(@Param("zhuangtai") Integer zhuangtai,@Param("id") String id);

}
