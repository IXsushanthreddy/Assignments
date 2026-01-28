import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
public class p4 {
    static int summ(ArrayList<Number> su){
        int s=0;
        //unboxing
        for(Number i:su){
            s=s+i.intValue();
        }
        return s;
    }
    static double Average(ArrayList<Number> su){
        double s=0;
        int c=0;
        //unboxing
        for(Number i:su){
            s=s+i.intValue();
            c=c+1;
        }
        return s/c;
    }
    private static final Logger logger = Logger.getLogger(p4.class.getName());

    public static void main(String[] args){
        Scanner sc=new Scanner(System.in);
        System.out.println("enter the number");
        int n=sc.nextInt();
        
        System.out.println("enter elements in arr1");
        ArrayList<Number> list = new ArrayList<>();
        boolean validinput=false;
        
            
            for(int i=0;i<n;i++){
                String input = sc.next();
           try {
                if (input.contains(".")) {
                    //autoboxing
                    list.add(Double.parseDouble(input));
                } else {
                    //autoboxing
                    list.add(Integer.parseInt(input)); 
                }
            } catch (NumberFormatException e) {
                logger.log(Level.WARNING, "Invalid input: " + input, e);
            }
        }
       
        
        System.out.println("Sum of Integers: "+summ(list));
        System.out.println("Average of floating numbers: "+Average(list));
        
    }
        

    
    
}
