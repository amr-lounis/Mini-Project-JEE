package model.entities;

import java.util.Date;
import javax.persistence.*;

@Entity
public class EtudiantBook extends C_UD{
	//----------------------------------------------------------------- definition
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

	//----------------------------------------------------------------- Object code
	public EtudiantBook() {}
	public EtudiantBook(Etudiant e, Book b) {
		long now = System.currentTimeMillis();
		this.beginDateBookRental = new Date(now);
		long time_30day = (30l * 24l * 60l * 60l * 1000l);
		this.endDateBookRental = new Date(now + time_30day);
		this.etudiant = e;
		this.book = b;
	}
	//----------------------------------------------------------------- Getter Setter

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getBeginDateBookRental() {
		return beginDateBookRental;
	}

	public void setBeginDateBookRental(Date beginDateBookRental) {
		this.beginDateBookRental = beginDateBookRental;
	}

	public Date getEndDateBookRental() {
		return endDateBookRental;
	}

	public void setEndDateBookRental(Date endDateBookRental) {
		this.endDateBookRental = endDateBookRental;
	}

	public Etudiant getEtudiant() {
		return etudiant;
	}

	public void setEtudiant(Etudiant etudiant) {
		this.etudiant = etudiant;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}
	
	
	
}
