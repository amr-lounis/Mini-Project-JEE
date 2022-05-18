package model.entities;

import javax.persistence.EntityManager;

import model.DB;
public class C_UD {
	public boolean create() {
		try {
			EntityManager em = DB.getInstanceDB().em;
			em.getTransaction().begin();
			em.persist(this);
			em.getTransaction().commit();
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	public boolean update() {
		try {
			EntityManager em = DB.getInstanceDB().em;
			em.getTransaction().begin();
			em.persist(this);
			em.getTransaction().commit();
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	public boolean delete() {
		try {
			EntityManager em = DB.getInstanceDB().em;
			em.getTransaction().begin();
			em.remove(this);
			em.getTransaction().commit();
		} catch (Exception e) {
			return false;
		}
		return true;
	}
}
