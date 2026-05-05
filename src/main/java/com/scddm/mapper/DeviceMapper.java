package com.scddm.mapper;

import com.scddm.model.Devices;
import org.apache.ibatis.annotations.*;

import  java.util.List;

@Mapper
public interface DeviceMapper {
    @Insert("INSERT INTO db_scddm.devices(name,model,specification,purchaseDate,supplier,status) " +
            "VALUES (#{name},#{model},#{specification},#{purchaseDate},#{supplier},#{status})")
    void insertDevice(Devices device);

    @Select("SELECT * FROM db_scddm.devices WHERE name LIKE CONCAT('%', #{name}, '%') AND model " +
            "LIKE CONCAT('%', #{model}, '%') AND status LIKE CONCAT('%', #{status}, '%')")
    List<Devices> queryDevices(String name, String model, String status);

    @Update("UPDATE db_scddm.devices SET name=#{name},model=#{model},specification=#{specification}," +
            "purchaseDate=#{purchaseDate},supplier=#{supplier},status=#{status} WHERE id=#{id}")
    void updateDevice(Devices device);

    @Delete("DELETE FROM db_scddm.devices WHERE id=#{id}")
    void deleteDevice(Integer id);

    @Select("SELECT * FROM db_scddm.devices WHERE id=#{id}")
    Devices getDeviceById(Integer id);

    @Select("select status from db_scddm.devices where id = #{id}")
    String getStatusById(Integer id);

    @Update("update db_scddm.devices set status = #{status} where id = #{id}")
    void updateStatus(@Param("id") Integer id,
                      @Param("status") String status);
}
