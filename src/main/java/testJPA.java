
import java.util.List;

import com.google.gson.Gson;

import model.DB;
import model.entities.*;

public class testJPA {
	public static void main(String[] args) {
		DB.init();
		//----------------------------------------------
		
		Etudiant e = Etudiant.login("etudiant010", "password01");
		if(e != null) {
			System.out.println("login is ok");
			System.out.println(e.getName());
			
			List<Book> lb = e.getMyBooksNotExpire();
			for (Book book : lb) {
				System.out.println("********** : "+book.getId()+" : ********** "+book.getName());
			}
			
			for (Object o : e.getMyBooksNotExpireAllInfo()) {
				System.out.println(new Gson().toJson(o));	
			}
			    
		}else {
			System.out.println("name or password is error");
		}
		//
		List <Etudiant> le =Etudiant.search("");
		for (Etudiant etudiant : le) {
			System.out.println(etudiant.getName());
		}	
	}
}
