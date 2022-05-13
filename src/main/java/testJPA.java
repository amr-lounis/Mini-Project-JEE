
import java.util.List;

import com.google.gson.Gson;

import model.entities.*;

public class testJPA {
	
	static void print(Object o) {
	    Gson gson = new Gson();
	    String json = gson.toJson(o);
	    System.out.println(json);
	}

	public static void main(String[] args) {
		if(PackageType.getOne(1l) == null) {
			new Book( "book 01").Create();
			new Book( "book 02").Create();
			new PackageType("premium").Create();
			new PackageType("standard").Create();
			new PackageType("illimite").Create();		
			new Universite("Universite alger 1",PackageType.getOne(1l)).Create();
			new Etudiant("user", "user", Universite.getOne(1l)).Create();
			new Etudiant("Etudiant 01", "password01", Universite.getOne(1l)).Create();
			new Etudiant("Etudiant 02", "password02", Universite.getOne(1l)).Create();
			new Etudiant("Etudiant 03", "password03", Universite.getOne(1l)).Create();
			Etudiant e1 = Etudiant.getOne(1l);
			e1.takeBookFromLibrary(Book.getOne(1l));
			e1.takeBookFromLibrary(Book.getOne(2l));
			System.out.println("not exist");
		}

		//----------------------------------------------
		
		Etudiant e = Etudiant.login("user", "user");
		if(e != null) {
			System.out.println("login is ok");
			System.out.println(e.getName());
			
			List<Book> lb = e.getMyBooksNotExpire();
			for (Book book : lb) {
				System.out.println("********** : "+book.getId()+" : ********** "+book.getName());
			}
			
			List<Object> lo = e.getMyBooksNotExpireAllInfo();
			print(lo);
			    
		}else {
			System.out.println("name or password is error");
		}
		
	}
}
