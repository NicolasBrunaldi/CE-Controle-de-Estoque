package br.com.ykz.controledeestoque.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.ykz.controledeestoque.models.Cliente;
import br.com.ykz.controledeestoque.models.Produto;

@Repository
@org.springframework.transaction.annotation.Transactional
public class ClienteDao {

	@PersistenceContext
	private EntityManager manager;

	@Autowired
	private ProdutoDao produtoDao;

	public void persist(Cliente cliente) {

		manager.persist(cliente);
		
	}

	public List<Cliente> getListaClientes() {

		CriteriaBuilder criteriaBuilder = manager.getCriteriaBuilder();
		CriteriaQuery<Cliente> query = criteriaBuilder.createQuery(Cliente.class);
		query.from(Cliente.class);

		TypedQuery<Cliente> typedQuery = manager.createQuery(query);
		typedQuery.setHint("org.hibernate.cacheable", "true");
		return typedQuery.getResultList();
	}

	public Cliente getCliente(String nome) {
		Cliente cliente = manager.find(Cliente.class, nome);
		return cliente;
	}

	public void remove(String nome) {
		Cliente cliente = getCliente(nome);
		List<Produto> listaProdutos = produtoDao.getListaProdutos(nome);
		for (Produto produto : listaProdutos) {
			Integer id2 = produto.getId();
			produtoDao.removeMovimentacoes(id2);
			produtoDao.remove(produto);

		}
		manager.remove(cliente);
	}
}
