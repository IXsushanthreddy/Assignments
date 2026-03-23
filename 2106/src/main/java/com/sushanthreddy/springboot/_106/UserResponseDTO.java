package com.sushanthreddy.springboot._106;

public class UserResponseDTO {
    private Integer id;
    private String name;
    private String email;
    private String address;
    private String phone_number;

    public UserResponseDTO(Integer id, String name, String email, String address, String phone_number) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.address = address;
        this.phone_number = phone_number;
    }

    public Integer getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getAddress() {
        return address;
    }

    public String getPhone_number() {
        return phone_number;
    }
}
