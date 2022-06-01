/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Main.GUI;
import Main.Controller.DataProduk;
import Main.Controller.Koneksi;
import Main.Controller.UserSession;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Pesan extends JFrame{
    Koneksi koneksi = new Koneksi();
	ResultSet resultSet;
	Statement statement;

	DataProduk produk;
	List<DataProduk> produks=new ArrayList<>();

	boolean pesan = false;

	JFrame window	 = new JFrame("PESAN BUKU");
	JLabel lBuku	 = new JLabel("Buku");
	JComboBox<Object> cBuku	 = new JComboBox<>();
	JLabel lJmlh	 = new JLabel("Jumlah");
	JTextField fjmlh = new JTextField();
	JButton bPesan	 = new JButton("Pesan");
	JButton bKembali = new JButton("Kembali");

	public Pesan(){
		if(UserSession.getId_user() == null){
			JOptionPane.showMessageDialog(null, "Silahkan login terlebih dahulu!", "Peringatan", JOptionPane.WARNING_MESSAGE);
			window.setVisible(false);
			new Login();
		}else {
			initComponents();
			initListeners();
			loadBuku();
		}
	}

	private void initComponents() {
		window.getContentPane().setBackground(new Color(28, 27, 27));

		window.add(lBuku);
		lBuku.setBounds(50,25,120,25);
		lBuku.setForeground(new Color(255, 255, 255));
			window.add(cBuku);
			cBuku.setBounds(110,25,210,25);

		window.add(lJmlh);
		lJmlh.setBounds(50,60,120,25);
		lJmlh.setForeground(new Color(255, 255, 255));
			window.add(fjmlh);
			fjmlh.setBounds(110,60,210,25);

		window.add(bPesan);
		bPesan.setBounds(110,100,115,25);
		bPesan.setForeground(new Color(255,255,255));
		bPesan.setBackground(new Color(58, 133, 86));

		window.add(bKembali);
		bKembali.setBounds(230,100,90,25);
		bKembali.setForeground(new Color(255,255,255));
		bKembali.setBackground(new Color(145, 141, 58));

		window.setLayout(null);
		window.setSize(390, 200);
		window.setVisible(true);
		window.setLocationRelativeTo(null);
		window.setResizable(false);
	}
	
	private void initListeners(){
		DataProduk produk = new DataProduk();
		TabelProduk tabelProduk = new TabelProduk();
		bPesan.addActionListener(e -> {
			produk.setHarga(produks.get(cBuku.getSelectedIndex()).getHarga());
			produk.setStok(produks.get(cBuku.getSelectedIndex()).getStok());
			DataProduk.setTotal(produks.get(cBuku.getSelectedIndex()).getHarga() * Integer.parseInt(fjmlh.getText()));

			pesanBuku(produks.get(cBuku.getSelectedIndex()).getIdBuku(), fjmlh.getText());
			if (pesan = true) {
				window.setVisible(false);
				JOptionPane.showMessageDialog(null, "Berhasil Memesan!");
				int result = JOptionPane.showConfirmDialog(null, "Ingin Memesan Lagi?", "INFO", JOptionPane.YES_NO_OPTION);
				if (result == JOptionPane.YES_OPTION) {
					tabelProduk.window.setVisible(false);
					window.setVisible(false);
					new Pesan();
				} else {
					int result2 = JOptionPane.showConfirmDialog(null, "Ingin Membayar?", "INFO", JOptionPane.YES_NO_OPTION);
					if (result2 == JOptionPane.YES_OPTION) {
						tabelProduk.window.setVisible(false);
						window.setVisible(false);
						new Bayar();
					} else {
						tabelProduk.window.setVisible(false);
						window.setVisible(false);
						new MenuUtama();
					}
				}
			} else {
				JOptionPane.showMessageDialog(null, "gagal Memesan!");
			}

		});

		bKembali.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				tabelProduk.window.setVisible(false);
				window.setVisible(false);
				new MenuUtama();
			}
		});
	}


	private void pesanBuku(String vid_buku, String vjumlah){
		int jumlah = Integer.parseInt(vjumlah);
		String kode;
		kurangStok(vid_buku,jumlah);
		try{
			if(UserSession.getIdPemesanan() == null) {
				statement = koneksi.getConnection().createStatement();
				String sqlMax = "SELECT max(id_pemesanan) as max_kode FROM pemesanan";
				resultSet = statement.executeQuery(sqlMax);
				if (resultSet.next()) {
					String kode_pmsn = resultSet.getString("max_kode");
					if(kode_pmsn == null ){
						kode = "PMSN-001";
						UserSession.setIdPemesanan(kode);
					}else {
						String kode_pmsn_bersih = kode_pmsn.substring(5, 8);
						int no_urut = Integer.parseInt(kode_pmsn_bersih);
						no_urut += 1;

						String pmsn = "PMSN-";
						kode = pmsn + String.format("%03d", no_urut);

						UserSession.setIdPemesanan(kode);
					}
					statement.executeUpdate("INSERT INTO pemesanan VALUES('" + kode + "','" + UserSession.getId_user() + "','" + vid_buku + "','" + jumlah + "')");
					statement.executeUpdate("UPDATE produk set stok='"+kurangStok(vid_buku,jumlah)+"' WHERE id_buku='"+vid_buku+"'");
					pesan = true;
				}
			}else{
				statement.executeUpdate("INSERT INTO pemesanan VALUES('" + UserSession.getIdPemesanan() + "','" + UserSession.getId_user() + "','" + vid_buku + "','" + jumlah + "')");
				pesan = true;
			}
			resultSet.close();

		}catch (SQLException sqlError) {
			JOptionPane.showMessageDialog(rootPane, "Data Gagal Ditampilkan" + sqlError);
		} catch (ClassNotFoundException classError) {
			JOptionPane.showMessageDialog(rootPane, "Driver tidak ditemukan !!");
		}catch (NumberFormatException e){
			System.err.println("error"+e);
		}
	}

	private int kurangStok(String vid, int vjumlah){
		int stok = 0;
		try{
			statement = koneksi.getConnection().createStatement();
			String query = "SELECT * FROM produk WHERE id_buku='"+ vid +"'";
			resultSet = statement.executeQuery(query);
			resultSet.next();
			stok = resultSet.getInt("stok");
			stok -= vjumlah;
		}catch (SQLException sqlError) {
			JOptionPane.showMessageDialog(rootPane, "Data Gagal Ditampilkan" + sqlError);
		} catch (ClassNotFoundException classError) {
			JOptionPane.showMessageDialog(rootPane, "Driver tidak ditemukan !!");
		}catch (NumberFormatException e){
			System.err.println("error"+e);
		}
		return stok;
	}

	private List<DataProduk> getAllProduk() {
		try {
			statement = koneksi.getConnection().createStatement();
			String sql = "SELECT * FROM produk";
			resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
				produk = new DataProduk();
				produk.setIdBuku(resultSet.getString("id_buku"));
				produk.setNamaBuku(resultSet.getString("nama_buku"));
				produk.setHarga(resultSet.getInt("harga"));
				produk.setStok(resultSet.getInt("stok"));
				produks.add(produk);
			}
		} catch (SQLException sqlError) {
			JOptionPane.showMessageDialog(rootPane, "Data Gagal Ditampilkan" + sqlError);
		} catch (ClassNotFoundException classError) {
			JOptionPane.showMessageDialog(rootPane, "Driver tidak ditemukan !!");
		}
		return produks;
	}

	private void loadBuku() {
		cBuku.removeAllItems();
		List<DataProduk> produks = getAllProduk();
		for (DataProduk data : produks) {
			cBuku.addItem(data.getNamaBuku().toString());
		}
	}
}
