package cn.symphony.manager.mapper;

import cn.symphony.manager.pojo.SymUser;

import cn.symphony.manager.pojo.SymUserExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SymUserMapper {
    int countByExample(SymUserExample example);

    int deleteByExample(SymUserExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(SymUser record);

    int insertSelective(SymUser record);

    List<SymUser> selectByExample(SymUserExample example);

    SymUser selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") SymUser record, @Param("example") SymUserExample example);

    int updateByExample(@Param("record") SymUser record, @Param("example") SymUserExample example);

    int updateByPrimaryKeySelective(SymUser record);

    int updateByPrimaryKey(SymUser record);
}