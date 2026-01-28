import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
public class p4 {
    static int summ(ArrayList<Integer> su){
        int s=0;
        for(int i:su){
            s=s+i;
        }
        return s;
    }
    static double Average(ArrayList<Double> su){
        double s=0;
        int c=0;
        for(double i:su){
            s=s+i;
            c=c+1;
        }
        return s/c;
    }
    private static final Logger logger = Logger.getLogger(p4.class.getName());

    public static void main(String[] args){
        Scanner sc=new Scanner(System.in);
        System.out.println("enter the number");
        int n=sc.nextInt();
        ArrayList<Integer> arr1=new ArrayList<>();
        ArrayList<Double> arr2=new ArrayList<>();
        System.out.println("enter elements in arr1");
        boolean validinput=false;
        while(!validinput){
            try{
            for(int i=0;i<n;i++){
            String a=sc.next();
            Integer b=Integer.parseInt(a);
            int c=b;
            arr1.add(c);
        }
        System.out.println(arr1);
        System.out.println("enter elements in arr2");
        for(int i=0;i<n;i++){
            String a=sc.next();
            Double b=Double.parseDouble(a);
            double c=b;
            arr2.add(c);
        }
        System.out.println(arr2);
        validinput=true;
        logger.info("Successfully processed all inputs.");
        System.out.println("summ of elements in arr1: "+summ(arr1));
        System.out.println("summ of elements in arr1: "+Average(arr2));
        }
    catch(NumberFormatException e){
        logger.log(Level.WARNING, "Invalid input format detected. Please enter numeric values only.", e);
        arr1.clear();
        arr2.clear();
        System.out.println("re-enter arr1 and arr2 elements");
        
    }
        }

    }
    
}
