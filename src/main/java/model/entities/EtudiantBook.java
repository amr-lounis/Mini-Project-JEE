package model.entities;

import java.util.Date;
import javax.persistence.*;

@Entity
public class EtudiantBook{
	// ---------------------------------------------------- definition
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	// -----------------------------
	@Temporal(TemporalType.DATE)
	private Date beginDateBookRental;
	// -----------------------------
	@Temporal(TemporalType.DATE)
	private Date endDateBookRental;
	// -----------------------------
	@ManyToOne
	@JoinColumn(name = "etudiant_id")
	private Etudiant etudiant;
	// -----------------------------
	@ManyToOne
	@JoinColumn(name = "book_id")
	private Book book;

	// ---------------------------------------------------- code

}
