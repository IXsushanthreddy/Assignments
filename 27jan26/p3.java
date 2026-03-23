import java.util.*;
import java.util.regex.Pattern;
class InvalidEmailException extends Exception {
    public InvalidEmailException(String message) {
        super(message);
    }
}

class InvalidNameException extends Exception{
    public InvalidNameException(String message){
        super(message);
    }
}

class InvalidAgeException extends Exception {
    public InvalidAgeException(String message) {
        super(message);
    }
}


public class p3 {
   
    static void checkMail(String email) throws InvalidEmailException{
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";
        
        if (!Pattern.compile(emailRegex).matcher(email).matches()) {
            throw new InvalidEmailException("Format Error: '" + email + "' is not a valid email.");
        }
    }
    
    static void checkName(String username) throws InvalidNameException{
        String nameRegex="^[a-zA-Z0-9]{3,16}$";
        if(!Pattern.compile(nameRegex).matcher(username).matches()){
            throw new InvalidNameException("Format Error: '"+username+"' is not valid username.");
        }
    }

    static void checkAge(int age) throws InvalidAgeException{
        
        if(age<=21){
            throw new InvalidAgeException("Format Error: '"+age+"' is not valid age.");
        }
    }
     

    public static void main(String[] args) {
        Scanner sc =new Scanner(System.in);
        System.out.println("enter mail: ");

        String email=sc.next();
        System.out.println("enter age");

        int age=sc.nextInt();
        System.out.println("enter username");

        String username=sc.next();

        try{
            
            
            checkMail(email);
            System.out.println("valid email");

            checkName(username);
            System.out.println("valid username");

            checkAge(age);
            System.out.println("valid age");


        }
        
        catch(InvalidNameException e){
            System.out.println(e.getMessage());
        }
        catch(InvalidEmailException e){
            System.out.println(e.getMessage());
        }
        catch(InvalidAgeException e){
            System.out.println(e.getMessage());
        }


        
    }
    
}
