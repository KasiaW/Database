package engine;

public class Core {

	private DB db =null;
	private static Core c = null;
	
	public static Core getCore(){
		if (c == null) c = new Core();
		
		return c;
	}
	
	public static DB getDB(){
		if (getCore().db == null)
			getCore().db = new DB();
		
		return getCore().db;
	}
}
