package br.com.ykz.controledeestoque.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.ykz.controledeestoque.dao.ClienteDao;
import br.com.ykz.controledeestoque.dao.MovimentacaoDao;
import br.com.ykz.controledeestoque.dao.ProdutoDao;
import br.com.ykz.controledeestoque.models.Cliente;
import br.com.ykz.controledeestoque.models.Movimentacao;
import br.com.ykz.controledeestoque.models.Produto;

@Controller
@RequestMapping("/movimentacao")
public class MovimentacaoController {
	
	@Autowired
	private ClienteDao clienteDao;

	@Autowired
	private ProdutoDao produtoDao;

	@Autowired
	private MovimentacaoDao movimentacaoDao;
	
	@RequestMapping(value = "/{nome}/historico/{id}")
	public ModelAndView historico( @PathVariable String nome, @PathVariable Integer id) {
		ModelAndView modelAndView = new ModelAndView("movimentacao/lista");
		
		Cliente cliente = clienteDao.getCliente(nome);
		Produto produto = produtoDao.getProduto(id);
		List<Movimentacao> movimentacoes = movimentacaoDao.getListaMovimentacao(id);
		
		modelAndView.addObject("cliente", cliente);
		modelAndView.addObject("produto", produto);
		modelAndView.addObject("movimentacoes", movimentacoes);
		
		return modelAndView;
	}
}
