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
	
	}