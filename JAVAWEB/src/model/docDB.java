package model;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Category;
import beans.Product;
import model.SQLServerConnUtils_SQLJDBC;



public class docDB {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public List<Product> getAllproduct(){
		List<Product> list = new ArrayList<>();
		String query = "Select * from product";
		try {
			conn = new SQLServerConnUtils_SQLJDBC().getJDBCConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new Product(rs.getString(1), 
						rs.getString(2), 
						rs.getFloat(3), 
						rs.getString(4),
						rs.getString(5),
						rs.getString(6)));
			}	
		} catch (Exception e) {
		}
		return list;
	}
	
	public List<Category> getAllcategory(){
		List<Category> listC = new ArrayList<>();
		String query = "Select * from category";
		try {
			conn = new SQLServerConnUtils_SQLJDBC().getJDBCConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				listC.add(new Category(rs.getString(1), rs.getString(2)));
			}	
		} catch (Exception e) {
		}
		return listC;
		}
	

	public Product getLast() {
		String query = "select * from product order by Id desc limit 1";
		try {
			conn = new SQLServerConnUtils_SQLJDBC().getJDBCConnection();// mo ket noi voi sql
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				return new Product(rs.getString(1), 
						rs.getString(2), 
						rs.getFloat(3), 
						rs.getString(4), 
						rs.getString(5),
						rs.getString(6));
			}
		} catch (Exception e) {
		}
		return null;
	}

	public void deleteProduct(String id){
		String sql = "Delete From product where Id= ?";
		try {
			conn = new SQLServerConnUtils_SQLJDBC().getJDBCConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.executeUpdate();
		}catch(Exception e){
			
		}
		
	}
	
	public void insertProduct(String productname, String price, String detail, String image, String category) {
		String sql = "Insert into product( Product, Price, Detail, Image, idc) values (?,?,?,?,?)";
		try {
			conn = new SQLServerConnUtils_SQLJDBC().getJDBCConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, productname);
			ps.setString(2, price);
			ps.setString(3, detail);
			ps.setString(4, image);
			ps.setString(5, category);
			ps.executeUpdate();
		}catch(Exception e){
			
		}
	}
	
	public List<Product> searchByName(String txtSearch){
		List<Product> list = new ArrayList<>();
		String sql = "select * from product where Product like ?";
		try {
			conn = new SQLServerConnUtils_SQLJDBC().getJDBCConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + txtSearch + "%");
			rs = ps.executeQuery();
			while(rs.next()){
				list.add(new Product(rs.getString(1), 
						rs.getString(2), 
						rs.getFloat(3), 
						rs.getString(4), 
						rs.getString(5),
						rs.getString(6)));
			}
		}catch(Exception e) {
		}
		return list;
	}
	
	public List<Product> searchByIDC(String idc){
		List<Product> list = new ArrayList<>();
		String sql = "select * from product where idc like ?";
		try {
			conn = new SQLServerConnUtils_SQLJDBC().getJDBCConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, idc);
			rs = ps.executeQuery();
			while(rs.next()){
				list.add(new Product(rs.getString(1), 
						rs.getString(2), 
						rs.getFloat(3), 
						rs.getString(4), 
						rs.getString(5),
						rs.getString(6)));
			}
		}catch(Exception e) {
		}
		return list;
	}
	
	
	public static Product findProduct(Connection conn, String id) throws SQLException {
        String sql = "Select Id, Product, Price, Detail, Image from product where Id=?";

        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, id);

        ResultSet rs = pstm.executeQuery();

        while (rs.next()) {
            String productname = rs.getString("Product");
            Float price = rs.getFloat("Price");
            String detail = rs.getString("Detail");
            String image = rs.getString("Image");
            Product product = new   Product(id, productname,price,detail,image);
            return product;
        }
        return null;
    }
	
	public void updateProduct(String productname, String price, String detail, String image, String category, String id) {
		String sql = "update  product set Product=?, Price=?, Detail=?, Image=?, idc=? where Id=?";
		try {
			conn = new SQLServerConnUtils_SQLJDBC().getJDBCConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, productname);
			ps.setString(2, price);
			ps.setString(3, detail);
			ps.setString(4, image);
			ps.setString(5, category);
			ps.setString(6, id);
			ps.executeUpdate();
		}catch(Exception e){
			
		}
	}
	
	
	
	
	public static void main(String[] args) {
		docDB db = new docDB();
		List<Product> list = db.getAllproduct();
		for(Product o : list) {
			System.out.println(o);
		}
	}
	
}
