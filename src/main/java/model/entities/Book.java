package model.entities;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.*;

@Entity
public class Book{
	// ---------------------------------------------------- definition
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	// -----------------------------
	private String name;
	private String domaine;
	// -----------------------------
	@OneToMany(mappedBy = "id")
	private Set<EtudiantBook> etudiantbook = new HashSet<EtudiantBook>();

	// ---------------------------------------------------- code
	public Book(String n) {
		this.name = n;
	}
}