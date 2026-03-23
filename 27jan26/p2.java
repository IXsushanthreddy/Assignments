import java.util.*;
public class p2 {
    static int coun(String[] s,String a){
        int c=0;
        //enhanced for loop
        for(String d:s){
            if(d.equals(a)){
                c=c+1;
            }
        }
        return c;
    }
    public static void main(String[] args){
        Scanner sc=new Scanner(System.in);
        System.out.println("enter the no. of employes");
        int n=sc.nextInt();
        //array
        String[] emp=new String[n];
        System.out.println("enter the name of employes ");
        for(int i=0;i<n;i++){
            emp[i]=sc.next();
        }


        //arraylist
        ArrayList<String> arr=new ArrayList<>(Arrays.asList(emp));
        System.out.println(arr);


        //hashset 
        HashSet<String> dupli=new HashSet<>();
        for(int i=0;i<n;i++){
            dupli.add(emp[i]);
        }
        System.out.println(dupli);


        //Hashmap frequency of each element
        HashMap<String,Integer> hmap=new HashMap<>();
        for(String k:emp){
            hmap.put(k,coun(emp,k));
        }
        System.out.println(hmap);
        //iterator
        Iterator<String> itt=arr.iterator();
		while(itt.hasNext()){
			String f=itt.next();
			System.out.println(f);
		}
        System.out.println(arr);



    sc.close();

    }
    
}
