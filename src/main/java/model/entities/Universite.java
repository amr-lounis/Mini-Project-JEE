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
	
	public static Universite getOneById(Long id) {
		try {
			return DB.getInstanceDB().em.find(Universite.class, id);
		} catch (Exception e) {
			return null;
		}
	}
	public static List<Universite> search(String s) {
		String hql = "select b from Universite b WHERE b.name LIKE CONCAT('%',?1,'%')";
		Query query = DB.getInstanceDB().em.createQuery(hql);
		query.setParameter(1, s);
		return query.getResultList();
	}
	
	public static Universite addNew(String name, Long packageType_id)  {
		try {
			PackageType pt = PackageType.getOneById(packageType_id);
			Universite u = new Universite(name, pt);
			u.create();
			return u;
		} catch (Exception e) {return null;}
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
