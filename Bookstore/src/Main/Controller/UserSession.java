
package Main.Controller;

public class UserSession {
    private static String id_user, nama, idPemesanan;
	private static int role;

	public static String getId_user(){
			return id_user;
	}
	public static void setId_user(String vid_user){
			id_user = vid_user;
	}

	public static String getNama(){
			return nama;
	}

	public static void setNama(String vnama) {
			nama = vnama;
	}

	public static int getRole(){
			return role;
	}
	public static void setRole(int vrole){
			role = vrole;
	}

	public static String getIdPemesanan(){return idPemesanan;}
	public static void setIdPemesanan(String vidPemesanan){ idPemesanan = vidPemesanan;}
}
