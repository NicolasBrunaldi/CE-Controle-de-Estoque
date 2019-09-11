package br.com.ykz.controledeestoque.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.ykz.controledeestoque.dao.ClienteDao;
import br.com.ykz.controledeestoque.dao.MovimentacaoDao;
import br.com.ykz.controledeestoque.dao.ProdutoDao;
import br.com.ykz.controledeestoque.models.Cliente;
import br.com.ykz.controledeestoque.models.Movimentacao;
import br.com.ykz.controledeestoque.models.Produto;
import br.com.ykz.controledeestoque.models.TipoMovimentacao;

@Controller
@RequestMapping("/produtos")
public class ProdutoController {

	@Autowired
	private ClienteDao clienteDao;

	@Autowired
	private ProdutoDao produtoDao;

	@Autowired
	private MovimentacaoDao movimentacaoDao;

	@RequestMapping(value = "/{nome}", method = RequestMethod.GET)
	public ModelAndView listaProdutos(@PathVariable String nome) {
		ModelAndView modelAndView = new ModelAndView("produtos/lista");
		Cliente cliente = clienteDao.getCliente(nome);
		List<Produto> produtos = produtoDao.getListaProdutos(nome);
		if(produtos.isEmpty()) {
			return form(nome);
		}
		modelAndView.addObject("cliente", cliente);
		modelAndView.addObject("produtos", produtos);
		return modelAndView;
	}

	@RequestMapping(value = "/{nome}/form")
	public ModelAndView form(@PathVariable String nome) {
		ModelAndView modelAndView = new ModelAndView("produtos/form");
		Cliente cliente = clienteDao.getCliente(nome);
		modelAndView.addObject("cliente", cliente);
		return modelAndView;
	}

	@RequestMapping(value = "/{nome}", method = RequestMethod.POST)
	public ModelAndView gravarProduto(@Valid Produto produto, BindingResult result, @PathVariable String nome) {

		if (result.hasErrors()) {
			return form(nome);
		} else {
			
			Cliente cliente = clienteDao.getCliente(nome);
			produto.setCliente(cliente);
			produtoDao.persist(produto);

			return new ModelAndView("redirect:/produtos/{nome}");
		}

	}

	@RequestMapping(value = "/{nome}/confirm/{id}")
	public ModelAndView confirmaExcluir(@PathVariable String nome, @PathVariable Integer id) {
		ModelAndView modelAndView = new ModelAndView("produtos/confirm");
		Cliente cliente = clienteDao.getCliente(nome);
		Produto produto = produtoDao.getProduto(id);
		modelAndView.addObject("cliente", cliente);
		modelAndView.addObject("produto", produto);

		return modelAndView;
	}

	@RequestMapping(value = "/{nome}/remove/{id}")
	public ModelAndView removeProduto(@PathVariable String nome, @PathVariable Integer id) {
		produtoDao.removeMovimentacoes(id);
		produtoDao.remove(id);
		return new ModelAndView("redirect:/produtos/{nome}");
	}

	@RequestMapping(value = "/{nome}/formEntrada/{id}")
	public ModelAndView formEntrada(@PathVariable String nome, @PathVariable Integer id) {
		ModelAndView modelAndView = new ModelAndView("produtos/formEntrada");
		Cliente cliente = clienteDao.getCliente(nome);
		Produto produto = produtoDao.getProduto(id);
		modelAndView.addObject("cliente", cliente);
		modelAndView.addObject("produto", produto);

		return modelAndView;
	}

	@RequestMapping(value = "/{nome}/entra/{id}", method = RequestMethod.POST)
	public ModelAndView entrada(@Valid Movimentacao movimentacao, BindingResult result, @PathVariable String nome,
			@PathVariable Integer id) {

		if (result.hasErrors()) {
			return formEntrada(nome, id);
		} else {

			movimentacao.setTipo(TipoMovimentacao.ENTRADA);

			Produto produto = produtoDao.getProduto(id);

			Integer novoEstoque = produto.getEstoque() + movimentacao.getQuantidade();
			movimentacao.setProduto(produto);
			movimentacaoDao.persist(movimentacao);

			produto.setEstoque(novoEstoque);
			produtoDao.persist(produto);

			return new ModelAndView("redirect:/produtos/{nome}");

		}
	}

	@RequestMapping(value = "/{nome}/formSaida/{id}")
	public ModelAndView formSaida(@PathVariable String nome, @PathVariable Integer id) {
		ModelAndView modelAndView = new ModelAndView("produtos/formSaida");
		Cliente cliente = clienteDao.getCliente(nome);
		Produto produto = produtoDao.getProduto(id);
		modelAndView.addObject("cliente", cliente);
		modelAndView.addObject("produto", produto);

		return modelAndView;
	}

	@RequestMapping(value = "/{nome}/saida/{id}", method = RequestMethod.POST)
	public ModelAndView saida(@Valid Movimentacao movimentacao, BindingResult result, @PathVariable String nome,
			@PathVariable Integer id) {

		if (result.hasErrors()) {
			return formSaida(nome, id);
		} else {

			Produto produto = produtoDao.getProduto(id);

			if (produto.getEstoque() < movimentacao.getQuantidade()) {

				return new ModelAndView("redirect:/produtos/{nome}/alerta/{id}");
			} else {
				movimentacao.setTipo(TipoMovimentacao.SAIDA);

				Integer novoEstoque = produto.getEstoque() - movimentacao.getQuantidade();
				movimentacao.setProduto(produto);

				movimentacaoDao.persist(movimentacao);

				produto.setEstoque(novoEstoque);
				produtoDao.persist(produto);

				return new ModelAndView("redirect:/produtos/{nome}");
			}
		}

	}

	@RequestMapping(value = "/{nome}/alerta/{id}")
	public ModelAndView alerta(@PathVariable String nome, @PathVariable Integer id) {
		ModelAndView modelAndView = new ModelAndView("/produtos/formAlerta");
		Cliente cliente = clienteDao.getCliente(nome);
		Produto produto = produtoDao.getProduto(id);
		modelAndView.addObject("cliente", cliente);
		modelAndView.addObject("produto", produto);

		return modelAndView;
	}

}
