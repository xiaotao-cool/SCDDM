package com.scddm.service;

import com.scddm.mapper.AllocationMapper;
import com.scddm.model.AllocationApply;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class AllocationService {

    private final AllocationMapper mapper;

    public AllocationService(AllocationMapper mapper) {
        this.mapper = mapper;
    }

    public void apply(AllocationApply apply){
        apply.setStatus("待审批");
        mapper.insertApply(apply);
    }

    public List<AllocationApply> list(){
        return mapper.findAll();
    }

    public void delete(Integer id){mapper.delete(id);}

    @Transactional
    public void approve(Integer id,boolean pass){
        mapper.updateStatus(id,pass ? "已通过" : "已拒绝");
    }
}
