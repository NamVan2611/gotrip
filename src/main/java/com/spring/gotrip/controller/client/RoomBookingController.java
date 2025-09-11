package com.spring.gotrip.controller.client;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.spring.gotrip.model.Resort;
import com.spring.gotrip.model.Room;
import com.spring.gotrip.service.ResortService;
import com.spring.gotrip.service.RoomService;

@Controller
public class RoomBookingController {
    
    private final RoomService roomService;
    private final ResortService resortService;

    public RoomBookingController(RoomService roomService, ResortService resortService) {
        this.roomService = roomService;
        this.resortService = resortService;
    }

    @GetMapping("/resort/{id}")
    public String getResortPage(Model model, @PathVariable long id){
        Resort resort = this.resortService.getResortById(id);
        List<Room> roomList = this.roomService.getRoomsByResortId(id);
        model.addAttribute("resort", resort);
        model.addAttribute("roomList", roomList);
        model.addAttribute("id", id);
        return "client/resort/show";
    }
}
