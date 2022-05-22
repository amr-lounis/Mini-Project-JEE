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
	@Column(name="name", unique=true,nullable = false)
	private String name;
	// -----------------------------
	private String password;
	// -----------------------------
	private int sizePackage;  // count book accessible
	// -----------------------------
	@ManyToOne
	private Universite universite;
	// -----------------------------
	@OneToMany(mappedBy = "id")
	private Set<EtudiantBook> etudiantbook = new HashSet<EtudiantBook>();
	//----------------------------------------------------------------- static code
	public static Etudiant getOneById(Long id) {
		return DB.getInstanceDB().em.find(Etudiant.class, id);
	}
	
	public static Etudiant getOneByName(String name ) {
		String hql = "SELECT e FROM Etudiant e WHERE e.name = ?1 ";
		Query query = DB.getInstanceDB().em.createQuery(hql);
		query.setParameter(1, name);
		List<Etudiant> le =  query.getResultList();
		return (le.size() == 1) ?  le.get(0) : null;
	}
	
	public static Etudiant login(String name , String password) {
		Etudiant e = getOneByName(name);
		if(e!=null) if(e.password.equals(password)) return e;
		return null;
	}

	public static List<Etudiant> search(String s) {
		String hql = "select b from Etudiant b WHERE b.name LIKE CONCAT('%',?1,'%')";
		Query query = DB.getInstanceDB().em.createQuery(hql);
		query.setParameter(1, s);
		return query.getResultList();
	}
	
	public static Etudiant addNew(String name, String password, Long universite_id)  {
		try {
			Etudiant e =new Etudiant(name,password,universite_id);
			e.create();
			return e;
		} catch (Exception e) {return null;}
	}
	public static Etudiant updateEtudiant(Long id,String name, String password, Long universite_id)  {
		try {
			Etudiant e = Etudiant.getOneById(id);
			e.setName(name);
			e.setPassword(password);
			Universite u = Universite.getOneById(universite_id);
			e.setUniversite(u);;
			e.create();
			return e;
		} catch (Exception e) {return null;}
	}
	//----------------------------------------------------------------- object code
	public Etudiant() {}
	
	public Etudiant(String name, String password, Long universite_id) {
		this.name = name;
		this.password = password;
		this.universite = Universite.getOneById(universite_id);
		this.sizePackage = this.universite.getPackageType().getPackageSizeInitial();
	}

	public int addBonus() {
		try {
			String pn = getPackageName();
			if(pn.equals("premium"))this.sizePackage += 10;
			else if(pn.equals("standard"))this.sizePackage += 5;
			this.update();
			return this.sizePackage;
		} catch (Exception e) {
			return -1;
		}
	}

	public void takeBookFromLibrary(Book b) {
		if(this.getNumberOfMyBooksNotExpire() < sizePackage) {
			new EtudiantBook(this, b).create();
		}
		else {
			System.out.println("********** : canot add new book");
		}
	}
	
	public void takeBookFromLibrary(Long id) {
		if(this.getNumberOfMyBooksNotExpire() < sizePackage) {
			new EtudiantBook(this, Book.getOneById(id)).create();
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
