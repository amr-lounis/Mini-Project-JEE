package model;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import model.entities.Book;
import model.entities.Etudiant;
import model.entities.PackageType;
import model.entities.Universite;

public class DB {
	// --------------------------------------------- Entity Manager
	private static EntityManagerFactory emf;
	public static EntityManager em;

	// --------------------------------------------- Dependency Inversion pattern
	private DB() {
		// MySql or h2 -> get configuration from persistence.xml
		emf = Persistence.createEntityManagerFactory("h2");
		em = emf.createEntityManager();
	}

	// --------------------------------------------- singleton pattern
	private static final Object LOCK = new Object();
	private static DB db;

	public static DB getInstanceDB() {
		synchronized (LOCK) {
			if (db == null) {
				db = new DB();
				System.out.println("********************* : getInstanceDB : singleton pattern");
			}

		}
		return db;
	}
	
	public static void init() {
		if(PackageType.getOneById(1l) == null) {
			Book.addNew("book 01", "medicine");
			Book.addNew("book 02", "computer science");
			Book.addNew("book 03", "veterinary");
			Book.addNew("book 04", "Maths");
			Book.addNew("book 05", "biology");

			PackageType.addNew("premium",20);
			PackageType.addNew("standard",10);
			PackageType.addNew("illimite",1000000);
	
			Universite.addNew("universite alger 1",1L);
			Universite.addNew("universite alger 2",2L);
			Universite.addNew("universite alger 3",2L);
			Universite.addNew("universite USTHB",3L);
			
			Etudiant.addNew("etudiant01", "password01", 1L);
			Etudiant.addNew("etudiant02", "password02", 2L);
			Etudiant.addNew("etudiant03", "password03", 3L);
			Etudiant.addNew("etudiant04", "password04", 4L);
			
			Etudiant e1 = Etudiant.getOneById(1l);
			e1.takeBookFromLibrary(Book.getOneById(1l));
			e1.takeBookFromLibrary(Book.getOneById(2l));
			System.out.println("not exist");
		}
	}
}
