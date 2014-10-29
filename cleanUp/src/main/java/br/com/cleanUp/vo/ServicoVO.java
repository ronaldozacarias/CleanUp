package br.com.cleanUp.vo;

import java.util.Date;
import java.util.List;

import br.com.cleanUp.model.Cliente;
import br.com.cleanUp.model.Diarista;
import br.com.cleanUp.model.Endereco;

public class ServicoVO {
	
	private String descricao;
	private int codigo;
	private List<Endereco> enderecos;
	private Date data;
	private Diarista diarista;
	private Cliente cliente;	
	
	public Cliente getCliente() {
		return cliente;
	}
	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}	
	public List<Endereco> getEnderecos() {
		return enderecos;
	}
	public void setEnderecos(List<Endereco> enderecos) {
		this.enderecos = enderecos;
	}
	public Date getData() {
		return data;
	}
	public void setData(Date data) {
		this.data = data;
	}
	public Diarista getDiarista() {
		return diarista;
	}
	public void setDiarista(Diarista diarista) {
		this.diarista = diarista;
	}
	

}
