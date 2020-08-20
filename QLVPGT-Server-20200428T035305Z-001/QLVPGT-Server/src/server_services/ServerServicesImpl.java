package server_services;

import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Pattern;

import client_services.CallBackHandler;
import model.ItemBienBan;
import model.ItemBienLai;
import model.ItemCanBo;
import model.ItemCoSoLuuTru;
import model.ItemDiem;
import model.ItemDieuLuat;
import model.ItemDonVi;
import model.ItemKhoan;
import model.ItemKhuVuc;
import model.ItemNguoiViPham;
import model.ItemQueQuan;
import model.ItemQuyetDinh;
import model.ItemTangVat;
import model.ItemThongKe;
import model.ItemXuPhat;
import model.PagingWrapper;
import model.ThongTinTK;
import server_configure.TaskManager;
import sql_services.MySQLConnectionTemplate;

public class ServerServicesImpl  extends UnicastRemoteObject implements ServerServices{
	 Logger logger  = Logger.getLogger( ServerServicesImpl.class.getName()); 
	 Pattern p = Pattern.compile("[$&+,:;=?@#|'<>.^*()%!-]",Pattern.CASE_INSENSITIVE);
	 Pattern p2 = Pattern.compile("^\\d+$",Pattern.CASE_INSENSITIVE);
	 
	 
	 
    		
	public ServerServicesImpl() throws RemoteException {
		super();
		// TODO Auto-generated constructor stub
	}
	
	private boolean checkInputMaQueQuan(Integer ma_que_quan) throws ClassNotFoundException, SQLException {
		if(ma_que_quan==null) return false;
		
		Connection con=MySQLConnectionTemplate.getConnection();
		PreparedStatement st=con.prepareStatement("SELECT maQueQuan from quequan WHERE maQueQuan= ?;" );
		st.setInt(1, ma_que_quan);
		ResultSet rs=st.executeQuery();
		
		
		if(!rs.next()) {con.close();return false;}
		{con.close();return true;}
	}
	
	private boolean checkInputMaDonVi(Integer ma_don_vi) throws ClassNotFoundException, SQLException {
		if(ma_don_vi==null) return false;
		
		Connection con=MySQLConnectionTemplate.getConnection();
		PreparedStatement st=con.prepareStatement("SELECT maDonVi from donvi WHERE maDonVi= ?;" );
		st.setInt(1, ma_don_vi);
		ResultSet rs=st.executeQuery();
		
		
		
		if(!rs.next()) {con.close();return false;}
		{con.close();return true;}

	}
	
	private boolean checkInputSoQDXPHC(Integer so_qdxphc)throws ClassNotFoundException, SQLException {
		if(so_qdxphc==null) return false;
		
		Connection con=MySQLConnectionTemplate.getConnection();
		PreparedStatement st=con.prepareStatement("SELECT soQDXPHC from qdxphc WHERE soQDXPHC= ?;" );
		st.setInt(1, so_qdxphc);
		ResultSet rs=st.executeQuery();
		
		
		
		if(!rs.next()) {con.close();return false;}
		{con.close();return true;}

	}
	
	private boolean checkInputSoBBVPHC(Integer so_bbvphc)throws ClassNotFoundException, SQLException {
		if(so_bbvphc==null) return false;
		
		Connection con=MySQLConnectionTemplate.getConnection();
		PreparedStatement st=con.prepareStatement("SELECT soBBVPHC from bbvphc WHERE soBBVPHC= ?;" );
		st.setInt(1, so_bbvphc);
		ResultSet rs=st.executeQuery();
		
		
		
		if(!rs.next()) {con.close();return false;}
		{con.close();return true;}

	}
	
	private boolean checkInputCoSoLuuTru(Integer ma_co_so)throws ClassNotFoundException, SQLException {
		if(ma_co_so==null) return false;
		
		Connection con=MySQLConnectionTemplate.getConnection();
		PreparedStatement st=con.prepareStatement("SELECT maCoSo from cosoluutrutangvat WHERE maCoSo= ?;" );
		st.setInt(1,ma_co_so);
		ResultSet rs=st.executeQuery();
		
		
		
		if(!rs.next()) {con.close();return false;}
		{con.close();return true;}

	}
	
	private boolean checkInputNguoiViPham(String cmnd_nvp)throws ClassNotFoundException, SQLException {
		if(cmnd_nvp==null) return false;
		Connection con=MySQLConnectionTemplate.getConnection();
		PreparedStatement st=con.prepareStatement("SELECT soCMND from nguoivipham WHERE soCMND= ?;" );
		st.setString(1,cmnd_nvp);
		ResultSet rs=st.executeQuery();
		
		
		
		if(!rs.next()) {con.close();return false;}
		{con.close();return true;}

	}
	
	private boolean checkInputCanBo(Integer ma_can_bo)throws ClassNotFoundException, SQLException {
		if(ma_can_bo==null) return false;
		
		Connection con=MySQLConnectionTemplate.getConnection();
		PreparedStatement st=con.prepareStatement("SELECT maCanBo from canbo WHERE maCanBo= ?;" );
		st.setInt(1,ma_can_bo);
		ResultSet rs=st.executeQuery();
		
		
		
		if(!rs.next()) {con.close();return false;}
		{con.close();return true;}

	}
	
	
	private boolean checkInputTangVat(Integer ma_tang_vat)throws ClassNotFoundException, SQLException {
		if(ma_tang_vat==null) return false;
		
		Connection con=MySQLConnectionTemplate.getConnection();
		PreparedStatement st=con.prepareStatement("SELECT maTangVat from tangvat WHERE maTangVat= ?;" );
		st.setInt(1,ma_tang_vat);
		ResultSet rs=st.executeQuery();
		
		
		
		if(!rs.next()) {con.close();return false;}
		{con.close();return true;}

	}
	
	private boolean checkInputBienLai(Integer ma_bien_lai)throws ClassNotFoundException, SQLException {
		if(ma_bien_lai==null) return false;
		
		Connection con=MySQLConnectionTemplate.getConnection();
		PreparedStatement st=con.prepareStatement("SELECT maBienLai FROM bienlainopphat WHERE maBienLai= ?;" );
		st.setInt(1,ma_bien_lai);
		ResultSet rs=st.executeQuery();
		
		
		
		if(!rs.next()) {con.close();return false;}
		{con.close();return true;}

	}
	
	@Override
	public void findQueQuan(String reg_name,CallBackHandler handler) throws RemoteException{
		// TODO Auto-generated method stub
		if(reg_name==null||handler==null) return;
		TaskManager.addTask(new Task()
		{
			
			public void toDo() throws RemoteException{
				try {
					Connection con=MySQLConnectionTemplate.getConnection();
					CallableStatement stmt = con.prepareCall("{CALL TimKiemQueQuanTheoTenVung(?)}");
					stmt.setString(1,reg_name);
					ResultSet rs = stmt.executeQuery();
					
					ArrayList<ItemQueQuan> que_quan_list=new ArrayList<ItemQueQuan>();
					while(rs.next()) {
						que_quan_list.add(new ItemQueQuan(rs.getInt("maQueQuan"),rs.getString("tenQueQuan")));
					}
					logger.log(Level.SEVERE,"Truy vấn findQueQuan() {0} ItemQueQuan",que_quan_list.size());
					handler.callBack(que_quan_list);
					
					con.close();
					
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					logger.log(Level.WARNING,"Request không hợp lệ");
					handler.errorCallBack("SERVER: Lỗi SQL");
					e.printStackTrace();
				}
			}});
		
		
	}

	@Override
	public void findDonVi(String reg_name,CallBackHandler handler) throws RemoteException {
		// TODO Auto-generated method stub
		if(reg_name==null||handler==null) return;
		TaskManager.addTask(new Task()
		{
			
			public void toDo() throws RemoteException{
				try {
					Connection con=MySQLConnectionTemplate.getConnection();
					CallableStatement stmt = con.prepareCall("{CALL TimKiemDonViTheoTenDonVi(?)}");
					stmt.setString(1,reg_name);
					ResultSet rs = stmt.executeQuery();
					
					ArrayList<ItemDonVi> don_vi_list=new ArrayList<ItemDonVi>();
					while(rs.next()) {
						don_vi_list.add(new ItemDonVi
						(
							rs.getInt("maDonVi"),
							rs.getInt("maKhuVuc"),
							rs.getString("tenDonVi"),
							rs.getString("tenKhuVuc"),
							rs.getString("ghiChu")
						));
						
								
					}
					logger.log(Level.SEVERE,"Truy vấn findDonVi() {0} ItemDonVi",don_vi_list.size());
					handler.callBack(don_vi_list);
					
					con.close();
					
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					logger.log(Level.WARNING,"Request không hợp lệ");
					handler.errorCallBack("SERVER: Lỗi SQL");
					e.printStackTrace();
				}
		}});
	}

	@Override
	public void addCanBo(String so_cmnd, String ho_ten, Date ngay_sinh, String chuc_vu, Integer ma_que_quan,
			Integer ma_don_vi, String ghi_chu,CallBackHandler handler) throws RemoteException{
		// TODO Auto-generated method stub
		//Check input
		
		
		if(handler==null) return;
		boolean check=true;
		if(so_cmnd==null||ho_ten==null||ngay_sinh==null||chuc_vu==null||ma_que_quan==null||ma_don_vi==null) check=false;
		if((so_cmnd.length()!=9&&so_cmnd.length()!=12)||!p2.matcher(so_cmnd).find()||p.matcher(chuc_vu).find()||p.matcher(ho_ten).find()) check=false;
		if(ngay_sinh.getTime()>Date.valueOf(LocalDate.now()).getTime()) check=false;
		if(!check) {
			handler.errorCallBack("SERVER: Dữ liệu không hợp lệ");
			logger.log(Level.WARNING,"Request không hợp lệ");
			return;
		}
		
		TaskManager.addTask(new Task()
		{
			
			public void toDo() throws RemoteException{
		
				try {
					if(!checkInputMaQueQuan(ma_que_quan)) {
						logger.log(Level.WARNING,"Request không hợp lệ");
						handler.errorCallBack("SERVER: Mã quên quán không tồn tại");
						return;
					}
					
					if(!checkInputMaDonVi(ma_don_vi)) {
						logger.log(Level.WARNING,"Request không hợp lệ");
						handler.errorCallBack("SERVER: Mã đơn vị không tồn tại");
						return;
					}
					Connection con=MySQLConnectionTemplate.getConnection();
					PreparedStatement st=con.prepareStatement("SELECT soCMND FROM canbo WHERE soCMND=?");
					st.setString(1,so_cmnd);
					if(st.executeQuery().next()) {
						logger.log(Level.WARNING,"Request không hợp lệ");
						handler.errorCallBack("SERVER: Đã có 1 cán bộ với số CMND này rồi");
						return;
					}
					
					con.close();
					
							
					con=MySQLConnectionTemplate.getConnection();
					CallableStatement stmt = con.prepareCall("{CALL ThemCanBo(?,?,?,?,?,?,?)}");
					stmt.setString("so_cmnd",so_cmnd);
					stmt.setString("ho_ten",ho_ten);
					stmt.setDate("ngay_sinh",ngay_sinh);
					stmt.setString("chuc_vu",chuc_vu);
					stmt.setInt("ma_que_quan",ma_que_quan);
					stmt.setInt("ma_don_vi",ma_don_vi);
					stmt.setString("ghi_chu",ghi_chu);
					
					int rs = stmt.executeUpdate();
					logger.log(Level.SEVERE,"Thêm dữ liệu addCanBo() kết quả: {0}",rs);
					
					if(rs==-1) {
						handler.errorCallBack("SERVER: Thêm dữ liệu thất bại");
					}
					else {
						handler.callBack(rs);
					}
					
					con.close();
					
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					logger.log(Level.WARNING,"Request không hợp lệ");
					handler.errorCallBack("SERVER: Lỗi SQL");
					e.printStackTrace();
				}
			}});
		
	}

	@Override
	public void modifyCanBo(Integer ma_can_bo, String so_cmnd, String ho_ten, Date ngay_sinh, String chuc_vu,
			Integer ma_que_quan, Integer ma_don_vi,String ghi_chu, CallBackHandler handler) throws RemoteException {
		if(handler==null) return;
		boolean check=true;
		if(ma_can_bo==null||so_cmnd==null||ho_ten==null||ngay_sinh==null||chuc_vu==null||ma_que_quan==null||ma_don_vi==null) check=false;
		if((so_cmnd.length()!=9&&so_cmnd.length()!=12)||!p2.matcher(so_cmnd).find()||p.matcher(chuc_vu).find()||p.matcher(ho_ten).find()) check=false;
		if(ngay_sinh.getTime()>Date.valueOf(LocalDate.now()).getTime()) check=false;
		
		if(!check) {
			handler.errorCallBack("SERVER: Dữ liệu không hợp lệ");
			logger.log(Level.WARNING,"Request không hợp lệ");
			return;
		}
		
		TaskManager.addTask(new Task()
		{
			
			public void toDo() throws RemoteException{
				
				try {
					
					if(!checkInputCanBo(ma_can_bo)) {
						logger.log(Level.WARNING,"Request không hợp lệ");
						handler.errorCallBack("SERVER: Mã cán bộ không tồn tại");
						return;
					}
					
		
					
					if(!checkInputMaQueQuan(ma_que_quan)) {
						logger.log(Level.WARNING,"Request không hợp lệ");
						handler.errorCallBack("SERVER: Mã quên quán không tồn tại");
						return;
					}
					
					if(!checkInputMaDonVi(ma_don_vi)) {
						logger.log(Level.WARNING,"Request không hợp lệ");
						handler.errorCallBack("SERVER: Mã đơn vị không tồn tại");
						return;
					}
					
					Connection con=MySQLConnectionTemplate.getConnection();
					PreparedStatement st=con.prepareStatement("SELECT soCMND FROM canbo WHERE soCMND=? AND maCanBo!=?");
					st.setString(1,so_cmnd);
					st.setInt(2,ma_can_bo);
					if(st.executeQuery().next()) {
						logger.log(Level.WARNING,"Request không hợp lệ");
						handler.errorCallBack("SERVER: Đã có 1 cán bộ với số CMND này rồi");
						return;
					}
					
					
					con.close();
					
					con=MySQLConnectionTemplate.getConnection();
					CallableStatement stmt = con.prepareCall("{CALL HieuChinhCanBo(?,?,?,?,?,?,?,?)}");
					stmt.setInt("ma_can_bo",ma_can_bo);
					stmt.setString("so_cmnd",so_cmnd);
					stmt.setString("ho_ten",ho_ten);
					stmt.setDate("ngay_sinh",ngay_sinh);
					stmt.setString("chuc_vu",chuc_vu);
					stmt.setInt("ma_que_quan",ma_que_quan);
					stmt.setInt("ma_don_vi",ma_don_vi);
					stmt.setString("ghi_chu",ghi_chu);
					
					int rs = stmt.executeUpdate();
					
					logger.log(Level.SEVERE,"Hiệu chỉnh modiftCanBo() kết quả: {0}",rs);
					
					if(rs==-1||rs==0) {
						handler.errorCallBack("SERVER: Cập nhật dữ liệu thất bại");
					}
					else {
						handler.callBack(rs);
					}
					
					con.close();
					
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					logger.log(Level.WARNING,"Request không hợp lệ");
					handler.errorCallBack("SERVER: Lỗi SQL");
					e.printStackTrace();
				}
			}});
	}

	@Override
	public void findCanBo(String reg_name,Integer page_offset, CallBackHandler handler) throws RemoteException {
		// TODO Auto-generated method stub
		if(handler==null||reg_name==null||page_offset==null||page_offset<0) return;
		
		
		TaskManager.addTask(new Task()
		{
			
			public void toDo() throws RemoteException{
				try {
					Connection con=MySQLConnectionTemplate.getConnection();
					CallableStatement stmt = con.prepareCall("{CALL TimKiemCanBoTheoTenCanBo(?,?,?)}");
					stmt.setString(1,reg_name);
					stmt.setInt(2,page_offset);
					stmt.registerOutParameter(3, java.sql.Types.INTEGER);
					ResultSet rs = stmt.executeQuery();
					
					Integer total=stmt.getInt(3);
					
					
					ArrayList<ItemCanBo> can_bo_list=new ArrayList<ItemCanBo>();
					while(rs.next()) {
						can_bo_list.add(
								new ItemCanBo(
										rs.getInt("maCanBo"),
										rs.getInt("maQueQuan"),
										rs.getInt("maDonVi"),
										rs.getString("tenQueQuan"),
										rs.getString("tenDonVi"),
										rs.getString("soCMND"),
										rs.getString("hoTen"),
										rs.getString("chucVu"),
										rs.getString("ghiChu"),
										rs.getDate("ngaySinh")
								)
						);
					}
					logger.log(Level.SEVERE,"Truy vấn findCanBo() {0} ItemCanBo",can_bo_list.size());
					handler.callBack(new PagingWrapper<ArrayList<ItemCanBo>>(can_bo_list,total));
					
					con.close();
					
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					logger.log(Level.WARNING,"Request không hợp lệ");
					handler.errorCallBack("SERVER: Lỗi SQL");
					e.printStackTrace();
				}
			};
		
		
		});
		
	}

	@Override
	public void addNguoiViPham(String so_cmnd, String ho_ten, Date ngay_sinh, String dia_chi, String so_dien_thoai,CallBackHandler handler)
			throws RemoteException {
		// TODO Auto-generated method stub
		if(handler==null) return;
		boolean check=true;
		if(so_cmnd==null||ho_ten==null||ngay_sinh==null||dia_chi==null||so_dien_thoai==null) check=false;
		if((so_cmnd.length()!=9&&so_cmnd.length()!=12)||!p2.matcher(so_cmnd).find()
		||p.matcher(ho_ten).find()||!p2.matcher(so_dien_thoai).find()) check=false;
		if(ngay_sinh.getTime()>Date.valueOf(LocalDate.now()).getTime()) check=false;
		if(!check) {
			handler.errorCallBack("SERVER: Dữ liệu không hợp lệ");
			logger.log(Level.WARNING,"Request không hợp lệ");
			return;
		}
		TaskManager.addTask(new Task()
		{
			
			public void toDo() throws RemoteException{
				try {
					
					if(checkInputNguoiViPham(so_cmnd)) 
					{
						logger.log(Level.WARNING,"Request không hợp lệ");
						handler.errorCallBack("SERVER: Số CMND đã tồn tại");
						return;
					}
					
					
					
					
					Connection con=MySQLConnectionTemplate.getConnection();
					CallableStatement stmt = con.prepareCall("{CALL CapNhatNguoiViPham(?,?,?,?,?,?)}");
					stmt.setBoolean("nguoi_vi_pham_moi",true);
					stmt.setString("so_cmnd",so_cmnd);
					stmt.setString("ho_ten",ho_ten);
					stmt.setDate("ngay_sinh",ngay_sinh);
					stmt.setString("dia_chi", dia_chi);
					stmt.setString("so_dien_thoai",so_dien_thoai);
				
					int rs = stmt.executeUpdate();
					
					logger.log(Level.SEVERE,"Thêm dữ liệu addNguoiViPham() kết quả: {0}",rs);
					
					if(rs==-1) {
						handler.errorCallBack("SERVER: Thêm dữ liệu thất bại");
					}
					else {
						handler.callBack(rs);
					}
					
					con.close();
					
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					logger.log(Level.WARNING,"Request không hợp lệ");
					handler.errorCallBack("SERVER: Lỗi SQL");
					e.printStackTrace();
				}
			}});
	}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	@Override
	public void modifyNguoiViPham(String so_cmnd, String ho_ten, Date ngay_sinh, String dia_chi, String so_dien_thoai,CallBackHandler handler)
			throws RemoteException {
		boolean check=true;
		if(handler==null) return;
		if(so_cmnd==null||ho_ten==null||ngay_sinh==null||dia_chi==null||so_dien_thoai==null) check=false;
		if(ngay_sinh.getTime()>Date.valueOf(LocalDate.now()).getTime()) check=false;
		if((so_cmnd.length()!=9&&so_cmnd.length()!=12)||!p2.matcher(so_cmnd).find()
				||p.matcher(ho_ten).find()||!p2.matcher(so_dien_thoai).find()) check=false;
		
		if(!check) {
			handler.errorCallBack("SERVER: Dữ liệu không hợp lệ");
			logger.log(Level.WARNING,"Request không hợp lệ");
			return;
		}
		
		TaskManager.addTask(new Task()
		{
			
			public void toDo() throws RemoteException{
				try {
					if(!checkInputNguoiViPham(so_cmnd)) 
					{
						logger.log(Level.WARNING,"Request không hợp lệ");
						handler.errorCallBack("SERVER: Số CMND không tồn tại");
						return;
					}
					
					
					Connection con=MySQLConnectionTemplate.getConnection();
					CallableStatement stmt = con.prepareCall("{CALL CapNhatNguoiViPham(?,?,?,?,?,?)}");
					stmt.setBoolean("nguoi_vi_pham_moi",false);
					stmt.setString("so_cmnd",so_cmnd);
					stmt.setString("ho_ten",ho_ten);
					stmt.setDate("ngay_sinh",ngay_sinh);
					stmt.setString("dia_chi", dia_chi);
					stmt.setString("so_dien_thoai",so_dien_thoai);
				
					int rs = stmt.executeUpdate();
					logger.log(Level.SEVERE,"Hiệu chỉnh modifyNguoiViPham() kết quả: {0}",rs);
					
					
				
					if(rs==-1||rs==0) {
						handler.errorCallBack("SERVER: Cập nhật dữ liệu thất bại");
					}
					else {
						handler.callBack(rs);
					}
					
					con.close();
					
					
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}});
	}

	@Override
	public void findNguoiViPhamTheoCMND(String cmnd,Integer page_offset,CallBackHandler handler) throws RemoteException {
		// TODO Auto-generated method stub
		if(handler==null||cmnd==null||page_offset==null||page_offset<0) return;
		
		TaskManager.addTask(new Task()
		{
			
			public void toDo() throws RemoteException{
				try {
					Connection con=MySQLConnectionTemplate.getConnection();
					CallableStatement stmt = con.prepareCall("{CALL TimKiemNguoiViPhamTheoCMND(?,?,?)}");
					stmt.setString(1, cmnd);
					stmt.setInt(2,page_offset);
					stmt.registerOutParameter(3, java.sql.Types.INTEGER);
					ResultSet rs = stmt.executeQuery();
					
					Integer total=stmt.getInt(3);
					
					ArrayList<ItemNguoiViPham> nguoi_vi_pham_list=new ArrayList<ItemNguoiViPham>();
					while(rs.next()) {
						nguoi_vi_pham_list.add(
								new ItemNguoiViPham(
									rs.getString("soCMND"),
									rs.getString("hoTen"),
									rs.getDate("ngaySinh"),
									rs.getString("diaChi"),
									rs.getString("sdt")
								)
						);
					}
					
				
					logger.log(Level.SEVERE,"Truy vấn findNguoiViPhamTheoCMND() {0} ItemNguoiViPham",nguoi_vi_pham_list.size());
					handler.callBack(new PagingWrapper<ArrayList<ItemNguoiViPham>>(nguoi_vi_pham_list,total));
					
					
					con.close();
					
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					logger.log(Level.WARNING,"Request không hợp lệ");
					handler.errorCallBack("SERVER: Lỗi SQL");
					e.printStackTrace();
				}
			}});
		
	}

	@Override
	public void findNguoiViPhamTheoHoTen(String ho_ten, CallBackHandler handler) throws RemoteException {
		// TODO Auto-generated method stub
		if(handler==null||ho_ten==null) return;
		TaskManager.addTask(new Task()
		{
			
			public void toDo() throws RemoteException{
				try {
					Connection con=MySQLConnectionTemplate.getConnection();
					CallableStatement stmt = con.prepareCall("{CALL TimKiemNguoiViPhamTheoTen(?)}");
					stmt.setString(1, ho_ten);
					
					ResultSet rs = stmt.executeQuery();
					ArrayList<ItemNguoiViPham> nguoi_vi_pham_list=new ArrayList<ItemNguoiViPham>();
					while(rs.next()) {
						nguoi_vi_pham_list.add(
								new ItemNguoiViPham(
									rs.getString("soCMND"),
									rs.getString("hoTen"),
									rs.getDate("ngaySinh"),
									rs.getString("diaChi"),
									rs.getString("sdt")
								)
						);
					}
					
				
					logger.log(Level.SEVERE,"Truy vấn findNguoiViPhamTheoHoTen() {0} ItemNguoiViPham",nguoi_vi_pham_list.size());
					handler.callBack(nguoi_vi_pham_list);
					
					con.close();
					
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					logger.log(Level.WARNING,"Request không hợp lệ");
					handler.errorCallBack("SERVER: Lỗi SQL");
					e.printStackTrace();
				}
			}});
	}

	@Override
	public void addTangVatBBVPHC(Integer so_bbvphc, String ten_tang_vat, Integer so_luong, String trang_thai,
			Integer co_so_luu_tru, String ghi_chu, CallBackHandler handler) throws RemoteException {
		// TODO Auto-generated method stub
		boolean check=true;
		if(handler==null) return;
		if(so_bbvphc==null||ten_tang_vat==null||so_luong==null||trang_thai==null||co_so_luu_tru==null||
		p.matcher(ten_tang_vat).find()||p.matcher(trang_thai).find()||so_luong<0) check=false;
	
		if(!check) {
			handler.errorCallBack("SERVER: Dữ liệu không hợp lệ");
			logger.log(Level.WARNING,"Request không hợp lệ");
			return;
		}
		
		TaskManager.addTask(new Task()
		{
			
			public void toDo() throws RemoteException{
				try {
					if(!checkInputSoBBVPHC(so_bbvphc)) {
						logger.log(Level.WARNING,"Request không hợp lệ");
						handler.errorCallBack("SERVER: Số BBVPHC không tồn tại");
						return;
					}
					if(!checkInputCoSoLuuTru(co_so_luu_tru)) {
						logger.log(Level.WARNING,"Request không hợp lệ");
						handler.errorCallBack("SERVER: Mã cơ sở lưu trữ không tồn tại");
						return;
					}
					Connection con=MySQLConnectionTemplate.getConnection();
					CallableStatement stmt = con.prepareCall("{CALL ThemTangVatBBVPHC(?,?,?,?,?,?)}");
					
				    stmt.setInt("so_bbvphc", so_bbvphc);
					stmt.setString("ten_tang_vat", ten_tang_vat);
					stmt.setInt("so_luong", so_luong);
					stmt.setString("trang_thai",trang_thai);
					stmt.setInt("co_so_luu_tru", co_so_luu_tru);
					stmt.setString("ghi_chu", ghi_chu);
					
					int rs = stmt.executeUpdate();
					logger.log(Level.SEVERE,"Thêm dữ liệu addTangVatBBVPHC() kết quả: {0}",rs);
					
					if(rs==-1) {
						handler.errorCallBack("SERVER: Thêm dữ liệu thất bại");
					}
					else {
						handler.callBack(rs);
					}
					con.close();
					
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					logger.log(Level.WARNING,"Request không hợp lệ");
					handler.errorCallBack("SERVER: Lỗi SQL");
					e.printStackTrace();
				}
			}});
	}

	@Override
	public void addTangVatQDXPHC(Integer so_qdxphc, String ten_tang_vat, Integer so_luong, String trang_thai,
			Integer co_so_luu_tru, String ghi_chu, CallBackHandler handler) throws RemoteException {
		boolean check=true;
		if(handler==null) return;
		if(so_qdxphc==null||ten_tang_vat==null||so_luong==null||trang_thai==null||co_so_luu_tru==null||
		p.matcher(ten_tang_vat).find()||p.matcher(trang_thai).find()||so_luong<0) check=false;
	
		if(!check) {
			handler.errorCallBack("SERVER: Dữ liệu không hợp lệ");
			logger.log(Level.WARNING,"Request không hợp lệ");
			return;
		}
		
		
		TaskManager.addTask(new Task()
		{
			
			public void toDo() throws RemoteException{
				
				try {
					if(!checkInputSoQDXPHC(so_qdxphc)) {
						logger.log(Level.WARNING,"Request không hợp lệ");
						handler.errorCallBack("SERVER: Số QDXPHC không tồn tại");
						return;
					}
					if(!checkInputCoSoLuuTru(co_so_luu_tru)) {
						logger.log(Level.WARNING,"Request không hợp lệ");
						handler.errorCallBack("SERVER: Mã cơ sở lưu trữ không tồn tại");
						return;
					}
					
					
					
					Connection con=MySQLConnectionTemplate.getConnection();
					
					
					CallableStatement st = con.prepareCall("SELECT * FROM bbvphc_qdxphc WHERE bbvphc_qdxphc.soQDXPHC=?");
					st.setInt(1, so_qdxphc);
					ResultSet rss=st.executeQuery();
					if(rss.next()) {
						logger.log(Level.WARNING,"Request không hợp lệ");
						handler.errorCallBack("SERVER: Không thể thêm tang vật cho quyết định dựa vào biên bản");
						return;
					}
					
					
					con.close();
							
					con=MySQLConnectionTemplate.getConnection();
					CallableStatement stmt = con.prepareCall("{CALL ThemTangVatQDXPHC(?,?,?,?,?,?)}");
					
				    stmt.setInt("so_qdxphc", so_qdxphc);
					stmt.setString("ten_tang_vat", ten_tang_vat);
					stmt.setInt("so_luong", so_luong);
					stmt.setString("trang_thai",trang_thai);
					stmt.setInt("co_so_luu_tru", co_so_luu_tru);
					stmt.setString("ghi_chu", ghi_chu);
					
					int rs = stmt.executeUpdate();
					
					logger.log(Level.SEVERE,"Thêm dữ liệu addTangVatQDXPHC() kết quả: {0}",rs);
					
					if(rs==-1) {
						handler.errorCallBack("SERVER: Thêm dữ liệu thất bại");
					}
					else {
						handler.callBack(rs);
					}
					con.close();
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					logger.log(Level.WARNING,"Request không hợp lệ");
					handler.errorCallBack("SERVER: Lỗi SQL");
					e.printStackTrace();
				}
			}});
		
	}

	@Override
	public void addBBVPHC(Integer ma_can_bo, Date ngay_lap, String so_cmnd, String mo_ta_hanh_vi,
			CallBackHandler handler) throws RemoteException {
		// TODO Auto-generated method stub
		boolean check =true;
		if(handler==null) return;
		if(ma_can_bo==null||ngay_lap==null||so_cmnd==null||mo_ta_hanh_vi==null) check=false;
		if(ngay_lap.getTime()>Date.valueOf(LocalDate.now()).getTime()) check=false;
		if(!p2.matcher(so_cmnd).find()) check=false;
		if(!check) {
			handler.errorCallBack("SERVER: Dữ liệu không hợp lệ");
			logger.log(Level.WARNING,"Request không hợp lệ");
			return;
		}
		
		TaskManager.addTask(new Task()
		{
			
			public void toDo() throws RemoteException{
				try {
					if(!checkInputCanBo(ma_can_bo)) {
						logger.log(Level.WARNING,"Request không hợp lệ");
						handler.errorCallBack("SERVER: Mã cán bộ không tồn tại");
						return;
					}
					if(!checkInputNguoiViPham(so_cmnd)) 
					{
						logger.log(Level.WARNING,"Request không hợp lệ");
						handler.errorCallBack("SERVER: Số CMND người vi phạm không tồn tại");
						return;
					}
					
					
					Connection con=MySQLConnectionTemplate.getConnection();
					CallableStatement stmt = con.prepareCall("{CALL ThemBBVPHC(?,?,?,?,?)}");
					
				    stmt.setInt("ma_can_bo", ma_can_bo);
					stmt.setDate("ngay_lap", ngay_lap);
					stmt.setString("so_cmnd", so_cmnd);
					stmt.setString("mo_ta_hanh_vi",mo_ta_hanh_vi);
					stmt.registerOutParameter("so_bbvphc", java.sql.Types.INTEGER);
					
					int rs = stmt.executeUpdate();
					int so_bbvphc=stmt.getInt("so_bbvphc");
					
					logger.log(Level.SEVERE,"Thêm dữ liệu addBBVPHC() mã biên bản mới lập: {0}",so_bbvphc);
					
					if(rs==-1) {
						handler.errorCallBack("SERVER: Thêm dữ liệu thất bại");
					}
					else handler.callBack(so_bbvphc);
					
					con.close();
					
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					logger.log(Level.WARNING,"Request không hợp lệ");
					handler.errorCallBack("SERVER: Lỗi SQL");
					e.printStackTrace();
				}
			}});
	}

	@Override
	public void  addQDXPHCKhongCanBienBan(Integer ma_can_bo, Date ngay_lap, String so_cmnd,CallBackHandler handler)
			throws RemoteException {
		// TODO Auto-generated method stub
		boolean check =true;
		if(handler==null) return;
		if(ma_can_bo==null||ngay_lap==null||so_cmnd==null) check=false;
		if(ngay_lap.getTime()>Date.valueOf(LocalDate.now()).getTime()) check=false;
		
		if(!p2.matcher(so_cmnd).find()) check=false;
		if(!check) {
			handler.errorCallBack("SERVER: Dữ liệu không hợp lệ");
			logger.log(Level.WARNING,"Request không hợp lệ");
			return;
		}
		
		TaskManager.addTask(new Task()
		{
			
			public void toDo() throws RemoteException{
				try {
					if(!checkInputCanBo(ma_can_bo)) {
						logger.log(Level.WARNING,"Request không hợp lệ");
						handler.errorCallBack("SERVER: Mã cán bộ không tồn tại");
						return;
					}
					
					if(!checkInputNguoiViPham(so_cmnd)) 
					{
						logger.log(Level.WARNING,"Request không hợp lệ");
						handler.errorCallBack("SERVER: Số CMND người vi phạm không tồn tại");
						return;
					}
				
						
					
					Connection con=MySQLConnectionTemplate.getConnection();
					CallableStatement stmt = con.prepareCall("{CALL QDXPHC_KhongDuaVaoBienBan(?,?,?,?,?)}");
					
				    stmt.setInt("ma_can_bo", ma_can_bo);
					stmt.setDate("ngay_lap", ngay_lap);
					stmt.setString("so_cmnd", so_cmnd);
					stmt.setDate("han_nop_phat",new Date(ngay_lap.getTime()+604800000));
					stmt.registerOutParameter("so_qdxphc", java.sql.Types.INTEGER);
					
					int rs = stmt.executeUpdate();
					int so_qdxphc=stmt.getInt("so_qdxphc");
					
				
					logger.log(Level.SEVERE,"Thêm dữ liệu addQDXPHC() mã quyết định mới lập: {0}",so_qdxphc);
					
					if(rs==-1) {
						handler.errorCallBack("SERVER: Thêm dữ liệu thất bại");
					}
					else handler.callBack(so_qdxphc);
					
					con.close();
					
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					logger.log(Level.WARNING,"Request không hợp lệ");
					handler.errorCallBack("SERVER: Lỗi SQL");
					e.printStackTrace();
				}
			}});
		
	}

	@Override
	public void addQDXPHCK(Integer so_bbvphc, Integer ma_can_bo, Date ngay_lap, CallBackHandler handler)
			throws RemoteException {
		// TODO Auto-generated method stub
		boolean check =true;
		if(handler==null) return;
		if(so_bbvphc==null||ma_can_bo==null||ngay_lap==null) check=false;
		if(ngay_lap.getTime()>Date.valueOf(LocalDate.now()).getTime()) check=false;
		if(!check) {
			handler.errorCallBack("SERVER: Dữ liệu không hợp lệ");
			logger.log(Level.WARNING,"Request không hợp lệ");
			return;
		}
		
		TaskManager.addTask(new Task()
		{
			
			public void toDo() throws RemoteException{
		
				try {
					if(!checkInputSoBBVPHC(so_bbvphc)) {
						logger.log(Level.WARNING,"Request không hợp lệ");
						handler.errorCallBack("SERVER: Số BBVPHC không tồn tại");
						return;
					}
					if(!checkInputCanBo(ma_can_bo)) {
						logger.log(Level.WARNING,"Request không hợp lệ");
						handler.errorCallBack("SERVER: Mã cán bộ không tồn tại");
						return;
					}
					
					Connection con=MySQLConnectionTemplate.getConnection();
					PreparedStatement st=con.prepareStatement("SELECT * FROM bbvphc_qdxphc WHERE soBBVPHC=?");
					st.setInt(1, so_bbvphc);
					ResultSet rss=st.executeQuery();
					if(rss.next()) {
						logger.log(Level.WARNING,"Request không hợp lệ");
						handler.errorCallBack("SERVER: Đã có một quyết định dựa trên số BBVPHC này !");
						return;
					}
					
					
					CallableStatement stmt = con.prepareCall("{CALL QDXPHC_DuaVaoBienBan(?,?,?,?,?)}");
					stmt.setInt("so_bbvphc", so_bbvphc);
				    stmt.setInt("ma_can_bo", ma_can_bo);
					stmt.setDate("ngay_lap", ngay_lap);
					stmt.setDate("han_nop_phat",new Date(ngay_lap.getTime()+604800000));
					stmt.registerOutParameter("so_qdxphc", java.sql.Types.INTEGER);
					
					int rs = stmt.executeUpdate();
					int so_qdxphc=stmt.getInt("so_qdxphc");
					
					logger.log(Level.SEVERE,"Thêm dữ liệu addQDXPHC() mã quyết định mới lập: {0}",so_qdxphc);
					
					if(rs==-1) {
						handler.errorCallBack("SERVER: Thêm dữ liệu thất bại");
					}
					else handler.callBack(so_qdxphc);
					
					con.close();
					
					
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					logger.log(Level.WARNING,"Request không hợp lệ");
					handler.errorCallBack("SERVER: Lỗi SQL");
					e.printStackTrace();
				}
			}});
		
		
	}

	@Override
	public void findLuat(CallBackHandler handler) throws RemoteException {
		// TODO Auto-generated method stub
		if(handler==null) return;
		TaskManager.addTask(new Task()
		{
			
			public void toDo() throws RemoteException{
			try {
				
						
					
					Connection con=MySQLConnectionTemplate.getConnection();
					PreparedStatement stmt = con.prepareStatement("SELECT * FROM diem");
					
					List<ItemDiem> diem_ls=new ArrayList<ItemDiem>();
					
					ResultSet rs=stmt.executeQuery();
					while(rs.next()) {
						diem_ls.add(
								new ItemDiem(rs.getInt("maDiem"),rs.getInt("maKhoan"),rs.getInt("maDieuLuat"),rs.getString("moTa"))
						);
					}
					
					logger.log(Level.SEVERE,"Truy vấn findLuat() {0} ItemDiem",diem_ls.size());
					
					
					con=MySQLConnectionTemplate.getConnection();
					stmt = con.prepareStatement("SELECT * FROM khoan");
					
					List<ItemKhoan> khoan_ls=new ArrayList<ItemKhoan>();
					
					rs=stmt.executeQuery();
					while(rs.next()) {
						List<ItemDiem> tmp=new ArrayList<ItemDiem>();
						Integer maKhoan=rs.getInt("maKhoan");
						for(ItemDiem diem: diem_ls) {
							if(diem.getMaKhoan().equals(maKhoan)) tmp.add(diem);
						}
						
						khoan_ls.add(new ItemKhoan(
								maKhoan,
								rs.getInt("maDieuLuat"),
								rs.getString("moTa"),
								tmp
							)
						);
					}
					
					logger.log(Level.SEVERE,"Truy vấn findLuat() {0} ItemKhoan",khoan_ls.size());
					
					
					
					
					con=MySQLConnectionTemplate.getConnection();
					stmt = con.prepareStatement("SELECT * FROM dieuluat");
					
					List<ItemDieuLuat> dieu_luat_ls=new ArrayList<ItemDieuLuat>();
					
					rs=stmt.executeQuery();
					while(rs.next()) {
						List<ItemKhoan> tmp=new ArrayList<ItemKhoan>();
						Integer maDieuLuat=rs.getInt("maDieuLuat");
						for(ItemKhoan dieuLuat: khoan_ls) {
							if(dieuLuat.getMaDieuLuat().equals(maDieuLuat)){
								tmp.add(dieuLuat);
							}
						}
						
						dieu_luat_ls.add(new ItemDieuLuat(
								maDieuLuat,
								rs.getString("tenDieuLuat"),
								tmp
							)
						);
					}
					
					logger.log(Level.SEVERE,"Truy vấn findLuat() {0} ItemDieuLuat",dieu_luat_ls.size());
					
					
					handler.callBack(dieu_luat_ls);
					con.close();
					
				
					
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					logger.log(Level.WARNING,"Request không hợp lệ");
					handler.errorCallBack("SERVER: Lỗi SQL");
					e.printStackTrace();
				}
		
			}});
	}

	@Override
	public void addXuPhat(Integer so_qdxphc, Integer diem_vp, Integer khoan_vp, Integer dieu_luat_vp, Integer muc_phat,CallBackHandler handler)
			throws RemoteException {
		// TODO Auto-generated method stub
		if(handler==null) return;
		boolean check=true;
		if(so_qdxphc==null||diem_vp==null||khoan_vp==null||dieu_luat_vp==null||muc_phat==null||muc_phat<0) check=false;
		if(!check) {
			handler.errorCallBack("SERVER: Dữ liệu không hợp lệ");
			logger.log(Level.WARNING,"Request không hợp lệ");
			return;
		}
		TaskManager.addTask(new Task()
		{
			
			public void toDo() throws RemoteException{
				try {
						if(!checkInputSoQDXPHC(so_qdxphc)) {
							logger.log(Level.WARNING,"Request không hợp lệ");
							handler.errorCallBack("SERVER: Số QDXPHC không tồn tại");
							return;
						}
					
							
						
						Connection con=MySQLConnectionTemplate.getConnection();
						CallableStatement stmt = con.prepareCall("{CALL ThemXuPhat(?,?,?,?,?)}");
						stmt.setInt("so_qdxphc", so_qdxphc);
					    stmt.setInt("diem_vp",diem_vp);
						stmt.setInt("khoan_vp", khoan_vp);
						stmt.setInt("dieu_luat_vp", dieu_luat_vp);
						stmt.setInt("muc_phat",muc_phat);
						
						
						int rs = stmt.executeUpdate();
						
						
					
						logger.log(Level.SEVERE,"Thêm dữ liệu addXuPhat() kết quả: {0}",so_qdxphc);
						
						if(rs==-1) {
							handler.errorCallBack("SERVER: Thêm dữ liệu thất bại");
						}
						else handler.callBack(rs);
						
						con.close();
						
					
						
					} catch (ClassNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (SQLException e) {
						logger.log(Level.WARNING,"Request không hợp lệ");
						handler.errorCallBack("SERVER: Lỗi SQL");
						e.printStackTrace();
					}
			}});
		
	}

	@Override
	public void addBienLaiNopPhat(Integer so_qdxphc,Integer ma_can_bo, String ho_ten, Date ngay_lap_bien_lai, String ly_do_nop_phat,
			Integer so_tien_nop,CallBackHandler handler) throws RemoteException {
		// TODO Auto-generated method stub
		if(handler==null) return;
		boolean check=true;
		if(so_qdxphc==null||ma_can_bo==null||ho_ten==null||ngay_lap_bien_lai==null||ly_do_nop_phat==null||so_tien_nop==null
				||so_tien_nop<0) check=false;
		if(p.matcher(ly_do_nop_phat).find()||p.matcher(ho_ten).find()) check=false;
		if(ngay_lap_bien_lai.getTime()>Date.valueOf(LocalDate.now()).getTime()) check=false;
		
		if(!check) {
			handler.errorCallBack("SERVER: Dữ liệu không hợp lệ");
			logger.log(Level.WARNING,"Request không hợp lệ");
			return;
		}
		
		TaskManager.addTask(new Task()
		{
			
			public void toDo() throws RemoteException{
				try {
					if(!checkInputSoQDXPHC(so_qdxphc)) {
						logger.log(Level.WARNING,"Request không hợp lệ");
						handler.errorCallBack("SERVER: Số QDXPHC không tồn tại");
						return;
					}
					if(!checkInputCanBo(ma_can_bo)) {
						logger.log(Level.WARNING,"Request không hợp lệ");
						handler.errorCallBack("SERVER: Mã cán bộ không tồn tại");
						return;
					}
					
					
					//Kiểm tra có hết hạn nộp phạt chưa
					Connection con=MySQLConnectionTemplate.getConnection();
					PreparedStatement st=con.prepareStatement("SELECT hanNopPhat FROM qdxphc WHERE soQDXPHC=?");
					st.setInt(1, so_qdxphc);
					ResultSet rss=st.executeQuery();
					if(rss.next()) {
						Date han=rss.getDate("hanNopPhat");
						if(ngay_lap_bien_lai.getTime()-han.getTime()>0) {
							handler.errorCallBack("SERVER: Đã hết hạn nộp phạt, hạn nộp phạt là: "+han.toString());
							return;
						}
		
					}
					
					PreparedStatement stt=con.prepareStatement("SELECT maBienLai FROM bienlainopphat WHERE soQDXPHC=?");
					stt.setInt(1, so_qdxphc);
					ResultSet rsss=stt.executeQuery();
					if(rsss.next()) {
							handler.errorCallBack("SERVER: Quyết định đã được thanh toán");
							return;
					}
					
					
				
					CallableStatement stmt = con.prepareCall("{CALL ThemBienLaiNopPhat(?,?,?,?,?,?)}");
					stmt.setInt("so_qdxphc", so_qdxphc);
					stmt.setInt("ma_can_bo", ma_can_bo);
				    stmt.setString("ho_ten",ho_ten);
					stmt.setDate("ngay_lap_bien_lai", ngay_lap_bien_lai);
					stmt.setString("ly_do_nop_phat", ly_do_nop_phat);
					stmt.setInt("so_tien_nop",so_tien_nop);
					
					
					int rs = stmt.executeUpdate();
					
					
					logger.log(Level.SEVERE,"Thêm dữ liệu addBienLaiNopPhat() kết quả: {0}",rs);
					
					if(rs==-1) {
						handler.errorCallBack("SERVER: Thêm dữ liệu thất bại");
					}
					else handler.callBack(rs);
					
					con.close();
				
			
				
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					logger.log(Level.WARNING,"Request không hợp lệ");
					handler.errorCallBack("SERVER: Lỗi SQL");
					e.printStackTrace();
				}
			}});
	}

	@Override
	public void findCoSoLuuTru(String reg_name, CallBackHandler handler) throws RemoteException {
		// TODO Auto-generated method stub
		if(handler==null) return;
		if(reg_name==null) return;
		TaskManager.addTask(new Task()
		{
			
			public void toDo() throws RemoteException{
				try {
					Connection con=MySQLConnectionTemplate.getConnection();
					CallableStatement stmt = con.prepareCall("{CALL TimKiemCoSoLuuTru(?)}");
					stmt.setString(1,reg_name);
					ResultSet rs = stmt.executeQuery();
					
					ArrayList<ItemCoSoLuuTru> co_so_list=new ArrayList<ItemCoSoLuuTru>();
					while(rs.next()) {
						co_so_list.add(new ItemCoSoLuuTru
						(
							rs.getInt("maCoSo"),
							rs.getString("tenCoSo")
						));
						
								
					}
					logger.log(Level.SEVERE,"Truy vấn findCoSoLuuTru() {0} ItemCoSoLuuTru",co_so_list.size());
					handler.callBack(co_so_list);
					
					con.close();
					
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					logger.log(Level.WARNING,"Request không hợp lệ");
					handler.errorCallBack("SERVER: Lỗi SQL");
					e.printStackTrace();
				}
			}});
	}

	@Override
	public void findTangVatTheoSoQDXPHC(String so_qdxphc,Integer page_offset, CallBackHandler handler) throws RemoteException {
		// TODO Auto-generated method stub
		if(so_qdxphc==null||handler==null||page_offset==null||page_offset<0) return;
		TaskManager.addTask(new Task()
		{
			
			public void toDo() throws RemoteException{
				try {
					Connection con=MySQLConnectionTemplate.getConnection();
					CallableStatement stmt = con.prepareCall("{CALL TimKiemTangVatTheoQDXPHC(?,?,?)}");
					stmt.setString(1,so_qdxphc);
					stmt.setInt(2,page_offset);
					stmt.registerOutParameter(3, java.sql.Types.INTEGER);
					ResultSet rs = stmt.executeQuery();
					
					Integer total=stmt.getInt(3);
					
					ArrayList<ItemTangVat> tang_vat_list=new ArrayList<ItemTangVat>();
					while(rs.next()) {
						tang_vat_list.add(
								new ItemTangVat(
									rs.getInt("maTangVat"),
									rs.getString("tenTangVat"),
									rs.getInt("soLuong"),
									rs.getString("trangThai"),
									rs.getInt("coSoLuuTru"),
									rs.getString("tenCoSo"),
									rs.getString("ghiChu")
								)
						);
					}
					
				
					logger.log(Level.SEVERE,"Truy vấn findTangVatTheoSoQDXPHC() {0} ItemTangVat",tang_vat_list.size());
					handler.callBack(new PagingWrapper<List<ItemTangVat>>(tang_vat_list,total));
					
					con.close();
					
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					logger.log(Level.WARNING,"Request không hợp lệ");
					handler.errorCallBack("SERVER: Lỗi SQL");
					e.printStackTrace();
				}
			}});
	}

	@Override
	public void findTangVatTheoSoBBVPHC(String so_bbvphc,Integer page_offset, CallBackHandler handler) throws RemoteException {
		// TODO Auto-generated method stub
	
		if(so_bbvphc==null||handler==null||page_offset==null||page_offset<0) return;
		
		TaskManager.addTask(new Task()
		{
			
			public void toDo() throws RemoteException{
				try {
					Connection con=MySQLConnectionTemplate.getConnection();
					CallableStatement stmt = con.prepareCall("{CALL TimKiemTangVatTheoBBVPHC(?,?,?)}");
					stmt.setString(1,so_bbvphc);
					stmt.setInt(2,page_offset);
					stmt.registerOutParameter(3, java.sql.Types.INTEGER);
					ResultSet rs = stmt.executeQuery();
					
					Integer total=stmt.getInt(3);
					
					
					ArrayList<ItemTangVat> tang_vat_list=new ArrayList<ItemTangVat>();
					while(rs.next()) {
						tang_vat_list.add(
								new ItemTangVat(
									rs.getInt("maTangVat"),
									rs.getString("tenTangVat"),
									rs.getInt("soLuong"),
									rs.getString("trangThai"),
									rs.getInt("coSoLuuTru"),
									rs.getString("tenCoSo"),
									rs.getString("ghiChu")
								)
						);
					}
					
				
					logger.log(Level.SEVERE,"Truy vấn findTangVatTheoSoBBVPHC() {0} ItemTangVat",tang_vat_list.size());
					handler.callBack(new PagingWrapper<List<ItemTangVat>>(tang_vat_list,total));
					
					con.close();
					
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					logger.log(Level.WARNING,"Request không hợp lệ");
					handler.errorCallBack("SERVER: Lỗi SQL");
					e.printStackTrace();
				}
			}});
	}

	@Override
	public void modifyTangVatBBVPHC(Integer ma_tang_vat, Integer so_bbvphc, String ten_tang_vat, Integer so_luong,
			String trang_thai, Integer co_so_luu_tru, String ghi_chu, CallBackHandler handler) throws RemoteException {
		// TODO Auto-generated method stub
		if(handler==null) return;
		boolean check=true;
		if(ma_tang_vat==null||so_bbvphc==null||ten_tang_vat==null||so_luong==null||trang_thai==null||co_so_luu_tru==null||
		p.matcher(ten_tang_vat).find()||p.matcher(trang_thai).find()||so_luong<0) check=false;
		if(!check) {
			handler.errorCallBack("SERVER: Dữ liệu không hợp lệ");
			logger.log(Level.WARNING,"Request không hợp lệ");
			return;
		}
		TaskManager.addTask(new Task()
		{
			
			public void toDo() throws RemoteException{
				try {
					if(!checkInputTangVat(ma_tang_vat)) {
						logger.log(Level.WARNING,"Request không hợp lệ");
						handler.errorCallBack("SERVER: Mã tang vật không tồn tại");
						return;
					}
					if(!checkInputSoBBVPHC(so_bbvphc)) {
						logger.log(Level.WARNING,"Request không hợp lệ");
						handler.errorCallBack("SERVER: Số BBVPHC không tồn tại");
						return;
					}
					
					if(!checkInputCoSoLuuTru(co_so_luu_tru)) {
						logger.log(Level.WARNING,"Request không hợp lệ");
						handler.errorCallBack("SERVER: Mã cơ sở lưu trữ không tồn tại");
						return;
					}
					
					Connection con=MySQLConnectionTemplate.getConnection();
					CallableStatement stmt = con.prepareCall("{CALL HieuChinhTangVatBBVPHC(?,?,?,?,?,?,?)}");
					
				
					stmt.setInt("ma_tang_vat", ma_tang_vat);
				    stmt.setInt("so_bbvphc", so_bbvphc);
					stmt.setString("ten_tang_vat", ten_tang_vat);
					stmt.setInt("so_luong", so_luong);
					stmt.setString("trang_thai",trang_thai);
					stmt.setInt("co_so_luu_tru", co_so_luu_tru);
					stmt.setString("ghi_chu", ghi_chu);
					
					int rs = stmt.executeUpdate();
					logger.log(Level.SEVERE,"Hiệu chỉnh modifyTangVatBBVPHC() kết quả: {0}",rs);
					
					
					
					if(rs==-1||rs==0) {
						handler.errorCallBack("SERVER: Cập nhật dữ liệu thất bại");
					}
					else {
						handler.callBack(rs);
					}
					
					con.close();
				
					
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					logger.log(Level.WARNING,"Request không hợp lệ");
					handler.errorCallBack("SERVER: Lỗi SQL");
					e.printStackTrace();
				}
			}});
		
	}

	@Override
	public void modifyTangVatQDXPHC(Integer ma_tang_vat, Integer so_qdxphc, String ten_tang_vat, Integer so_luong,
			String trang_thai, Integer co_so_luu_tru, String ghi_chu, CallBackHandler handler) throws RemoteException {
		if(handler==null) return;
		boolean check=true;
		if(ma_tang_vat==null||so_qdxphc==null||ten_tang_vat==null||so_luong==null||trang_thai==null||co_so_luu_tru==null||
		p.matcher(ten_tang_vat).find()||p.matcher(trang_thai).find()||so_luong<0) check=false;
		if(!check) {
			handler.errorCallBack("SERVER: Dữ liệu không hợp lệ");
			logger.log(Level.WARNING,"Request không hợp lệ");
			return;
		}
		// TODO Auto-generated method stub
		TaskManager.addTask(new Task()
		{
			
			public void toDo() throws RemoteException{
				try {
					if(!checkInputTangVat(ma_tang_vat)) {
						logger.log(Level.WARNING,"Request không hợp lệ");
						handler.errorCallBack("SERVER: Mã tang vật không tồn tại");
						return;
					}
					
					if(!checkInputSoQDXPHC(so_qdxphc)) {
						logger.log(Level.WARNING,"Request không hợp lệ");
						handler.errorCallBack("SERVER: Số BBVPHC không tồn tại");
						return;
					}
					
					if(!checkInputCoSoLuuTru(co_so_luu_tru)) {
						logger.log(Level.WARNING,"Request không hợp lệ");
						handler.errorCallBack("SERVER: Mã cơ sở lưu trữ không tồn tại");
						return;
					}
					
					Connection con=MySQLConnectionTemplate.getConnection();
					CallableStatement stmt = con.prepareCall("{CALL HieuChinhTangVatQDXPHC(?,?,?,?,?,?,?)}");
					
					stmt.setInt("ma_tang_vat", ma_tang_vat);
				    stmt.setInt("so_qdxphc", so_qdxphc);
					stmt.setString("ten_tang_vat", ten_tang_vat);
					stmt.setInt("so_luong", so_luong);
					stmt.setString("trang_thai",trang_thai);
					stmt.setInt("co_so_luu_tru", co_so_luu_tru);
					stmt.setString("ghi_chu", ghi_chu);
					
					int rs = stmt.executeUpdate();
					
					logger.log(Level.SEVERE,"Hiệu chỉnh modifyTangVatQDXPHC() kết quả: {0}",rs);
					
					
					
					if(rs==-1||rs==0) {
						handler.errorCallBack("SERVER: Cập nhật dữ liệu thất bại");
					}
					else {
						handler.callBack(rs);
					}
					
					con.close();
				
					
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					logger.log(Level.WARNING,"Request không hợp lệ");
					handler.errorCallBack("SERVER: Lỗi SQL");
					e.printStackTrace();
				}
			}});
		
		
	}

	@Override
	public void sumXuPhat(Integer so_qdxphc, CallBackHandler handler) throws RemoteException {
		// TODO Auto-generated method stub
		if(handler==null) return;
		if(so_qdxphc==null) {
			handler.errorCallBack("SERVER: Dữ liệu không hợp lệ");
			logger.log(Level.WARNING,"Request không hợp lệ");
			return;
		}
		
		TaskManager.addTask(new Task()
		{
			
			public void toDo() throws RemoteException{
				try {
					
					if(!checkInputSoQDXPHC(so_qdxphc)) {
						logger.log(Level.WARNING,"Request không hợp lệ");
						handler.errorCallBack("SERVER: Số QDXPHC không tồn tại");
						return;
					}
					
					Connection con=MySQLConnectionTemplate.getConnection();
					CallableStatement stmt = con.prepareCall("{CALL TongMucPhat(?)}");
					
				    stmt.setInt("so_qdxphc", so_qdxphc);
				    
				   
					
					ResultSet rs = stmt.executeQuery();
					if(rs.next()) {
						 Integer tong_muc_phat=rs.getInt(1);
						logger.log(Level.SEVERE,"Truy vấn sumXuPhat() tổng :{0}",tong_muc_phat);
						handler.callBack(tong_muc_phat);
					}
				
					con.close();
					
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					logger.log(Level.WARNING,"Request không hợp lệ");
					handler.errorCallBack("SERVER: Lỗi SQL");
					e.printStackTrace();
				}
			}});
		
	}

	@Override
	public void dangNhap(String tai_khoan, String mat_khau, CallBackHandler handler) throws RemoteException {
		// TODO Auto-generated method stub
		if(handler==null) return;
		if(tai_khoan==null||mat_khau==null) {
			 handler.errorCallBack("Dữ liệu nhập vào không hợp lệ");
			return;
		}
		
		TaskManager.addTask(new Task()
		{
			
			public void toDo() throws RemoteException{
				try {
					Connection con=MySQLConnectionTemplate.getConnection();
					CallableStatement stmt = con.prepareCall("{CALL LayThongTinTaiKhoan(?,?)}");
					stmt.setString(1,tai_khoan);
					stmt.setString(2, mat_khau);
					
					
					ResultSet rs = stmt.executeQuery();
					if(rs.next()) {
						
						ThongTinTK profile=new ThongTinTK(rs.getString("taiKhoan"),rs.getString("hoTen"),rs.getInt("maCanBo"),rs.getInt("maDonVi"),rs.getString("tenDonVi"),rs.getString("quyen"));
						handler.callBack(profile);
					}
					else handler.errorCallBack("Đăng nhập thất bại tên hoặc tài khoản không chính xác");
				
					con.close();
					
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					logger.log(Level.WARNING,"Request không hợp lệ");
					handler.errorCallBack("SERVER: Lỗi SQL");
					e.printStackTrace();
				}
			}});
	}

	@Override
	public void findBienBanTheoCMND(String so_cmnd,Integer page_offset, CallBackHandler handler) throws RemoteException {
		// TODO Auto-generated method stub
		if(so_cmnd==null||handler==null||page_offset==null||page_offset<0) return;
		TaskManager.addTask(new Task()
		{
			
			public void toDo() throws RemoteException{
				try {
					Connection con=MySQLConnectionTemplate.getConnection();
					CallableStatement stmt = con.prepareCall("{CALL TiemKiemBienBanTheoCMND(?,?,?)}");
					stmt.setString(1,so_cmnd);
					stmt.setInt(2,page_offset);
					stmt.registerOutParameter(3, java.sql.Types.INTEGER);
					ResultSet rs = stmt.executeQuery();
					
					Integer total=stmt.getInt(3);
			
					
					List<ItemBienBan> bb_ls=new ArrayList<ItemBienBan>();
					while(rs.next()) 
					{
						bb_ls.add(
								new ItemBienBan(
										rs.getInt("soBBVPHC"),
										rs.getInt("maCanBo"),
										rs.getString("hoTenCanBo"),
										rs.getDate("ngayLap"),
										rs.getString("soCMND"),
										rs.getString("hoTenNguoiViPham"),
										rs.getDate("ngaySinh"),
										rs.getString("diaChi"),
										rs.getString("sdt"),
										rs.getString("moTaHanhVi")
										
								)
								
								
						);
					}
					
					handler.callBack(new PagingWrapper<List<ItemBienBan>>(bb_ls,total));
					con.close();
				
					
					
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					logger.log(Level.WARNING,"Request không hợp lệ");
					handler.errorCallBack("SERVER: Lỗi SQL");
					e.printStackTrace();
				}
			}});
	}

	@Override
	public void findQuyetDinhTheoCMND(String so_cmnd,Integer page_offset, CallBackHandler handler) throws RemoteException {
		// TODO Auto-generated method stub
		if(so_cmnd==null||handler==null||page_offset==null||page_offset<0) return;
		TaskManager.addTask(new Task()
		{
			
			public void toDo() throws RemoteException{
				try {
					List<ItemQuyetDinh> qd_ls=new ArrayList<ItemQuyetDinh>();
					
					Connection con=MySQLConnectionTemplate.getConnection();
					CallableStatement stmt = con.prepareCall("{CALL TimKiemQuyetDinhTheoCMND(?,?,?)}");
					stmt.setString(1,so_cmnd);
					stmt.setInt(2,page_offset);
					stmt.registerOutParameter(3, java.sql.Types.INTEGER);
					ResultSet rs = stmt.executeQuery();
					
					Integer total=stmt.getInt(3);
					
					
					
					Integer last=0;
					while(rs.next()) {
						Integer soQDXPHC=rs.getInt("soQDXPHC");
						if(last.equals(soQDXPHC)) {
							ItemXuPhat it=new ItemXuPhat();
							it.diem=rs.getInt("diem");
							it.khoan=rs.getInt("khoan");
							it.dieuLuat=rs.getInt("dieu");
							it.soTienNop=rs.getInt("mucPhat");
		
							qd_ls.get(qd_ls.size()-1).getXp_ls().add(it);
						}
						else {
							qd_ls.add(new ItemQuyetDinh(
						
								rs.getInt("soQDXPHC"),
								rs.getInt("soBBVPHC"),
								rs.getInt("maCanBo"),
								rs.getString("hoTenCanBo"),
								rs.getString("soCMND"),
								rs.getString("hoTenNguoiViPham"),
								rs.getDate("ngayLap"), 
								rs.getDate("ngaySinhNguoiViPham"), 
								rs.getDate("hanNopPhat"),
								rs.getString("diaChi"),
								rs.getString("sdt"),
								rs.getString("ghiChu")
							));
							
							ItemXuPhat it=new ItemXuPhat();
							it.diem=rs.getInt("diem");
							it.khoan=rs.getInt("khoan");
							it.dieuLuat=rs.getInt("dieu");
							it.soTienNop=rs.getInt("mucPhat");
							qd_ls.get(qd_ls.size()-1).getXp_ls().add(it);
						}
						last=soQDXPHC;
						
					}
					
					
					handler.callBack(new PagingWrapper<List<ItemQuyetDinh>>(qd_ls,total));
		//			System.out.println(qd_ls.get(0).getXp_ls().size());
					
				
					con.close();
					
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					e.printStackTrace();
					logger.log(Level.WARNING,"Request không hợp lệ");
					handler.errorCallBack("SERVER: Lỗi SQL");
					
				}
			}});
	}

	@Override
	public void modifyBBVPHC(Integer so_bbvphc, Integer ma_can_bo, Date ngay_lap, String so_cmnd, String mo_ta_hanh_vi,
			CallBackHandler handler) throws RemoteException {
		if(handler==null) return;
		//Chi cho hieu chinh khi bien ban nay chua duoc lap boi quyet dinh
		boolean check =true;
		if(so_bbvphc==null||ma_can_bo==null||ngay_lap==null||so_cmnd==null||mo_ta_hanh_vi==null) check=false;
		if(ngay_lap.getTime()>Date.valueOf(LocalDate.now()).getTime()) check=false;
		if(!p2.matcher(so_cmnd).find()) check=false;
		if(!check) {
			handler.errorCallBack("SERVER: Dữ liệu không hợp lệ");
			logger.log(Level.WARNING,"Request không hợp lệ");
			return;
		}
		
		TaskManager.addTask(new Task()
		{
			
			public void toDo() throws RemoteException{
				
				try {
						if(!checkInputSoBBVPHC(so_bbvphc)) {
							logger.log(Level.WARNING,"Request không hợp lệ");
							handler.errorCallBack("SERVER: Số BBVPHC không tồn tại");
							return;
						}
						
						if(!checkInputCanBo(ma_can_bo)) {
							logger.log(Level.WARNING,"Request không hợp lệ");
							handler.errorCallBack("SERVER: Mã cán bộ không tồn tại");
							return;
						}
						if(!checkInputNguoiViPham(so_cmnd)) 
						{
							logger.log(Level.WARNING,"Request không hợp lệ");
							handler.errorCallBack("SERVER: Số CMND người vi phạm không tồn tại");
							return;
						}
						
						
						Connection con=MySQLConnectionTemplate.getConnection();
						PreparedStatement st=con.prepareStatement("SELECT * FROM bbvphc_qdxphc WHERE soBBVPHC=?");
						st.setInt(1, so_bbvphc);
						ResultSet rss=st.executeQuery();
						if(rss.next()) {
							handler.errorCallBack("SERVER: Biên bản này không thể sửa đổi vì đã có quyết định từ biên bản này");
							return;
						}
							
							
						CallableStatement stmt = con.prepareCall("{CALL HieuChinhBienBan(?,?,?,?,?)}");
							
							stmt.setInt("so_bbvphc", so_bbvphc);
						    stmt.setInt("ma_can_bo", ma_can_bo);
							stmt.setDate("ngay_lap", ngay_lap);
							stmt.setString("so_cmnd", so_cmnd);
							stmt.setString("mo_ta_hanh_vi",mo_ta_hanh_vi);
						
							
							int rs = stmt.executeUpdate();
							
							
						
							logger.log(Level.SEVERE,"Hiệu chỉnh modifyBBVPHC() kết quả: {0}",rs);
							handler.callBack(rs);
							
							con.close();
							
						} catch (ClassNotFoundException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (SQLException e) {
							logger.log(Level.WARNING,"Request không hợp lệ");
							handler.errorCallBack("SERVER: Lỗi SQL");
							e.printStackTrace();
						}
			}});
	}

	

	@Override
	public void findBienLaiNopPhatTheoTenCanBo(String reg_name,Integer page_offset, CallBackHandler handler) throws RemoteException {
		// TODO Auto-generated method stub
		if(reg_name==null||handler==null||page_offset==null||page_offset<0) return;
		TaskManager.addTask(new Task()
		{
			
			public void toDo() throws RemoteException{
				try {
					Connection con=MySQLConnectionTemplate.getConnection();
					CallableStatement stmt = con.prepareCall("{CALL TimKiemBienLaiTheoHoTenNguoiLap(?,?,?)}");
					stmt.setString(1,reg_name);
					stmt.setInt(2,page_offset);
					stmt.registerOutParameter(3, java.sql.Types.INTEGER);
					ResultSet rs = stmt.executeQuery();
					
					Integer total=stmt.getInt(3);
					
					ArrayList<ItemBienLai> bien_lai_list=new ArrayList<ItemBienLai>();
					while(rs.next()) {
						bien_lai_list.add(
						new ItemBienLai(
							rs.getInt("maBienLai"),
							rs.getInt("soQDXPHC"),
							rs.getDate("ngayLapBienLai"),
							rs.getInt("maCanBo"),
							rs.getString("hoTenCanBo"),
							rs.getString("hoTenNguoiNopTien"),
							rs.getString("lyDoNopPhat"),
							rs.getInt("soTienNop")
						)
						);
					}
					logger.log(Level.SEVERE,"Truy vấn findBienLaiNopPhatTheoTenCanbo() {0} ItemBienLai",bien_lai_list.size());
					handler.callBack(new PagingWrapper<List<ItemBienLai>>(bien_lai_list,total));
					con.close();
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					logger.log(Level.WARNING,"Request không hợp lệ");
					handler.errorCallBack("SERVER: Lỗi SQL");
					e.printStackTrace();
				}
			}});
	}

	@Override
	public void deleteTangVat(Integer ma_tang_vat, CallBackHandler handler) throws RemoteException {
		// TODO Auto-generated method stub
		if(handler==null) return;
		boolean check=true;
		if(ma_tang_vat==null) check=false;
		if(!check) {
			handler.errorCallBack("SERVER: Dữ liệu không hợp lệ");
			logger.log(Level.WARNING,"Request không hợp lệ");
			return;
		}
		TaskManager.addTask(new Task()
		{
			
			public void toDo() throws RemoteException{
			try {
				if(!checkInputTangVat(ma_tang_vat)) {
					logger.log(Level.WARNING,"Request không hợp lệ");
					handler.errorCallBack("SERVER: Mã tang vật không tồn tại");
					return;
				}
				
				
				Connection con=MySQLConnectionTemplate.getConnection();
				CallableStatement stmt = con.prepareCall("{CALL XoaTangVat(?)}");
				
			
				stmt.setInt("ma_tang_vat", ma_tang_vat);
			   
				
				int rs = stmt.executeUpdate();
				logger.log(Level.SEVERE,"Xóa deleteTangVat() kết quả: {0}",rs);
				
				
				
				if(rs==-1||rs==0) {
					handler.errorCallBack("SERVER: Cập nhật dữ liệu thất bại");
				}
				else {
					handler.callBack(rs);
				}
			
				con.close();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				logger.log(Level.WARNING,"Request không hợp lệ");
				handler.errorCallBack("SERVER: Lỗi SQL");
				e.printStackTrace();
			}
			}});
		}

	@Override
	public void thongKe(Integer year, Integer ma_khu_vuc,CallBackHandler handler) throws RemoteException {
		// TODO Auto-generated method stub
		if(handler==null) return;
		boolean check=true;
		if(year==null||ma_khu_vuc==null||year<0) check=false;
		if(!check) {
			handler.errorCallBack("SERVER: Dữ liệu không hợp lệ");
			logger.log(Level.WARNING,"Request không hợp lệ");
			return;
		}
		TaskManager.addTask(new Task()
		{
			public void toDo() throws RemoteException{
				try {
					
					
						Connection con=MySQLConnectionTemplate.getConnection();
						PreparedStatement st=con.prepareStatement("SELECT maKhuVuc FROM khuvuc WHERE maKhuVuc= ?;" );
						st.setInt(1, ma_khu_vuc);
						ResultSet rs=st.executeQuery();
						
					if(ma_khu_vuc!=0) {
						if(!rs.next()) {
							logger.log(Level.WARNING,"Request không hợp lệ");
							handler.errorCallBack("SERVER: Mã khu vực không tồn tại");
							return;
						}
					}
					
					List<ItemThongKe> tk_ls=new ArrayList<ItemThongKe>();
					if(ma_khu_vuc!=0) {
						for(int i=1;i<=12;i++) {
							st=con.prepareStatement("SELECT COUNT(soBBVPHC) FROM bbvphc,canbo,donvi " + 
									"WHERE bbvphc.maCanBo=canbo.maCanBo " + 
									"AND canbo.maDonVi=donVi.maDonVi " + 
									"AND donvi.maKhuVuc=? " + 
									"AND MONTH(ngayLap)=? " + 
									"AND YEAR(ngayLap)=?; "
							);
							st.setInt(1, ma_khu_vuc);
							st.setInt(2, i);
							st.setInt(3, year);
							
							rs=st.executeQuery();
							rs.next();
							Integer slBB=rs.getInt(1);
							
							
							st=con.prepareStatement("SELECT COUNT(soQDXPHC) FROM qdxphc,canbo,donvi " + 
									"WHERE qdxphc.maCanBo=canbo.maCanBo " + 
									"AND canbo.maDonVi=donVi.maDonVi " + 
									"AND donvi.maKhuVuc=? " + 
									"AND MONTH(ngayLap)=? " + 
									"AND YEAR(ngayLap)=?;"
							);
							st.setInt(1, ma_khu_vuc);
							st.setInt(2, i);
							st.setInt(3, year);
							
							rs=st.executeQuery();
							rs.next();
							Integer slQD=rs.getInt(1);
							
							tk_ls.add(new ItemThongKe(slBB,slQD,i,year));
						}
					
					}
					else {
						for(int i=1;i<=12;i++) {
							st=con.prepareStatement("SELECT COUNT(soBBVPHC) FROM bbvphc,canbo,donvi \n" + 
									"WHERE bbvphc.maCanBo=canbo.maCanBo \n" + 
									"AND canbo.maDonVi=donVi.maDonVi \n" + 
									"AND MONTH(ngayLap)=?\n" + 
									"AND YEAR(ngayLap)=?;"
							);
							st.setInt(1, i);
							st.setInt(2, year);
							
							rs=st.executeQuery();
							rs.next();
							Integer slBB=rs.getInt(1);
							
							
							st=con.prepareStatement("SELECT COUNT(soQDXPHC) FROM qdxphc,canbo,donvi \n" + 
									"WHERE qdxphc.maCanBo=canbo.maCanBo \n" + 
									"AND canbo.maDonVi=donVi.maDonVi \n" + 
									"AND MONTH(ngayLap)=?\n" + 
									"AND YEAR(ngayLap)=?;"
							);
							st.setInt(1, i);
							st.setInt(2, year);
							
							rs=st.executeQuery();
							rs.next();
							Integer slQD=rs.getInt(1);
							
							tk_ls.add(new ItemThongKe(slBB,slQD,i,year));
						}
					}
					
					
					handler.callBack(tk_ls);
					
					
					con.close();
					
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					logger.log(Level.WARNING,"Request không hợp lệ");
					handler.errorCallBack("SERVER: Lỗi SQL");
					
				}
		}});
	}

	@Override
	public void findKhuVuc(String reg_name, CallBackHandler handler) throws RemoteException {
		// TODO Auto-generated method stub
		if(handler==null) return;
		if(reg_name==null) return;
		TaskManager.addTask(new Task()
		{
			
			public void toDo() throws RemoteException{
				try {
					Connection con=MySQLConnectionTemplate.getConnection();
					CallableStatement stmt = con.prepareCall("{CALL TimKiemKhuVuc(?)}");
					stmt.setString(1,reg_name);
					ResultSet rs = stmt.executeQuery();
					
					ArrayList<ItemKhuVuc> khu_vuc_list=new ArrayList<ItemKhuVuc>();
					while(rs.next()) {
						khu_vuc_list.add(new ItemKhuVuc(rs.getInt("maKhuVuc"),rs.getString("tenKhuVuc")));
					}
					logger.log(Level.SEVERE,"Truy vấn findKhuVuc() {0} ItemKhuVuc",khu_vuc_list.size());
					handler.callBack(khu_vuc_list);
					con.close();
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					logger.log(Level.WARNING,"Request không hợp lệ");
					handler.errorCallBack("SERVER: Lỗi SQL");
					e.printStackTrace();
				}
			}});
	}

	@Override
	public void modifyBienLaiNopPhat(Integer ma_bien_lai, Integer so_qdxphc, Integer ma_can_bo, String ho_ten,
			Date ngay_lap_bien_lai, String ly_do_nop_phat, Integer so_tien_nop, CallBackHandler handler)
			throws RemoteException {
		// TODO Auto-generated method stub
		if(handler==null) return;
		boolean check=true;
		if(ma_bien_lai==null||so_qdxphc==null||ma_can_bo==null||ho_ten==null||ngay_lap_bien_lai==null||ly_do_nop_phat==null||so_tien_nop==null
				||so_tien_nop<0) check=false;
		if(p.matcher(ly_do_nop_phat).find()||p.matcher(ho_ten).find()) check=false;
		if(ngay_lap_bien_lai.getTime()>Date.valueOf(LocalDate.now()).getTime()) check=false;
		
		if(!check) {
			handler.errorCallBack("SERVER: Dữ liệu không hợp lệ");
			logger.log(Level.WARNING,"Request không hợp lệ");
			return;
		}
		
		TaskManager.addTask(new Task()
		{
			
			public void toDo() throws RemoteException{
				try {
					if(!checkInputSoQDXPHC(so_qdxphc)) {
						logger.log(Level.WARNING,"Request không hợp lệ");
						handler.errorCallBack("SERVER: Số QDXPHC không tồn tại");
						return;
					}
					if(!checkInputCanBo(ma_can_bo)) {
						logger.log(Level.WARNING,"Request không hợp lệ");
						handler.errorCallBack("SERVER: Mã cán bộ không tồn tại");
						return;
					}
					
					if(!checkInputBienLai(ma_bien_lai)) {
						logger.log(Level.WARNING,"Request không hợp lệ");
						handler.errorCallBack("SERVER: Mã biên lai không tồn tại");
						return;
					}
					
					
					//Kiểm tra có hết hạn nộp phạt chưa
					Connection con=MySQLConnectionTemplate.getConnection();
					PreparedStatement st=con.prepareStatement("SELECT hanNopPhat FROM qdxphc WHERE soQDXPHC=?");
					st.setInt(1, so_qdxphc);
					ResultSet rss=st.executeQuery();
					if(rss.next()) {
						Date han=rss.getDate("hanNopPhat");
						if(ngay_lap_bien_lai.getTime()-han.getTime()>0) {
							handler.errorCallBack("SERVER: Đã hết hạn nộp phạt, hạn nộp phạt là: "+han.toString());
							return;
						}
		
					}
					
					PreparedStatement stt=con.prepareStatement("SELECT maBienLai FROM bienlainopphat WHERE soQDXPHC=?");
					stt.setInt(1, so_qdxphc);
					ResultSet rsss=stt.executeQuery();
					if(rsss.next()) {
							System.out.println(rsss.getInt(1));
							handler.errorCallBack("SERVER: Quyết định đã được thanh toán");
							return;
					}
					
					
				
					CallableStatement stmt = con.prepareCall("{CALL HieuChinhBienLai(?,?,?,?,?,?,?)}");
					stmt.setInt("ma_bien_lai", ma_bien_lai);
					stmt.setInt("so_qdxphc", so_qdxphc);
					stmt.setInt("ma_can_bo", ma_can_bo);
				    stmt.setString("ho_ten",ho_ten);
					stmt.setDate("ngay_lap_bien_lai", ngay_lap_bien_lai);
					stmt.setString("ly_do_nop_phat", ly_do_nop_phat);
					stmt.setInt("so_tien_nop",so_tien_nop);
					
					
					int rs = stmt.executeUpdate();
					
					
					logger.log(Level.SEVERE,"Sửa dữ liệu modifyBienLaiNopPhat() kết quả: {0}",rs);
					
					if(rs==-1||rs==0) {
						handler.errorCallBack("SERVER: Hiệu chỉnh dữ liệu thất bại");
					}
					else handler.callBack(rs);
					con.close();
			
				
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					e.printStackTrace();
					logger.log(Level.WARNING,"Request không hợp lệ");
					handler.errorCallBack("SERVER: Lỗi SQL");
					
				}
			}});
	}

	@Override
	public void deleteCanBo(Integer ma_can_bo, CallBackHandler handler) throws RemoteException {
		// TODO Auto-generated method stub
		if(handler==null) return;
		boolean check=true;
		if(ma_can_bo==null) check=false;
		if(!check) {
			handler.errorCallBack("SERVER: Dữ liệu không hợp lệ");
			logger.log(Level.WARNING,"Request không hợp lệ");
			return;
		}
		TaskManager.addTask(new Task()
		{
			
			public void toDo() throws RemoteException{
			try {
				if(!checkInputCanBo(ma_can_bo)) {
					logger.log(Level.WARNING,"Request không hợp lệ");
					handler.errorCallBack("SERVER: Mã cán bộ không tồn tại");
					return;
				}
				
				Connection con=MySQLConnectionTemplate.getConnection();
				PreparedStatement checkValid=con.prepareStatement("SELECT maCanBo FROM qdxphc WHERE maCanBo=?");
				checkValid.setInt(1, ma_can_bo);
				if(checkValid.executeQuery().next()) {
					logger.log(Level.WARNING,"Request không hợp lệ");
					handler.errorCallBack("SERVER: Không thể xóa cán bộ này vì có quyết định được lập bởi cán bộ");
					return;
				}
				
				checkValid=con.prepareStatement("SELECT maCanBo FROM bbvphc WHERE maCanBo=?");
				checkValid.setInt(1, ma_can_bo);
				if(checkValid.executeQuery().next()) {
					logger.log(Level.WARNING,"Request không hợp lệ");
					handler.errorCallBack("SERVER: Không thể xóa cán bộ này vì có biên bản được lập bởi cán bộ");
					return;
				}
				
				checkValid=con.prepareStatement("SELECT maCanBo FROM taikhoancanbo WHERE maCanBo=?");
				checkValid.setInt(1, ma_can_bo);
				if(checkValid.executeQuery().next()) {
					logger.log(Level.WARNING,"Request không hợp lệ");
					handler.errorCallBack("SERVER: Không thể xóa cán bộ này vì có tài khoản cán bộ cho cán bộ này");
					return;
				}
				
				con=MySQLConnectionTemplate.getConnection();
				CallableStatement stmt = con.prepareCall("{CALL XoaCanBo(?)}");
				
			
				stmt.setInt("ma_can_bo", ma_can_bo);
			   
				
				int rs = stmt.executeUpdate();
				logger.log(Level.SEVERE,"Xóa deleteCanBo() kết quả: {0}",rs);
				
				
				
				if(rs==-1||rs==0) {
					handler.errorCallBack("SERVER: Cập nhật dữ liệu thất bại");
				}
				else {
					handler.callBack(rs);
				}
				con.close();
				
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				logger.log(Level.WARNING,"Request không hợp lệ");
				handler.errorCallBack("SERVER: Lỗi SQL");
				e.printStackTrace();
			}
			}});
	}

	@Override
	public void deleteNguoiViPham(String so_cmnd, CallBackHandler handler) throws RemoteException {
		// TODO Auto-generated method stub
		if(handler==null) return;
		boolean check=true;
		if(so_cmnd==null||(so_cmnd.length()!=9&&so_cmnd.length()!=12)||!p2.matcher(so_cmnd).find()) check=false;
		if(!check) {
			handler.errorCallBack("SERVER: Dữ liệu không hợp lệ");
			logger.log(Level.WARNING,"Request không hợp lệ");
			return;
		}
		TaskManager.addTask(new Task()
		{
			
			public void toDo() throws RemoteException{
			try {
				if(!checkInputNguoiViPham(so_cmnd)) {
					logger.log(Level.WARNING,"Request không hợp lệ");
					handler.errorCallBack("SERVER: Mã cán bộ không tồn tại");
					return;
				}
				
				Connection con=MySQLConnectionTemplate.getConnection();
				PreparedStatement checkValid=con.prepareStatement("SELECT soCMND FROM qdxphc WHERE soCMND=?");
				checkValid.setString(1,so_cmnd);
				if(checkValid.executeQuery().next()) {
					logger.log(Level.WARNING,"Request không hợp lệ");
					handler.errorCallBack("SERVER: Không thể xóa người vi phạm này vì có quyết định có cmnd người vi phạm");
					return;
				}
				
				checkValid=con.prepareStatement("SELECT soCMND FROM bbvphc WHERE soCMND=?");
				checkValid.setString(1,so_cmnd);
				if(checkValid.executeQuery().next()) {
					logger.log(Level.WARNING,"Request không hợp lệ");
					handler.errorCallBack("SERVER: Không thể xóa người vi phạm này vì có biên bản có cmnd người vi phạm");
					return;
				}
				
				con=MySQLConnectionTemplate.getConnection();
				CallableStatement stmt = con.prepareCall("{CALL XoaNguoiViPham(?)}");
				
			
				stmt.setString("so_cmnd", so_cmnd);
			   
				
				int rs = stmt.executeUpdate();
				logger.log(Level.SEVERE,"Xóa deleteNguoiViPham() kết quả: {0}",rs);
				
				
				
				if(rs==-1||rs==0) {
					handler.errorCallBack("SERVER: Cập nhật dữ liệu thất bại");
				}
				else {
					handler.callBack(rs);
				}
				con.close();
			
				
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				logger.log(Level.WARNING,"Request không hợp lệ");
				handler.errorCallBack("SERVER: Lỗi SQL");
				e.printStackTrace();
			}
			}});
	}

	@Override
	public void findQuyetDinhTheoSoQDXPHC(String so_qdxphc, Integer page_offset, CallBackHandler handler) throws RemoteException {
		if(handler==null||page_offset==null||page_offset<0) return;
		if(so_qdxphc==null) return;
		TaskManager.addTask(new Task()
		{
			
			public void toDo() throws RemoteException{
				try {
					List<ItemQuyetDinh> qd_ls=new ArrayList<ItemQuyetDinh>();
					
					Connection con=MySQLConnectionTemplate.getConnection();
					CallableStatement stmt = con.prepareCall("{CALL TimKiemQuyetDinhTheoSoQDXPHC(?,?,?)}");
					stmt.setString(1,so_qdxphc);
					stmt.setInt(2,page_offset);
					stmt.registerOutParameter(3, java.sql.Types.INTEGER);
					ResultSet rs = stmt.executeQuery();
					
					Integer total=stmt.getInt(3);
					
					
					
					Integer last=0;
					while(rs.next()) {
						Integer soQDXPHC=rs.getInt("soQDXPHC");
						if(last.equals(soQDXPHC)) {
							ItemXuPhat it=new ItemXuPhat();
							it.diem=rs.getInt("diem");
							it.khoan=rs.getInt("khoan");
							it.dieuLuat=rs.getInt("dieu");
							it.soTienNop=rs.getInt("mucPhat");
		
							qd_ls.get(qd_ls.size()-1).getXp_ls().add(it);
						}
						else {
							qd_ls.add(new ItemQuyetDinh(
						
								rs.getInt("soQDXPHC"),
								rs.getInt("soBBVPHC"),
								rs.getInt("maCanBo"),
								rs.getString("hoTenCanBo"),
								rs.getString("soCMND"),
								rs.getString("hoTenNguoiViPham"),
								rs.getDate("ngayLap"), 
								rs.getDate("ngaySinhNguoiViPham"), 
								rs.getDate("hanNopPhat"),
								rs.getString("diaChi"),
								rs.getString("sdt"),
								rs.getString("ghiChu")
							));
							
							ItemXuPhat it=new ItemXuPhat();
							it.diem=rs.getInt("diem");
							it.khoan=rs.getInt("khoan");
							it.dieuLuat=rs.getInt("dieu");
							it.soTienNop=rs.getInt("mucPhat");
							qd_ls.get(qd_ls.size()-1).getXp_ls().add(it);
						}
						last=soQDXPHC;
						
					}
					
					
					handler.callBack(new PagingWrapper<List<ItemQuyetDinh>>(qd_ls,total));
		//			System.out.println(qd_ls.get(0).getXp_ls().size());
					
				
					con.close();
					
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					e.printStackTrace();
					logger.log(Level.WARNING,"Request không hợp lệ");
					handler.errorCallBack("SERVER: Lỗi SQL");
					
				}
			}});
	}

	@Override
	public void findBienBanTheoSoBBVPHC(String so_bbvphc, Integer page_offset, CallBackHandler handler)
			throws RemoteException {
		// TODO Auto-generated method stub
				if(handler==null||so_bbvphc==null||page_offset==null||page_offset<0) return;
				TaskManager.addTask(new Task()
				{
					
					public void toDo() throws RemoteException{
						try {
							Connection con=MySQLConnectionTemplate.getConnection();
							CallableStatement stmt = con.prepareCall("{CALL TiemKiemBienBanTheoSoBBVPHC(?,?,?)}");
							stmt.setString(1,so_bbvphc);
							stmt.setInt(2,page_offset);
							stmt.registerOutParameter(3, java.sql.Types.INTEGER);
							ResultSet rs = stmt.executeQuery();
							
							Integer total=stmt.getInt(3);
					
							
							List<ItemBienBan> bb_ls=new ArrayList<ItemBienBan>();
							while(rs.next()) 
							{
								bb_ls.add(
										new ItemBienBan(
												rs.getInt("soBBVPHC"),
												rs.getInt("maCanBo"),
												rs.getString("hoTenCanBo"),
												rs.getDate("ngayLap"),
												rs.getString("soCMND"),
												rs.getString("hoTenNguoiViPham"),
												rs.getDate("ngaySinh"),
												rs.getString("diaChi"),
												rs.getString("sdt"),
												rs.getString("moTaHanhVi")
												
										)
										
										
								);
							}
							
							handler.callBack(new PagingWrapper<List<ItemBienBan>>(bb_ls,total));
							con.close();
						
							
							
						} catch (ClassNotFoundException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (SQLException e) {
							logger.log(Level.WARNING,"Request không hợp lệ");
							handler.errorCallBack("SERVER: Lỗi SQL");
							e.printStackTrace();
						}
					}});
		
	}

	@Override
	public void findTatCaTangVat(Integer page_offset, CallBackHandler handler) throws RemoteException {
		// TODO Auto-generated method stub
		if(handler==null) return;
		if(page_offset==null||page_offset<0) return;
		TaskManager.addTask(new Task()
		{
			
			public void toDo() throws RemoteException{
				try {
					Connection con=MySQLConnectionTemplate.getConnection();
					CallableStatement stmt = con.prepareCall("{CALL TimKiemTatCaTangVat(?,?)}");
					stmt.setInt(1,page_offset);
					stmt.registerOutParameter(2, java.sql.Types.INTEGER);
					ResultSet rs = stmt.executeQuery();
					
					Integer total=stmt.getInt(2);
					
					ArrayList<ItemTangVat> tang_vat_list=new ArrayList<ItemTangVat>();
					while(rs.next()) {
						tang_vat_list.add(
								new ItemTangVat(
									rs.getInt("maTangVat"),
									rs.getString("tenTangVat"),
									rs.getInt("soLuong"),
									rs.getString("trangThai"),
									rs.getInt("coSoLuuTru"),
									rs.getString("tenCoSo"),
									rs.getString("ghiChu")
								)
						);
					}
					
				
					logger.log(Level.SEVERE,"Truy vấn findTatCaTangVat() {0} ItemTangVat",tang_vat_list.size());
					handler.callBack(new PagingWrapper<List<ItemTangVat>>(tang_vat_list,total));
					
					con.close();
					
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					logger.log(Level.WARNING,"Request không hợp lệ");
					handler.errorCallBack("SERVER: Lỗi SQL");
					e.printStackTrace();
				}
			}});
	}

	
	

	
}
