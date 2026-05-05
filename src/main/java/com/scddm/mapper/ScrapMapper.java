package com.scddm.mapper;

import com.scddm.model.Scrap;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface ScrapMapper {

    @Insert("""
        insert into db_scddm.device_scrap
        (deviceId, reason, applyTime, approveStatus, processInstanceId)
        values
        (#{deviceId}, #{reason}, #{applyTime}, #{approveStatus}, #{processInstanceId})
    """)
    void insert(Scrap scrap);

    @Select("""
        select id,
               deviceId,
               reason,
               applyTime ,
               approveTime ,
               approveStatus ,
               processInstanceId
        from db_scddm.device_scrap
        where id = #{id}
    """)
    Scrap selectById(Integer id);

    /** 查询所有报废申请（管理员列表） */
    @Select("""
        select id,
               deviceId ,
               reason,
               applyTime ,
               approveTime,
               approveStatus ,
               processInstanceId
        from db_scddm.device_scrap
        order by applyTime desc
    """)
    List<Scrap> listAll();

    /** 查询待审批的报废申请 */
    @Select("""
        select id,
               deviceId,
               reason,
               applyTime,
               approveStatus,
               processInstanceId
        from db_scddm.device_scrap
        where approveStatus = '审批中'
        order by applyTime desc
    """)
    List<Scrap> listPending();

    /** 审批通过 */
    @Update("""
        update db_scddm.device_scrap
        set approveStatus = '通过',
            approveTime = now()
        where id = #{id}
    """)
    void approve(Integer id);

    /** 审批拒绝（预留，答辩加分） */
    @Update("""
        update db_scddm.device_scrap
        set approveStatus = '拒绝',
            approveTime = now()
        where id = #{id}
    """)
    void reject(Integer id);

    @Delete("delete from db_scddm.device_scrap where id=#{id}")
    void delete(Integer id);
}
