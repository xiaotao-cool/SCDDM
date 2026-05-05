package com.scddm.service;

import com.scddm.mapper.InventoryMapper;
import com.scddm.model.InventoryCheck;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class InventoryService {

    @Autowired
    private InventoryMapper mapper;

    public void check(InventoryCheck check){
        int diff = check.getActualQty()-check.getSystemQty();
        check.setDiffQty(diff);

        if (diff>0){
            check.setResult("盘盈");
        }else if (diff<0){
            check.setResult("盘亏");
        }else{
            check.setResult("正常");
        }

        check.setCheckTime(LocalDateTime.now());
        mapper.insert(check);
    }

    public List<InventoryCheck> list(){
        return mapper.selectAll();
    }

    public void delete(Integer id){mapper.delete(id);}
}
