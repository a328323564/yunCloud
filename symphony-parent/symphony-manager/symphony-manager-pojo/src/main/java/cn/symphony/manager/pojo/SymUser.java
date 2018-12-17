package cn.symphony.manager.pojo;

import java.io.Serializable;

public class SymUser implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;

    private String userName;

    private String userPassword;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword == null ? null : userPassword.trim();
    }

	@Override
	public String toString() {
		return "SymUser [id=" + id + ", userName=" + userName + ", userPassword=" + userPassword + "]";
	}
    
    
}