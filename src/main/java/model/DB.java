package model;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class DB {
	// --------------------------------------------- Entity Manager
	private EntityManagerFactory emf;
	public EntityManager em;

	// --------------------------------------------- Dependency Inversion pattern
	private DB() {
		// MySql or h2 -> get configuration from persistence.xml
		emf = Persistence.createEntityManagerFactory("mysql");
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

}
