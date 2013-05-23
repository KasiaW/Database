package domain;

public class Member {

	private String login;
	private String mail;
	private String www;
	private String birthday;
	private String description;
	private String joined;
	
	
	
	

public Member (String login){
	this.login = login;
	
}

public void setJoined(String joined){
	this.joined = joined;
}

public void setMail(String mail){
	this.mail = mail;
}

public void setWWW (String www){
	this.www = www;
}

public void setBirthday (String birthday){
	this.birthday = birthday;
}

public void setDescription (String description){
	this.description = description;
}

public String getJoined(){
	return joined;
}




public String getLogin(){
	return login;
}

public String getMail(){
	return mail;
}

public String getWWW(){
	return www;
}

public String getBirthday(){
	return birthday;
}

public String getDescription(){
	return description;
}



}