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
	private EntityManagerFactory emf;
	public EntityManager em;

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
		if(PackageType.getOne(1l) == null) {
			new Book( "book 01").Create();
			new Book( "book 02").Create();
			new PackageType("premium").Create();
			new PackageType("standard").Create();
			new PackageType("illimite").Create();		
			new Universite("universite alger 1",PackageType.getOne(1l)).Create();
			new Etudiant("etudiant01", "password01", Universite.getOne(1l)).Create();
			new Etudiant("etudiant02", "password02", Universite.getOne(1l)).Create();
			new Etudiant("etudiant03", "password03", Universite.getOne(1l)).Create();
			Etudiant e1 = Etudiant.getOne(1l);
			e1.takeBookFromLibrary(Book.getOne(1l));
			e1.takeBookFromLibrary(Book.getOne(2l));
			System.out.println("not exist");
		}
	}
}
