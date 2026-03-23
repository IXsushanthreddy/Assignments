package task2;

public class Address {
    private int pincode;
    private String city;

    public Address(int pincode, String city) {
        this.pincode = pincode;
        this.city = city;
    }
    public int getPincode() {
        return pincode;
    }

    public String getCity() {
        return city;
    }

    @Override
    public String toString() {
        return "Address{" + "pincode=" + pincode + ", city=" + city + '}';
    }

}
