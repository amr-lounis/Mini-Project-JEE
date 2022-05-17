package model.entities;

import javax.persistence.EntityManager;

import model.DB;
public class C_UD {
	public void create() {
		EntityManager em = DB.getInstanceDB().em;
		em.getTransaction().begin();
		em.persist(this);
		em.getTransaction().commit();
	}

	public void update() {
		EntityManager em = DB.getInstanceDB().em;
		em.getTransaction().begin();
		em.persist(this);
		em.getTransaction().commit();
	}

	public void delete() {
		EntityManager em = DB.getInstanceDB().em;
		em.getTransaction().begin();
		em.remove(this);
		em.getTransaction().commit();
	}
}
