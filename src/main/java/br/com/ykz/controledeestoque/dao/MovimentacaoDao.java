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

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.ykz.controledeestoque.models.Movimentacao;
import br.com.ykz.controledeestoque.models.Produto;

@Repository
@Transactional
public class MovimentacaoDao {

	@PersistenceContext
	private EntityManager manager;

	public void persist(Movimentacao movimentacao) {

			manager.merge(movimentacao);
	}

	public List<Movimentacao> getListaMovimentacao(Integer id) {
		CriteriaBuilder criteriaBuilder = manager.getCriteriaBuilder();
		CriteriaQuery<Movimentacao> query = criteriaBuilder.createQuery(Movimentacao.class);
		Root<Movimentacao> root = query.from(Movimentacao.class);

		Path<Integer> path = root.<Produto>get("produto").<Integer>get("id");
		Predicate predicate = criteriaBuilder.equal(path, id);
		query.where(predicate);

		TypedQuery<Movimentacao> typedQuery = manager.createQuery(query);
		typedQuery.setHint("org.hibernate.cacheable", "true");
		return typedQuery.getResultList();
	}

	public void remove(Movimentacao movimentacao) {
		manager.remove(movimentacao);
	}
}
