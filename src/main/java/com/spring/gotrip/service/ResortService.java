package com.spring.gotrip.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.spring.gotrip.model.Resort;

import com.spring.gotrip.repository.ResortRepository;

@Service
public class ResortService {
    
    private final ResortRepository resortRepository;
    
    
    public ResortService(ResortRepository resortRepository) {
        this.resortRepository = resortRepository;
    }

    public Resort handleSaveResort(Resort resort){
        return this.resortRepository.save(resort);
    }

    public Page<Resort> getAllResort(Pageable pageable){
        return this.resortRepository.findAll(pageable);
    }
    public List<Resort> getAllResortByList(){
        return this.resortRepository.findAll();
    }

    public Resort getResortById(long id){
        return this.resortRepository.findById(id);
    }

    public void deleteResortById(long id){
        this.resortRepository.deleteById(id);
    }

    public void deleteResorts(List<Long> ids){
        this.resortRepository.deleteAllById(ids);
    }
    
    public List<Resort> getResortsByIds(List<Long> ids){
        return this.resortRepository.findAllById(ids);
    }

}
