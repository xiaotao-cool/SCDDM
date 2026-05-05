package com.scddm.mapper;

import com.scddm.model.User;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface UserMapper {
    @Select("select * from db_scddm.sys_user")
    List<User> selectAll();

    @Select("select * from db_scddm.sys_user where username = #{username}")
    User selectByUsername(@Param("username") String username);

    @Insert("insert into db_scddm.sys_user(username, password, role, department) " +
            "values (#{username},#{password},#{role},#{department})")
    void insert(User user);

    @Update("update db_scddm.sys_user set role=#{role},department=#{department},enabled=#{enabled} where id=#{id}")
    void update(User user);

    @Delete("delete from db_scddm.sys_user where id=#{id}")
    void delete(Integer id);
}
