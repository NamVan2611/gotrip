package com.spring.gotrip.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.spring.gotrip.model.Resort;


@Repository
public interface ResortRepository extends JpaRepository<Resort, Long> {
    Resort findById(long id);
    void deleteById(long id);
}
