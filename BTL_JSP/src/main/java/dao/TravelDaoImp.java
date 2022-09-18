package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import entity.Travels;
import util.JDBCUtil;

public class TravelDaoImp implements Dao<Travels> {
	@Override
	public List<Travels> getAll() {
		List<Travels> dataList = new ArrayList<Travels>();
		// TODO Auto-generated method stub
		Connection connection = JDBCUtil.getConnection();
		try {
			PreparedStatement pStatement = connection.prepareStatement("select * from Travels");
			ResultSet rSet = pStatement.executeQuery();
			while (rSet.next()) {
				Travels travels = new Travels();
				travels.setTrId(rSet.getInt("trId"));
				travels.setName(rSet.getString("name"));
				travels.setPrice(rSet.getFloat("price"));
				travels.setDays(rSet.getInt("days"));
				travels.setCatId(rSet.getInt("catId"));
				travels.setStartDate(rSet.getDate("startDate"));
				dataList.add(travels);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dataList;
	}
	@Override
	public Travels getById(int id) {
		// TODO Auto-generated method stub
		Connection connection = JDBCUtil.getConnection();
		Travels travels = new Travels();
		try {
			PreparedStatement pStatement = connection.prepareStatement("select * from Travels where trId=?");
			pStatement.setInt(1, id);
			ResultSet rSet = pStatement.executeQuery();
			while (rSet.next()) {
				travels.setTrId(rSet.getInt("trId"));
				travels.setName(rSet.getString("name"));
				travels.setPrice(rSet.getFloat("price"));
				travels.setDays(rSet.getInt("days"));
				travels.setCatId(rSet.getInt("catId"));
				travels.setStartDate(rSet.getDate("startDate"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return travels;
	}

	@Override
	public boolean add(Travels t) {
		Connection connection = JDBCUtil.getConnection();
		try {
			PreparedStatement pStatement = connection
					.prepareStatement("insert into Travels(trId,name,price,days,catId,startDate) values (?,?,?,?,?,?)");
			pStatement.setInt(1, t.getTrId());
			pStatement.setString(2, t.getName());
			pStatement.setFloat(3, t.getPrice());
			pStatement.setInt(4, t.getDays());
			pStatement.setInt(5, t.getCatId());
			pStatement.setDate(6, new Date(t.getStartDate().getTime()));
			int ketQua = pStatement.executeUpdate();
			if (ketQua > 0) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean edit(Travels t) {
		Connection connection = JDBCUtil.getConnection();
		try {
			PreparedStatement pStatement = connection.prepareStatement(
					"update Travels set name = ? , price=?,days=? , catId=?,startDate=? where trId=?");
			pStatement.setString(1, t.getName());
			pStatement.setFloat(2, t.getPrice());
			pStatement.setInt(3, t.getDays());
			pStatement.setInt(4, t.getCatId());
			pStatement.setDate(5, new Date(t.getStartDate().getTime()));
			pStatement.setInt(6, t.getTrId());
			int ketQua = pStatement.executeUpdate();
			if (ketQua > 0) {
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
		Connection connection = JDBCUtil.getConnection();
		try {
			PreparedStatement pStatement = connection.prepareStatement("delete from Travels where trId=?");
			pStatement.setInt(1, id);
			int ketQua = pStatement.executeUpdate();
			if (ketQua > 0) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

}
