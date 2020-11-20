package student;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import database.Database;

public class StudentAccount {
	private int accountNumber;
	private String name = null;
	private boolean gender;
	private Date birthDate = null;
	private String educationalQualification = null;
	private int phoneNumber;
	
	public StudentAccount(int accountNumber) {
		this.accountNumber = accountNumber;
	}

	public boolean checkAccount(String password) {
		String sql = "SELECT * FROM Student_Information WHERE AccountNumber=" + accountNumber + ";";
		
		try {
			Statement stat = Database.getStatement();
			ResultSet rs = stat.executeQuery(sql);
			
			rs.next();
			
			if(password.contentEquals(rs.getString("Password"))) {
				name = rs.getString("Name");
				gender = rs.getBoolean("Gender");
				birthDate = rs.getDate("BirthDate");
				educationalQualification = rs.getString("EducationalQualification");
				phoneNumber = rs.getInt("PhoneNumber");
				return true;
			}
		}
		catch (SQLException e) {
			System.out.println("student.StudentAccount.checkAccount SQLException: " + e);
		}
		
		return false;
	}

	public int getAccountNumber() {
		return accountNumber;
	}

	public String getName() {
		return name;
	}

	public boolean isGender() {
		return gender;
	}

	public Date getBirthDate() {
		return birthDate;
	}

	public String getEducationalQualification() {
		return educationalQualification;
	}

	public int getPhoneNumber() {
		return phoneNumber;
	}
	
}
