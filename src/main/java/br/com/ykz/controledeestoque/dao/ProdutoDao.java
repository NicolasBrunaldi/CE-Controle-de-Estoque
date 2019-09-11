package br.com.ykz.controledeestoque.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.ykz.controledeestoque.models.Cliente;
import br.com.ykz.controledeestoque.models.Movimentacao;
import br.com.ykz.controledeestoque.models.Produto;

@Repository
@Transactional
public class ProdutoDao {

	@PersistenceContext
	private EntityManager manager;

	@Autowired
	private MovimentacaoDao movimentacaoDao;

	public void persist(Produto produto) {
		
		manager.merge(produto);
	}

	public List<Produto> getListaProdutos(String nome) {

		CriteriaBuilder criteriaBuilder = manager.getCriteriaBuilder();
		CriteriaQuery<Produto> query = criteriaBuilder.createQuery(Produto.class);
		Root<Produto> root = query.from(Produto.class);

		Path<String> path = root.<Cliente>get("cliente").<String>get("nome");

		Predicate predicate = criteriaBuilder.like(path, nome);
		query.where(predicate);
		TypedQuery<Produto> typedQuery = manager.createQuery(query);
		typedQuery.setHint("org.hibernate.cacheable", "true");
		return typedQuery.getResultList();
	}

	public Produto getProduto(Integer id) {

		Produto produto = manager.find(Produto.class, id);
		return produto;
	}

	public void remove(Integer id) {

		Produto produto = getProduto(id);
		manager.remove(produto);
	}

	public void remove(Produto produto) {

		manager.remove(produto);
	}

	public void removeMovimentacoes(Integer id) {
		List<Movimentacao> listaMovimentacao = movimentacaoDao.getListaMovimentacao(id);
		for (Movimentacao movimentacao : listaMovimentacao) {
			movimentacaoDao.remove(movimentacao);
		}
	}
}
