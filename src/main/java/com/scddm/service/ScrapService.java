package com.scddm.service;

import com.scddm.mapper.DeviceMapper;
import com.scddm.mapper.ScrapMapper;
import com.scddm.model.Scrap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class ScrapService {

    @Autowired
    private ScrapMapper mapper;

    @Autowired
    private DeviceMapper deviceMapper;

    public void apply(Integer deviceId,String reason){

        Scrap scrap =  new Scrap();
        scrap.setDeviceId(deviceId);
        scrap.setReason(reason);
        scrap.setApplyTime(LocalDateTime.now());
        scrap.setApproveStatus("审批中");

        mapper.insert(scrap);
    }

    public List<Scrap> listAll(){
        return mapper.listAll();
    }

    public void delete(Integer id){mapper.delete(id);}

    public void approve(Integer scrapId){
        Scrap scrap = mapper.selectById(scrapId);
        mapper.approve(scrapId);
        deviceMapper.updateStatus(scrap.getDeviceId(),"报废");
    }
}
