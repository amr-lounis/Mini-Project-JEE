package model.entities;

import javax.persistence.*;

@Entity
public class PackageType {
	// ----------------------------------------------------  definition 
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	//-----------------------------
	private String name;

	// ---------------------------------------------------- code 
    public PackageType(String name) {
    	this.name = name;
    }
}
