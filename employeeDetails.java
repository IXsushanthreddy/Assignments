class Employee{
    int id;
    String name;
    double monthlySalary;
    static String companyName="Innovatechs";
    Employee(int id,String name,double  monthlySalary){
        this.id=id;
        this.name=name;
        this.monthlySalary=monthlySalary;
        this.companyName=companyName;
    }
    void calculateAnnualSalary(){
        double annualSalary=(12*monthlySalary);
        System.out.println("the annual salary:"+annualSalary);

    }
    void displayEmployeeDetails(){
        System.out.println("Empolyee Company: "+companyName);
        System.out.println(" Empolyee ID: "+id);
        System.out.println("Empolyee Name: "+name);
        System.out.println("Empolyee monthlySalary: "+monthlySalary);

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

