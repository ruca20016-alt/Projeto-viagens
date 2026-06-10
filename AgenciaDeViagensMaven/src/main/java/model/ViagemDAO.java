package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class ViagemDAO {
	private DataSource dataSource;
	
	
	public ViagemDAO(DataSource dataSource) {
		super();
		this.dataSource = dataSource;
		
	}
}