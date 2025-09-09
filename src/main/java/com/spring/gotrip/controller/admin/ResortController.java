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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.spring.gotrip.model.Resort;
import com.spring.gotrip.service.ResortService;
import com.spring.gotrip.service.UploadService;

import jakarta.validation.Valid;

@Controller
public class ResortController {

    private final UploadService uploadService;
    private final ResortService resortService;

    public ResortController(UploadService uploadService, ResortService resortService) {
        this.uploadService = uploadService;
        this.resortService = resortService;
    }

    @GetMapping("admin/resort")
    public String getResortPage(Model model, @RequestParam(name = "page", defaultValue = "1") int page) {
        Pageable pageable = PageRequest.of(page - 1, 8);
        Page<Resort> resortPage = this.resortService.getAllResort(pageable);
        List<Resort> resortList = resortPage.getContent();
        model.addAttribute("resorts", resortList);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", resortPage.getTotalPages());
        return "admin/resort/show";
    }

    @RequestMapping("/admin/resort/{id}")
    public String getresortDetailPage(Model model, @PathVariable long id) {
        Resort resort = this.resortService.getResortById(id);
        model.addAttribute("resort", resort);
        model.addAttribute("id", id);
        return "admin/resort/detail";
    }

    @GetMapping("/admin/resort/create")
    public String getCreateResortPage(Model model) {
        Resort resort = new Resort();
        model.addAttribute("newResort", resort);
        return "admin/resort/create";
    }

    @PostMapping("/admin/resort/create")
    public String createResortPage(Model model, @ModelAttribute("newResort") @Valid Resort resort,
            BindingResult newResortBindingResult, @RequestParam("file") MultipartFile file) {
        if (newResortBindingResult.hasErrors()) {
            return "admin/resort/create";
        }
        resort.setImage(this.uploadService.handleSaveUploadFile(file, "resort"));
        this.resortService.handleSaveResort(resort);
        return "redirect:/admin/resort";
    }

    @GetMapping("/admin/resort/update/{id}")
    public String getUpdateResortPage(Model model, @PathVariable long id) {
        Resort resort = this.resortService.getResortById(id);
        model.addAttribute("newResort", resort);
        return "admin/resort/update";
    }

    @PostMapping("/admin/resort/update")
    public String updateResortPage(Model model, @ModelAttribute("newResort") @Valid Resort resort,
            BindingResult resortBindingResult, @RequestParam("file") MultipartFile multipartFile) {
        if (resortBindingResult.hasErrors()) {
            return "admin/resort/update";
        }
        Resort currentResort = this.resortService.getResortById(resort.getId());
        currentResort.setEmail(resort.getEmail());
        currentResort.setAddress(resort.getAddress());
        currentResort.setName(resort.getName());
        currentResort.setPhone(resort.getPhone());
        currentResort.setDescription(resort.getDescription());
        if (multipartFile != null && !multipartFile.isEmpty()) {
            currentResort.setImage(this.uploadService.handleSaveUploadFile(multipartFile, "resort"));
        }
        this.resortService.handleSaveResort(currentResort);

        return "redirect:/admin/resort";
    }

    @GetMapping("/admin/resort/delete/{id}")
    public String getDeleteResortPage(Model model, @PathVariable Long id) {
        Resort resort = this.resortService.getResortById(id);
        model.addAttribute("resortsToDelete", List.of(resort));
        return "admin/resort/delete";
    }

    @PostMapping("/admin/resort/delete/confirm")
    public String getDeleteResortsPage(Model model, @RequestParam("ids") List<Long> ids) {
        List<Resort> resorts = resortService.getResortsByIds(ids);
        model.addAttribute("resortsToDelete", resorts);
        return "admin/resort/delete";
    }

    @PostMapping("/admin/resort/delete")
    public String deleteResortPage(@RequestParam(value = "ids", required = false) List<Long> ids,
            @RequestParam(value = "id", required = false) Long id) {
        if (id != null) {
            resortService.deleteResortById(id);
        } else if (ids != null && !ids.isEmpty()) {
            resortService.deleteResorts(ids);
        }
        return "redirect:/admin/resort";
    }
}
