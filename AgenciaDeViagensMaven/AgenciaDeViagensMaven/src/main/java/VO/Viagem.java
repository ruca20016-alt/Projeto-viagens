
package VO;

import java.time.LocalDate;

public class Viagem {

	private int id;
	private String destino;
	private String pais;
	private int duracao;
	private double vDiaria;
	private LocalDate dtViagem;
	private String meioTrans;
	private double valorPassagem;
	private int nPessoas;

	public Viagem(int id, String destino, String pais, int duracao, double vDiaria, LocalDate dtViagem,
			String meioTrans, double valorPassagem, int nPessoas) {
		this.id = id;
		this.destino = destino;
		this.pais = pais;
		this.duracao = duracao;
		this.vDiaria = vDiaria;
		this.dtViagem = dtViagem;
		this.meioTrans = meioTrans;
		this.valorPassagem = valorPassagem;
		this.nPessoas = nPessoas;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDestino() {
		return destino;
	}

	public void setDestino(String destino) {
		this.destino = destino;
	}

	public String getPais() {
		return pais;
	}

	public void setPais(String pais) {
		this.pais = pais;
	}

	public int getDuracao() {
		return duracao;
	}

	public void setDuracao(int duracao) {
		this.duracao = duracao;
	}

	public double getVDiaria() {
		return vDiaria;
	}

	public void setVDiaria(double vDiaria) {
		this.vDiaria = vDiaria;
	}

	public LocalDate getDtViagem() {
		return dtViagem;
	}

	public void setDtViagem(LocalDate dtViagem) {
		this.dtViagem = dtViagem;
	}

	public String getMeioTrans() {
		return meioTrans;
	}

	public void setMeioTrans(String meioTrans) {
		this.meioTrans = meioTrans;
	}

	public double getValorPassagem() {
		return valorPassagem;
	}

	public void setValorPassagem(double valorPassagem) {
		this.valorPassagem = valorPassagem;
	}

	public int getNPessoas() {
		return nPessoas;
	}

	public void setNPessoas(int nPessoas) {
		this.nPessoas = nPessoas;
	}

	public double calcularCustoTotal() {
	    return (vDiaria * duracao) + (valorPassagem * nPessoas);
	}

	public double calcularCustoPorPessoa() {
	    if (nPessoas == 0) {
	        return 0;
	    }
	    return calcularCustoTotal() / nPessoas;
	}

	

	public LocalDate calcularDataFinalViagem() {
	    if (dtViagem == null) {
	        return null;
	    }

	    return dtViagem.plusDays(duracao);
	}

}
