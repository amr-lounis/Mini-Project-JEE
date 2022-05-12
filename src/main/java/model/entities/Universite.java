package model.entities;

import java.util.List;

import javax.persistence.*;
import model.DB;

@Entity
public class Universite extends C_UD{
	//----------------------------------------------------------------- definition
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	// -----------------------------
	private String name;
	// -----------------------------
	@ManyToOne
	private PackageType packageType;
	
	//----------------------------------------------------------------- static code
	
	public static Universite getOne(Long id) {
		return DB.getInstanceDB().em.find(Universite.class, id);
	}
	public static List<Universite> search(String s) {
		String hql = "select b from Universite b WHERE b.name LIKE CONCAT('%',?1,'%')";
		Query query = DB.getInstanceDB().em.createQuery(hql);
		query.setParameter(1, s);
		return query.getResultList();
	}

	//----------------------------------------------------------------- Object code
	public Universite() {}
	
	public Universite(String name, PackageType packageType) {
		this.name = name;
		this.packageType = packageType;
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

	public PackageType getPackageType() {
		return packageType;
	}

	public void setPackageType(PackageType packageType) {
		this.packageType = packageType;
	}
	
}
