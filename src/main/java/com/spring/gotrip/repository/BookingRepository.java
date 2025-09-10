package com.spring.gotrip.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.spring.gotrip.model.Booking;

@Repository
public interface BookingRepository extends JpaRepository<Booking, Long> {

}
