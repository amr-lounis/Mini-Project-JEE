package model.entities;

import java.util.List;

import javax.persistence.*;
import model.DB;

@Entity
public class PackageType extends C_UD{
	//----------------------------------------------------------------- definition
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	//-----------------------------
	private String name;

	//----------------------------------------------------------------- code
	public PackageType() {}
	
    public PackageType(String name) {
    	this.name = name;
    }
	public static PackageType getOne(Long id) {
		return DB.getInstanceDB().em.find(PackageType.class, id);
	}
	public static List<PackageType> search(String s) {
		String hql = "select b from PackageType b WHERE b.name LIKE CONCAT('%',?1,'%')";
		Query query = DB.getInstanceDB().em.createQuery(hql);
		query.setParameter(1, s);
		return query.getResultList();
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
	
	
}
