class Employee{
    int id;
    String name;
    double monthlySalary;
    
    Employee(int id,String name,double  monthlySalary){
        this.id=id;
        this.name=name;
        this.monthlySalary=monthlySalary;
    }
    void calculateAnnualSalary(){
        double annualSalary=(12*monthlySalary);
        System.out.println("the annual salary:"+annualSalary);

    }
    void displayEmployeeDetails(){
        System.out.println("Student ID: "+id);
        System.out.println("Student Name: "+name);
        System.out.println("Student Score: "+monthlySalary);
    }
}
public class employeeDetails{
    public static void main(String[] args) {
        Employee emp1=new Employee(101,"sushanth",100000);   
        Employee emp2=new Employee(102,"Reddy",120000);
        
        
        emp1.displayEmployeeDetails();
        emp1.calculateAnnualSalary();
        
        emp2.displayEmployeeDetails();
        emp2.calculateAnnualSalary();


        
    }
}

