package com.jsp.cms.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import com.jsp.cms.config.EMFSingleton;
import com.jsp.cms.entity.Contact;
import com.jsp.cms.entity.User;

public class ContactDao {

	public boolean addContacts(Contact contact) {
		EntityManager manager = EMFSingleton.getFactory().createEntityManager();
		EntityTransaction transaction = manager.getTransaction();
		try {
			transaction.begin();
			manager.persist(contact);
			transaction.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			manager.close();
		}
	}

	public Contact getContacts(int contactId) {
		EntityManager manager = EMFSingleton.getFactory().createEntityManager();
		EntityTransaction transaction = manager.getTransaction();

		transaction.begin();
		Contact contact = manager.find(Contact.class, contactId);
		transaction.commit();
		manager.close();
		return contact;
	}

	public boolean updateContact(Contact contact) {
		EntityManager manager = EMFSingleton.getFactory().createEntityManager();
		EntityTransaction transaction = manager.getTransaction();
		try {
			transaction.begin();
			manager.merge(contact);
			transaction.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			manager.close();
		}
	}

	public boolean deleteContact(Integer contactId) {
		EntityManager manager = EMFSingleton.getFactory().createEntityManager();
		EntityTransaction transaction = manager.getTransaction();
		try {
			transaction.begin();
			manager.remove(manager.find(Contact.class, contactId));
			transaction.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			manager.close();
		}
	}

	public List<Contact> findContactByUser(User user) {
		EntityManager manager = EMFSingleton.getFactory().createEntityManager();
		List<Contact> contacts=null;
		try {
		TypedQuery<Contact> query = manager.createQuery("From Contact where user=:user",Contact.class);
		query.setParameter("user", user);
		contacts = query.getResultList();
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally {
			manager.close();
		}
			return contacts;
	}
}
