package model.entities;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;

@Entity
public class Etudiant{
	// ---------------------------------------------------- definition
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	// -----------------------------
	private String name;
	private String password;
	private int sizePackage;  // count book accessible
	// -----------------------------
	@ManyToOne
	private Universite universite;
	// -----------------------------
	@OneToMany(mappedBy = "id")
	private Set<EtudiantBook> etudiantbook = new HashSet<EtudiantBook>();
}
