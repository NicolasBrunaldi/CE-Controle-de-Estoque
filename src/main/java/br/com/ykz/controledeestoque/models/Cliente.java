package br.com.ykz.controledeestoque.models;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
public class Cliente {
	
	@Id	
	@NotEmpty(message = "Insira um nome")
	@NotBlank
	private String nome;
	
	@OneToMany(mappedBy = "cliente")
	private List<Produto> produtos;

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public List<Produto> getProdutos() {
		return produtos;
	}

	public void setProdutos(List<Produto> produtos) {
		this.produtos = produtos;
	}

	@Override
	public String toString() {
		return nome ;
	}
}
