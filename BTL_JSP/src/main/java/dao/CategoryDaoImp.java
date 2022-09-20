package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import entity.Categories;
import util.JDBCUtil;

public class CategoryDaoImp implements Dao<Categories>{

	@Override
	public List<Categories> getAll() {
		List<Categories> dataList = new ArrayList<Categories>();
		Connection connection = JDBCUtil.getConnection();
		try {
			PreparedStatement pStatement = connection.prepareStatement("select * from Categories");
			ResultSet rSet = pStatement.executeQuery();
			while (rSet.next()) {
				Categories categories = new Categories();
				categories.setCatId(rSet.getInt("catId"));
				categories.setCatname(rSet.getString("catname"));
				categories.setCounts(rSet.getInt("counts"));
				dataList.add(categories);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dataList;
	}

	@Override
	public Categories getById(int id) {
		// TODO Auto-generated method stub
		Categories categories = new Categories();
		Connection connection = JDBCUtil.getConnection();
		try {
			PreparedStatement pStatement = connection.prepareStatement("select * from Categories where catId = ?");
			pStatement.setInt(1, id);
			ResultSet rSet = pStatement.executeQuery();
			while (rSet.next()) {
				categories.setCatId(rSet.getInt("catId"));
				categories.setCatname(rSet.getString("catname"));
				categories.setCounts(rSet.getInt("counts"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return categories;
	}

	@Override
	public boolean add(Categories t) {
		// TODO Auto-generated method stub
		Connection connection = JDBCUtil.getConnection();
		try {
			PreparedStatement pStatement = connection.prepareStatement("insert into Categories(catId,catname,counts) values (?,?,?)");
			pStatement.setInt(1, t.getCatId());
			pStatement.setString(2, t.getCatname());
			pStatement.setInt(3, t.getCounts());
			int ketQua = pStatement.executeUpdate();
			if (ketQua>0) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean edit(Categories t) {
		Connection connection = JDBCUtil.getConnection();
		try {
			PreparedStatement pStatement = connection.prepareStatement("update Categories set catname=?, counts=? where catId=?");
			pStatement.setString(1, t.getCatname());
			pStatement.setInt(2, t.getCounts());
			pStatement.setInt(3, t.getCatId());
			int ketQua = pStatement.executeUpdate();
			if (ketQua>0) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean remote(int id) {
		// TODO Auto-generated method stub
		Connection connection = JDBCUtil.getConnection();
		try {
			PreparedStatement pStatement = connection.prepareStatement("delete from Categories where catId=?");
			pStatement.setInt(1, id);
			int ketQua = pStatement.executeUpdate();
			if (ketQua>0) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public List<Categories> getLikeName(String key) {
		List<Categories> listData = new ArrayList<Categories>();
		Connection connection = JDBCUtil.getConnection();
		try {
			PreparedStatement pStatement = connection.prepareStatement("select * from Categories where catname like ?");
			pStatement.setString(1, "%"+key+"%");
			ResultSet resultSet = pStatement.executeQuery();
			while(resultSet.next()){
				Categories categories = new Categories();
				categories.setCatId(resultSet.getInt("catId"));
				categories.setCatname(resultSet.getString("catname"));
				categories.setCounts(resultSet.getInt("counts"));
				listData.add(categories);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listData;
	}





}
