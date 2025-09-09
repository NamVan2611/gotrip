package com.spring.gotrip.controller.client;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.spring.gotrip.model.Resort;
import com.spring.gotrip.model.User;
import com.spring.gotrip.model.dto.RegisterDTO;
import com.spring.gotrip.service.ResortService;
import com.spring.gotrip.service.UserService;

import jakarta.validation.Valid;

@Controller
public class HomePageController {

    private final UserService userService;
    private final PasswordEncoder passwordEncoder;
    private final ResortService resortService;
    
    public HomePageController(UserService userService, PasswordEncoder passwordEncoder, ResortService resortService) {
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
        this.resortService = resortService;
    }

    @GetMapping("/")
    public String getHomePage(Model model) {
        Pageable pageable = PageRequest.of(0, 6);
        Page<Resort> resortPage = this.resortService.getAllResort(pageable);
        List<Resort> resortList = resortPage.getContent();
        model.addAttribute("resorts", resortList); 
        return "client/homepage/show";
    }

    @GetMapping("/login")
    public String getLoginPage() {
        return "client/auth/login";
    }

    @GetMapping("/access-denied")
    public String getDenyPage() {
        return "client/auth/access-denied";
    }

    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        model.addAttribute("registerUser", new RegisterDTO());
        return "client/auth/register";
    }

    @PostMapping("/register")
    public String handleRegisterPage(@ModelAttribute("registerUser") @Valid RegisterDTO registerDTO, BindingResult bindingResult){
        if (bindingResult.hasErrors()) {
            return "client/auth/register";
        }
        User user = this.userService.transferRegisterToUser(registerDTO);
        String hashPassword = this.passwordEncoder.encode(user.getPassword());
        user.setPassword(hashPassword);
        user.setRole(this.userService.getRoleByName("USER"));
        this.userService.handleSaveUser(user);
        return "redirect:/login";
    }
}
