package com.spring.gotrip.service;

import org.springframework.stereotype.Service;

import com.spring.gotrip.model.Booking;
import com.spring.gotrip.repository.BookingRepository;

@Service
public class BookingService {
    private final BookingRepository bookingRepository;

    public BookingService(BookingRepository bookingRepository) {
        this.bookingRepository = bookingRepository;
    }

    public Booking saveBooking(Booking booking) {
        return bookingRepository.save(booking);
    }
}
