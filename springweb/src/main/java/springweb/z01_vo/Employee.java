package springweb.z01_vo;


// springweb.z01_vo.Employee
// SELECT * FROM emp WHERE job LIKE '%'||''||'%' AND ename LIKE '%'||''||'%';
public class Employee {
	 private int no; // emp
	 private String name; // ename 
	 private double salary; // sal
	 private String grade; // job
	public Employee() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Employee(int no, String name, double salary, String grade) {
		super();
		this.no = no;
		this.name = name;
		this.salary = salary;
		this.grade = grade;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getSalary() {
		return salary;
	}
	public void setSalary(double salary) {
		this.salary = salary;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	 

}
