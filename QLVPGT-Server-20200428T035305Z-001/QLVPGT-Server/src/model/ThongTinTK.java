package model;

import java.io.Serializable;

public class ThongTinTK implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String taiKhoan,tenCanBo;
	private Integer maCanBo,maDonVi;
	private String tenDonVi;
	private String[] quyen;
	
	public ThongTinTK(String taiKhoan, String tenCanBo,Integer maCanBo,Integer maDonVi, String tenDonVi, String quyen) {
		this.taiKhoan=taiKhoan;
		this.tenCanBo=tenCanBo;
		this.maCanBo=maCanBo;
		this.maDonVi=maDonVi;
		this.tenDonVi=tenDonVi;
		this.quyen=quyen.split(" ");
		
	}
	
	public boolean checkQuyen(String role) {
		for(String q: quyen) {
			if(role.equals(q)) return true;
		}
		return false;
	}

	public String getTaiKhoan() {
		return taiKhoan;
	}

	public String getTenCanBo() {
		return tenCanBo;
	}

	public Integer getMaCanBo() {
		return maCanBo;
	}

	public String[] getQuyen() {
		return quyen;
	}

	public Integer getMaDonVi() {
		return maDonVi;
	}

	public String getTenDonVi() {
		return tenDonVi;
	}
	
	

	
}
