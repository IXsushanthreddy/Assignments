import java.util.Scanner;

class operation {
    int add(int a,int b){
        return a+b;
    }
    boolean isEven(int n){
        if((n &1)==0){
            return true;
        }
        else{
            return false;
        }
    }
    int fact(int n){
        if(n>=0){
        if(n==0 || n==1){
            return 1;
        }
        else{
            return n*fact(n-1);
        }
    }
    else{
        return -1;
    }
    }
    
}
public class operations{
    public static void main(String[] args){
        Scanner sc=new Scanner(System.in);
        operation op=new operation();
                System.out.println("Enter a number:");

        int a=sc.nextInt();
                System.out.println("Enter a number:");

        int b=sc.nextInt();
               System.out.println(op.add(a,b));
                System.out.println(op.isEven(a)); 
                System.out.println(op.fact(b));
 


    }

}
