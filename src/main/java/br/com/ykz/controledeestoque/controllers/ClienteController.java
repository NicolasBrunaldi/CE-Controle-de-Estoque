package br.com.ykz.controledeestoque.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.ykz.controledeestoque.dao.ClienteDao;
import br.com.ykz.controledeestoque.models.Cliente;

@Controller
@RequestMapping("/clientes")
public class ClienteController {

	@Autowired
	private ClienteDao clienteDao;

	@RequestMapping("/form")
	public ModelAndView form() {

		return new ModelAndView("clientes/form");
	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView listaClientes() {
		ModelAndView modelAndView = new ModelAndView("/clientes/lista");
		List<Cliente> clientes = clienteDao.getListaClientes();
		modelAndView.addObject("clientes", clientes);

		return modelAndView;
	}

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView persistCliente(@Valid Cliente cliente, BindingResult result) {

		if (result.hasErrors()) {
			return form();
		} else {
			try {
				clienteDao.persist(cliente);
			} catch (DataIntegrityViolationException e) {
				return new ModelAndView("redirect:clientes/formAlerta");
			}

			return new ModelAndView("redirect:/clientes");

		}

	}

	@RequestMapping(value = "/formAlerta")
	public ModelAndView formAlerta() {

		ModelAndView modelAndView = new ModelAndView("/clientes/formAlerta");
		return modelAndView;
	}

	@RequestMapping(value = "/{nome}/confirm")
	public ModelAndView confirmaExcluir(@PathVariable String nome) {
		ModelAndView modelAndView = new ModelAndView("clientes/confirm");
		Cliente cliente = clienteDao.getCliente(nome);
		modelAndView.addObject("cliente", cliente);
		return modelAndView;

	}

	@RequestMapping(value = "/remove/{nome}")
	public ModelAndView removeCliente(@PathVariable String nome) {
		clienteDao.remove(nome);
		return new ModelAndView("redirect:/clientes");
	}
}
