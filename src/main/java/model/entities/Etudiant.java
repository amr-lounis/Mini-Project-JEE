package model.entities;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.*;
import model.DB;

@Entity
public class Etudiant extends C_UD {
	//----------------------------------------------------------------- definition
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
	//----------------------------------------------------------------- static code
	public static Etudiant login(String name , String password) {
		String hql = "SELECT e FROM Etudiant e "
				+ "WHERE e.name = ?1 "
				+ "AND e.password = ?2 ";
		Query query = DB.getInstanceDB().em.createQuery(hql);
		query.setParameter(1, name);
		query.setParameter(2, password);
		List<Etudiant> le =  query.getResultList();
		return (le.size() == 1) ?  le.get(0) : null;
	}
	
	public static Etudiant getOne(Long id) {
		return DB.getInstanceDB().em.find(Etudiant.class, id);
	}

	public static List<Etudiant> search(String s) {
		String hql = "select b from Etudiant b WHERE b.name LIKE CONCAT('%',?1,'%')";
		Query query = DB.getInstanceDB().em.createQuery(hql);
		query.setParameter(1, s);
		return query.getResultList();
	}

	//----------------------------------------------------------------- object code
	public Etudiant() {}
	
	public Etudiant(String name, String password, Universite universite) {
		this.name = name;
		this.password = password;
		this.universite = universite;
		
		String pn = getPackageName();
		if(pn.equals("premium"))this.sizePackage = 20;
		else if(pn.equals("standard"))this.sizePackage = 10;
		else if(pn.equals("illimite"))this.sizePackage = 999999999;
		
		this.sizePackage = 10;
	}

	public void addBonus() {
		String pn = getPackageName();
		if(pn.equals("premium"))this.sizePackage += 10;
		else if(pn.equals("standard"))this.sizePackage += 5;
		this.update();
	}

	public void takeBookFromLibrary(Book b) {
		if(this.getNumberOfMyBooksNotExpire() < sizePackage) {
			new EtudiantBook(this, b).Create();
		}
		else {
			System.out.println("********** : canot add new book");
		}
	}
	

	public List<Book> getMyBooksNotExpire() {
		String hql = "SELECT eb.book FROM EtudiantBook eb inner join eb.book inner join eb.etudiant "
				+ "WHERE eb.etudiant.id = ?1 " + "AND eb.endDateBookRental >= sysdate()";
		Query query = DB.getInstanceDB().em.createQuery(hql);
		query.setParameter(1, this.id);
		return query.getResultList();
	}
	public List<Object> getMyBooksNotExpireAllInfo() {
		String hql = "SELECT eb.book.id , eb.book.name , eb.beginDateBookRental , eb.endDateBookRental FROM EtudiantBook eb inner join eb.book inner join eb.etudiant "
				+ "WHERE eb.etudiant.id = ?1 " + "AND eb.endDateBookRental >= sysdate()";
		Query query = DB.getInstanceDB().em.createQuery(hql);
		query.setParameter(1, this.id);
		return query.getResultList();
	}

	public int getNumberOfMyBooksNotExpire() {
		String hql = "SELECT count(eb.book) FROM EtudiantBook eb inner join eb.book inner join eb.etudiant "
				+ "WHERE eb.etudiant.id = ?1 " + "AND eb.endDateBookRental >= sysdate()";
		Query query = DB.getInstanceDB().em.createQuery(hql);
		query.setParameter(1, this.id);
		String count = query.getSingleResult().toString();

		return (int) Integer.valueOf(count);
	}

	public String getPackageName() {
		String pn = universite.getPackageType().getName();
		return pn;
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getSizePackage() {
		return sizePackage;
	}

	public void setSizePackage(int sizePackage) {
		this.sizePackage = sizePackage;
	}

	public Universite getUniversite() {
		return universite;
	}

	public void setUniversite(Universite universite) {
		this.universite = universite;
	}

	public Set<EtudiantBook> getEtudiantbook() {
		return etudiantbook;
	}

	public void setEtudiantbook(Set<EtudiantBook> etudiantbook) {
		this.etudiantbook = etudiantbook;
	}
}
