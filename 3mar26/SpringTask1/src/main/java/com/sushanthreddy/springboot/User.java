package com.sushanthreddy.springboot;

public class User {
    private String username;
    private int age;
    private Address address;
    private String email;

    public User(String username, int age, String email, Address address) {
        this.username = username;
        this.age = age;
        this.email = email;
        this.address = address;
    }
    public String getUsername() {
        return username;
    }
    public int getAge() {
        return age;
    }

    public Address getAddress() {
        return address;
    }

    public String getEmail() {
        return email;
    }


    public String toString(){
        return  "User{" + "username=" + username + ", age=" + age + ", email=" + email +",address=" + address +'}';

    }
}
