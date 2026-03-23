package com.sushanthreddy.springboot._106;

import java.util.ArrayList;
import java.util.List;

public class UserServices {
    private UserRepository userRepository;
    public UserServices(UserRepository userRepository) {
        this.userRepository = userRepository;
    }
    private User mapToEntity(UserRequestDTO dto) {
        User s=new User();
        s.setName(dto.getName());
        s.setEmail(dto.getEmail());
        s.setAddress(dto.getAddress());
        s.setPhone_number(dto.getPhone_number());
        return s;

    }
    private UserResponseDTO mapToReponse(User s){
        return new UserResponseDTO(
                s.getId(),
                s.getName(),
                s.getEmail(),
                s.getAddress(),
                s.getPhone_number()
        );
    }
    public List<UserResponseDTO> getUsers() {
        List<User> users = userRepository.findAll();
        List<UserResponseDTO> list = new ArrayList<>();
        for (User user : users) {
            list.add(mapToReponse(user));
        }
        return list;
    }
    public UserResponseDTO save(UserRequestDTO dto) {
        User user = mapToEntity(dto);
        userRepository.save(user);
        return mapToReponse(user);
    }
    public UserResponseDTO findById(Integer id) {
        User user = userRepository.findById(id).orElseThrow();
        return mapToReponse(user);
    }

}
