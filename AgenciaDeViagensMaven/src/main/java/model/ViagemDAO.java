package model;

import java.sql.Connection;
import java.time.LocalDate;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import VO.Viagem;

public class ViagemDAO {
	private DataSource dataSource;
	
	public ViagemDAO(DataSource dataSource) {
		super();
		this.dataSource = dataSource;
		
	}

	public boolean inserirViagem(String destino, String pais, int duracao, double vDiaria, LocalDate dtViagem , String meioTrans, double valorPassagem, int nPessoas) {
		Connection conexao = null;
		PreparedStatement stmt = null;
		int resultado;
		
		try {
			conexao = dataSource.getConnection();
			String sql = "INSERT INTO viagem (destino, pais, duracao, vDiaria, dtViagem, meioTrans, valorPassagem, nPessoas) values (?,?,?,?,?,?,?,?);";
			stmt = conexao.prepareStatement(sql);
			stmt.setString(1, destino);
			stmt.setString(2, pais);
			stmt.setInt(3, duracao);
			stmt.setDouble(4, vDiaria);
			stmt.setDate(5, java.sql.Date.valueOf(dtViagem));
			stmt.setString(6, meioTrans);
			stmt.setDouble(7, valorPassagem);
			stmt.setInt(8, nPessoas );
			
			resultado = stmt.executeUpdate();
		}
		catch(SQLException e) {
			e.printStackTrace();
			resultado = 0;
		}
		finally {
			fecharConexao(conexao,stmt,null);
		}
		return resultado == 1;
	}
	

	public ArrayList<Viagem> consultarViagens(){
		ArrayList<Viagem> listaViagens = new ArrayList<> ();
		Connection conexao = null;
		PreparedStatement stmt = null;
		ResultSet resultado = null;
		
		try {
			conexao = dataSource.getConnection();
			String sql = "SELECT * FROM viagem;";
			stmt = conexao.prepareStatement(sql);
			resultado = stmt.executeQuery();
			
			while (resultado.next()) {
				int id = resultado.getInt("id");
				String destino = resultado.getString("destino");
				String pais = resultado.getString("pais");
				int duracao = resultado.getInt("duracao");
				double vDiaria = resultado.getDouble("vDiaria");
				LocalDate dtViagem = resultado.getDate("dtViagem").toLocalDate();				
				String meioTrans = resultado.getString("meioTrans");
				double valorPassagem  = resultado.getDouble("valorPassagem");
				int nPessoas = resultado.getInt("nPessoas");

				Viagem viagem = new Viagem(id,destino,pais,duracao,vDiaria,dtViagem,meioTrans,valorPassagem,nPessoas);
				
				listaViagens.add(viagem);
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			fecharConexao(conexao,stmt,resultado);
		}
		return listaViagens;
	}
	
	private void fecharConexao(Connection conexao, PreparedStatement statement ,ResultSet resultado) {
		try {
			if(conexao != null)
				conexao.close();
			if(statement != null)
				statement.close();
			if(resultado != null)
				resultado.close();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}

	public boolean removerViagem(int id) {
		Connection conexao = null;
		PreparedStatement stmt = null;
		int resultado;
		
		try {
			conexao = dataSource.getConnection();
			String sql = "delete from viagem where id = ?;";
			stmt = conexao.prepareStatement(sql);
			stmt.setInt(1, id);
			resultado = stmt.executeUpdate();		
		}catch (Exception e ) {
			e.printStackTrace();
			resultado = 0;
			
		}finally {
			fecharConexao(conexao,stmt,null);
		}
	
		return resultado == 1;
	}
	public Viagem buscarViagemPorId(int id) {
	    Viagem viagem = null;

	    Connection conexao = null;
	    PreparedStatement stmt = null;
	    ResultSet rs = null;

	    try {
	        conexao = dataSource.getConnection();

	        String sql = "SELECT * FROM viagem WHERE id = ?";
	        stmt = conexao.prepareStatement(sql);

	        stmt.setInt(1, id);

	        rs = stmt.executeQuery();

	        if (rs.next()) {
	            viagem = new Viagem(
	                rs.getInt("id"),
	                rs.getString("destino"),
	                rs.getString("pais"),
	                rs.getInt("duracao"),
	                rs.getDouble("vDiaria"),
	                rs.getDate("dtViagem").toLocalDate(),
	                rs.getString("meioTrans"),
	                rs.getDouble("valorPassagem"),
	                rs.getInt("nPessoas")
	            );
	        }
	    }
	    catch (SQLException e) {
	        e.printStackTrace();
	    }
	    finally {
	        fecharConexao(conexao, stmt, rs);
	    }
		return viagem;
	}
}