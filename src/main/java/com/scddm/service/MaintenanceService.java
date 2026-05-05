package com.scddm.service;

import com.scddm.mapper.MaintenanceMapper;
import com.scddm.model.Maintenance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class MaintenanceService {

    @Autowired
    private MaintenanceMapper mapper;

    public void add(Maintenance m){
        m.setStatus("待维修");
        m.setStartTime(LocalDateTime.now());
        mapper.insert(m);
    }

    public List<Maintenance> listAll(){
        return mapper.listAll();
    }

    //查询未完成维修
    public List<Maintenance> listUnfinished(){
        return mapper.findUnfinished();
    }

    public  void deleteById(Integer id){ mapper.deleteById(id);}
}