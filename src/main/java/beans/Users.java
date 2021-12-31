package beans;

public class Users {
	private String firstName, lastName, login, passWord,role;
	private int id;
	
	public Users() {
		
	}
	
	public Users(int id, String firstName,String lastName,String login,String password,String role) {
		this.setId(id);
		this.firstName = firstName;
		this.lastName = lastName;
		this.login = login;
		this.passWord = password;
		this.role = role;
	}
	public Users(String firstName,String lastName,String login,String password,String role) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.login = login;
		this.passWord = password;
		this.role = role;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	
}
