/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Main.Controller;


public class DataProduk {
        private String idBuku, namaBuku;
	private int stok, harga;
	private static int total;
        
        public String getIdBuku(){ return idBuku;}
	public String getNamaBuku(){
			return namaBuku;
	}
	public int getHarga(){ return harga; }
	public int getStok(){
			return stok;
	}

	public void setIdBuku(String vidBuku){ idBuku = vidBuku;}
	public void setNamaBuku(String vnamaBuku){
			namaBuku = vnamaBuku;
	}
	public void setHarga(int vHarga){
			harga = vHarga;
	}
	public void setStok(int vstok){ stok = vstok; }

	public static int getTotal(){ return total;}
	public static void setTotal(int vtotal){total += vtotal;}
}
