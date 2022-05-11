package model.entities;

import javax.persistence.*;

@Entity
public class Universite {
	// ---------------------------------------------------- definition
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	// -----------------------------
	private String name;
	// -----------------------------
	@ManyToOne
	private PackageType packageType;

	// ---------------------------------------------------- code
	public Universite(String name, PackageType packageType) {
		this.name = name;
		this.packageType = packageType;
	}
	
}
