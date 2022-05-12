package model.entities;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.persistence.*;
import model.DB;

@Entity
public class Book extends C_UD{
	//-----------------------------------------------------------------definition
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	// -----------------------------
	private String name;
	private String domaine;
	// -----------------------------
	@OneToMany(mappedBy = "id")
	private Set<EtudiantBook> etudiantbook = new HashSet<EtudiantBook>();

	//----------------------------------------------------------------- static code
	public static Book getOne(Long id) {
		return DB.getInstanceDB().em.find(Book.class, id);
	}
	public static List<Book> search(String s) {
		String hql = "select b from Book b WHERE b.name LIKE CONCAT('%',?1,'%')";
		Query query = DB.getInstanceDB().em.createQuery(hql);
		query.setParameter(1, s);
		return query.getResultList();
	}
	//----------------------------------------------------------------- Object code
	public Book() {}
	
	public Book(String n) {
		this.name = n;
	}
	//----------------------------------------------------------------- Getter Setter
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDomaine() {
		return domaine;
	}
	public void setDomaine(String domaine) {
		this.domaine = domaine;
	}
	public Set<EtudiantBook> getEtudiantbook() {
		return etudiantbook;
	}
	public void setEtudiantbook(Set<EtudiantBook> etudiantbook) {
		this.etudiantbook = etudiantbook;
	}
	//-----------------------------------------------------------------
}