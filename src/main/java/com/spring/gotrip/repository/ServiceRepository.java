package com.spring.gotrip.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.spring.gotrip.model.Service;

@Repository
public interface ServiceRepository extends JpaRepository<Service, Long> {


}
