package com.spring.gotrip.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.spring.gotrip.model.Room;

@Repository
public interface RoomRepository extends JpaRepository<Room, Long> {
    Room findById(long id);
    void deleteById(long id);
}
