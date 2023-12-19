package springweb.z01_homework.vo;

public class Account {
//balance(잔액), deposit(입금), withdraw(출금)
	private String balance;
	private String deposit;
	private String withdraw;
	public Account() {
		// TODO Auto-generated constructor stub
	}
	public Account(String balance, String deposit, String withdraw) {
		this.balance = balance;
		this.deposit = deposit;
		this.withdraw = withdraw;
	}
	public String getBalance() {
		return balance;
	}
	public void setBalance(String balance) {
		this.balance = balance;
	}
	public String getDeposit() {
		return deposit;
	}
	public void setDeposit(String deposit) {
		this.deposit = deposit;
	}
	public String getWithdraw() {
		return withdraw;
	}
	public void setWithdraw(String withdraw) {
		this.withdraw = withdraw;
	}
	
}
