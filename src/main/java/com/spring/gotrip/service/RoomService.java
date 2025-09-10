package com.spring.gotrip.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.spring.gotrip.model.Resort;
import com.spring.gotrip.model.Room;
import com.spring.gotrip.repository.ResortRepository;
import com.spring.gotrip.repository.RoomRepository;

@Service
public class RoomService {

    private final RoomRepository roomRepository;
    private final ResortRepository resortRepository;
    
    
    public RoomService(RoomRepository roomRepository, ResortRepository resortRepository) {
        this.roomRepository = roomRepository;
        this.resortRepository = resortRepository;
    }

    public Room handleSaveRoom(Room room){
        return this.roomRepository.save(room);
    }

    public Page<Room> getAllRoom(Pageable pageable){
        return this.roomRepository.findAll(pageable);
    }

    public Resort getResortById(long id){
        return resortRepository.findById(id);
    }
    public Room getRoomById(long id){
        return this.roomRepository.findById(id);
    }

    public void deleteRoomById(long id){
        this.roomRepository.deleteById(id);
    }

    public void deleteRooms(List<Long> ids){
        this.roomRepository.deleteAllById(ids);
    }
    
    public List<Room> getRoomsByIds(List<Long> ids){
        return this.roomRepository.findAllById(ids);
    }
}
