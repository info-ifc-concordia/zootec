package br.edu.ifc.concordia.ifc.zoo.permission;



/* o que que é um enum ? wtf*/

public enum UserRoles {
	NORMAL(1),
	MANAGER(4),
	ADMIN(7),
	SYS_ADMIN(10);
	
	private int accessLevel;
	
	private UserRoles(int accessLevel) {
		this.accessLevel = accessLevel;
	}
	
	public int getAccessLevel() {
		return this.accessLevel;
	}	
}