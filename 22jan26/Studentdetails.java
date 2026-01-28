
import java.util.Scanner;

class Student{
    //creating private variables
    private int id;
    private String name;
    private int score;
    Student(int id,String name,int score){
        this.id=id;
        this.name=name;
        this.score=score;

    }
    public int getId(){
        return id;
    }
    public String getName(){
        return name;
    }
    public int getScore(){
        return score;
    }

    public void setDetails(int id,String name,int score){
        this.id=id;
        this.name=name;
        this.score=score;
    }
    void displayDetails(int id,String name,int score){
        setDetails(id,name,score);
        System.out.println("Student ID: "+getId());
        System.out.println("Student Name: "+getName());
        System.out.println("Student Score: "+getScore());
    }
    boolean isPassed(){
        if(score>=40){
            return true;
        }
        else{
            return false;
        }
    }

} 
public class Studentdetails{
    public static void main(String[] args){
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter a ID:");
        int studentId=sc.nextInt();
        System.out.println("Enter a name:");
        String studentName=sc.next();
        System.out.println("Enter a score:");
        int studentScore=sc.nextInt();
        Student s= new Student(studentId,studentName,studentScore);
        System.out.println("Student Passed?");

        System.out.println(s.isPassed());

sc.close();


    }
}























