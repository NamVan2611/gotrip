package com.spring.gotrip.controller.client;

import java.time.LocalDate;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.spring.gotrip.model.Booking;
import com.spring.gotrip.model.Resort;
import com.spring.gotrip.model.Room;
import com.spring.gotrip.model.User;
import com.spring.gotrip.service.BookingService;
import com.spring.gotrip.service.ResortService;
import com.spring.gotrip.service.RoomService;
import com.spring.gotrip.service.UserService;

import java.security.Principal;

@Controller
public class RoomBookingController {

    private final RoomService roomService;
    private final ResortService resortService;
    private final BookingService bookingService;
    private final UserService userService;

    public RoomBookingController(RoomService roomService,
            ResortService resortService,
            BookingService bookingService,
            UserService userService) {
        this.roomService = roomService;
        this.resortService = resortService;
        this.bookingService = bookingService;
        this.userService = userService;
    }

    @GetMapping("/resort/{id}/{checkInDate}/{checkOutDate}")
    public String getResortPage(
            @PathVariable long id,
            @PathVariable @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate checkInDate,
            @PathVariable @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate checkOutDate,
            Model model) {

        Resort resort = this.resortService.getResortById(id);
        List<Room> roomList = this.roomService.getRoomsByResortId(id);

        model.addAttribute("resort", resort);
        model.addAttribute("roomList", roomList);
        model.addAttribute("checkInDate", checkInDate);
        model.addAttribute("checkOutDate", checkOutDate);
        model.addAttribute("id", id);

        return "client/resort/show";
    }

    @GetMapping("/booking/room/{id}")
    public String showBookingForm(
            @PathVariable("id") Long roomId,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate checkInDate,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate checkOutDate,
            Model model) {

        Room room = roomService.getRoomById(roomId);

        model.addAttribute("room", room);
        model.addAttribute("checkInDate", checkInDate);
        model.addAttribute("checkOutDate", checkOutDate);
        return "client/booking/create";
    }

    @PostMapping("/booking/room/{id}")
    public String createBooking(
            @PathVariable("id") Long roomId,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate checkInDate,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate checkOutDate,
            Principal principal) {

        User user = this.userService.getUserByEmail(principal.getName());
        Room room = this.roomService.getRoomById(roomId);
        System.out.println("Booking User: " + user);
        System.out.println("Booking Room: " + room);

        Booking booking = new Booking();
        booking.setUser(user);
        booking.setRoom(room);
        booking.setCheckInDate(checkInDate);
        booking.setCheckOutDate(checkOutDate);
        booking.setStatus("pending");
        long days = java.time.temporal.ChronoUnit.DAYS.between(checkInDate, checkOutDate);
        booking.setTotalPrice(room.getPrice() * Math.max(days, 1));

        bookingService.saveBooking(booking);

        return "redirect:/booking/success";
    }

    @GetMapping("/booking/success")
    public String bookingSuccess() {
        return "client/booking/success";
    }
}
