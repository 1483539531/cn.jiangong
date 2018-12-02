package cn.jiangong.mapper;

import cn.jiangong.entity.Categorys;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CategorysMapper {


     List<Categorys> SelectCategorysList(
            @Param("parentId") String parentId,@Param("type") String type);


     boolean addCategory(
            @Param("name") String name,@Param("parentId") String parentId,@Param("type") String type);


     boolean updateCategory(
            @Param("name") String name,@Param("id") String id);

     boolean deleteCategory(String id);

}
