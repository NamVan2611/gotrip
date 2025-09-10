package com.spring.gotrip.controller.admin;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.spring.gotrip.model.Resort;
import com.spring.gotrip.model.Room;
import com.spring.gotrip.service.ResortService;
import com.spring.gotrip.service.RoomService;
import com.spring.gotrip.service.UploadService;

import jakarta.validation.Valid;

@Controller
public class RoomController {

    private final UploadService uploadService;
    private final RoomService roomService;
    private final ResortService resortService;

    public RoomController(UploadService uploadService, RoomService roomService, ResortService resortService) {
        this.uploadService = uploadService;
        this.roomService = roomService;
        this.resortService = resortService;
    }

    @GetMapping("admin/room")
    public String getRoomPage(Model model, @RequestParam(name = "page", defaultValue = "1") int page) {
        Pageable pageable = PageRequest.of(page - 1, 8);
        Page<Room> roomPage = this.roomService.getAllRoom(pageable);
        List<Room> roomList = roomPage.getContent();
        model.addAttribute("rooms", roomList);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", roomPage.getTotalPages());
        return "admin/room/show";
    }

    @GetMapping("/admin/room/create")
    public String getCReateRoomPage(Model model) {
        Room room = new Room();
        model.addAttribute("newRoom", room);
        List<Resort> resorts = this.resortService.getAllResortByList();
        model.addAttribute("resorts", resorts);
        return "admin/room/create";
    }

    @PostMapping("/admin/room/create")
    public String createRoomPage(Model model, @ModelAttribute("newRoom") @Valid Room room,
            BindingResult newRoomBindingResult, @RequestParam("file") MultipartFile file) {
        if (newRoomBindingResult.hasErrors()) {
            return "admin/room/create";
        }
        room.setImage(this.uploadService.handleSaveUploadFile(file, "room"));
        room.setResort(this.roomService.getResortById(room.getResort().getId()));
        this.roomService.handleSaveRoom(room);
        return "redirect:/admin/room";
    }

    @GetMapping("/admin/room/update/{id}")
    public String getUpdateRoomPage(Model model, @PathVariable long id) {
        Room room = this.roomService.getRoomById(id);
        model.addAttribute("newRoom", room);
        List<Resort> resorts = this.resortService.getAllResortByList();
        model.addAttribute("resorts", resorts);
        return "admin/room/update";
    }

    @PostMapping("/admin/room/update")
    public String updateRoomPage(Model model, @ModelAttribute("newRoom") @Valid Room room,
            BindingResult roomBindingResult, @RequestParam("file") MultipartFile multipartFile) {
        if (roomBindingResult.hasErrors()) {
            return "admin/room/update";
        }
        Room currentRoom = this.roomService.getRoomById(room.getId());
        currentRoom.setPrice(room.getPrice());
        currentRoom.setRoomNumber(room.getRoomNumber());
        currentRoom.setRoomType(room.getRoomType());
        currentRoom.setResort(this.resortService.getResortById(room.getResort().getId()));
        currentRoom.setStatus(room.getStatus());
        if (multipartFile != null && !multipartFile.isEmpty()) {
            currentRoom.setImage(this.uploadService.handleSaveUploadFile(multipartFile, "room"));
        }
        this.roomService.handleSaveRoom(currentRoom);

        return "redirect:/admin/room";
    }

    @GetMapping("/admin/room/delete/{id}")
    public String getDeleteRoomPage(Model model, @PathVariable Long id) {
        Room room = this.roomService.getRoomById(id);
        model.addAttribute("roomsToDelete", List.of(room));
        return "admin/room/delete";
    }

    @PostMapping("/admin/room/delete/confirm")
    public String getDeleteRoomsPage(Model model, @RequestParam("ids") List<Long> ids) {
        List<Room> rooms = roomService.getRoomsByIds(ids);
        model.addAttribute("roomsToDelete", rooms);
        return "admin/room/delete";
    }

    @PostMapping("/admin/room/delete")
    public String deleteRoomPage(@RequestParam(value = "ids", required = false) List<Long> ids,
            @RequestParam(value = "id", required = false) Long id) {
        if (id != null) {
            roomService.deleteRoomById(id);
        } else if (ids != null && !ids.isEmpty()) {
            roomService.deleteRooms(ids);
        }
        return "redirect:/admin/room";
    }
}
