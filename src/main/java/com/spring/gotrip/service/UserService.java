package com.spring.gotrip.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.spring.gotrip.model.Role;
import com.spring.gotrip.model.User;
import com.spring.gotrip.model.dto.RegisterDTO;
import com.spring.gotrip.repository.RoleRepository;
import com.spring.gotrip.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;

    public UserService(UserRepository userRepository, RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    public Page<User> getAllUser(Pageable pageable){
        return this.userRepository.findAll(pageable);
    }

    public User handleSaveUser(User user){
        User userAdd = this.userRepository.save(user);
        return userAdd;
    }

    public boolean existsByEmail(String email){
        return this.userRepository.existsByEmail(email);
    }

    public User getUserByEmail(String email){
        return this.userRepository.findByEmail(email);
    }

    public Role getRoleByName(String name){
        return this.roleRepository.findByName(name);
    }
    
    public Optional<User> getUserById(Long id){
        return this.userRepository.findById(id);
    }

    public List<User> getUsersByIds(List<Long> ids){
        return this.userRepository.findAllById(ids);
    }

    public void deleteUserById(Long id){
        this.userRepository.deleteById(id);
    }

    public void deleteUsers(List<Long> ids){
        this.userRepository.deleteAllById(ids);
    }

    public User transferRegisterToUser(RegisterDTO registerDTO){
        User user = new User();
        user.setFullName(registerDTO.getFirstName() + registerDTO.getLastName());
        user.setEmail(registerDTO.getEmail());
        user.setPassword(registerDTO.getPassword());
        user.setPassword(registerDTO.getConfirmPassword());
        return user;
    }
    
}
