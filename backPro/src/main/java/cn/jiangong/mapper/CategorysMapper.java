package cn.jiangong.mapper;

import cn.jiangong.entity.Categorys;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CategorysMapper {

    /**
     * 根据父级id查询出所属的所有分类信息
     * @param parentId
     * @return Categorys类型 List
     */
    public List<Categorys> parentIdSelectCategorysList(
            @Param("parentId") String parentId,@Param("type") String type);


    public boolean addCategory(
            @Param("name") String name,@Param("parentId") String parentId,@Param("type") String type);


    public boolean updateCategory(
            @Param("name") String name,@Param("id") String id);

}
