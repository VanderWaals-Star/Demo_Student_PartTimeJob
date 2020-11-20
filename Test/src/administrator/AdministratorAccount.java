package administrator;

import database.Database;
import java.sql.*;

public class AdministratorAccount {
	private int accountNumber;
	private String accountName = null;
	
	public AdministratorAccount(int accountNumber) {
		this.accountNumber = accountNumber;
	}
	
	//��������Ƿ���ȷ
	public boolean checkAccount(String password) {
		String sql = "SELECT * FROM Administrator_Information WHERE AccountNumber=" + accountNumber + ";";
		
		try {
			Statement stat = Database.getStatement();
			ResultSet rs = stat.executeQuery(sql);
			
			rs.next();
			
			if(password.contentEquals(rs.getString("Password"))) {
				accountName = rs.getString("AccountName");
				return true;
			}
		}
		catch (SQLException e) {
			System.out.println("administrator.AdministratorAccount.checkAccount SQLException: " + e);
		}
		
		return false;
	}
	
	//�����û�����
	public boolean updateAccountName(String accountName) {
		Statement stat = Database.getStatement();
		try {
			stat.execute("UPDATE administrator_information SET AccountName='" + accountName + "' WHERE AccountNumber='" + this.accountNumber + "';");
			setAccountName(accountName);
			return true;
		}
		catch (SQLException e) {
			System.out.println("administrator.AdministratorAccount.updateAccountName SQLException: " + e);
		}
		return false;
	}
	
	//��������
	public boolean updatePassword(String password) {
		Statement stat = Database.getStatement();
		try {
			stat.execute("UPDATE administrator_information SET Password=" + password + " WHERE AccountNumber=" + this.accountNumber + ";");
			return true;
		}
		catch (SQLException e) {
			System.out.println("administrator.AdministratorAccount.updatePassword SQLException: " + e);
		}
		return false;
	}
	
	public String getAccountName() {
		return accountName;
	}

	private void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	public int getAccountNumber() {
		return accountNumber;
	}
	
}

//20177710750 ����

