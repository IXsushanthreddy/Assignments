import java.util.*;
class numspr{
     void displaynums(int n){
        for(int i=0;i<=n;i++){
            System.out.print(i+" ");
        }
        System.out.println();
    }
                

    void displayevens(int n){
        
        for(int i=0;i<=n;i++){
            if((i & 1)==0){
                System.out.print(i+" ");
            }
        }
    
        System.out.println();
    }
    int summ(int n){

        int s=0;
        for(int i=0;i<=n;i++){
            s=s+i;
        }
        return s;
    }

}
public class printNumbersAcc {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter a number:");
        int n=sc.nextInt();
        if(n>=0){
        numspr np=new numspr();
        System.out.println("Numbers from 0 to "+n+":");
        np.displaynums(n);
        System.out.println("Even numbers from 0 to "+n+":");
        np.displayevens(n);
        System.out.println("Sum of numbers from 0 to "+n+":");
        System.out.println(np.summ(n));
    }

else{
    System.out.println("not possible because number is negative ");

}
    }
}

    
