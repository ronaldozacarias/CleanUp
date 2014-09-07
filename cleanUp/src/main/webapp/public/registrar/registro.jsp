<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div ng-controller="cadastroController">

	<div>
		<form name="newPeople" role="form">
		
			<div>
				<input ng-model="pessoa.nome" type="text" placeholder="Nome" required />
			</div>
			
			<div>
				<input ng-model="pessoa.rg" type="text" placeholder="Identidade" required />
			</div>
			
			<div>
				<input ng-model="pessoa.nascimento" type="date" placeholder="Nascimento" required />
			</div>
			
			<div>
				<input ng-model="pessoa.fone" type="text" placeholder="Telefone" required />
			</div>
			
			<div>
				<input ng-model="pessoa.cpf" type="text" placeholder="CPF" required />
			</div>
			
			<div>
				<input ng-model="endereco.rua" type="text" placeholder="Rua" required />
			</div>
			
			<div>
				<input ng-model="endereco.numero" type="text" placeholder="Número" required />
			</div>
			
			<div>
				<input ng-model="endereco.bairro" type="text" placeholder="Bairro" required />
			</div>
			
			<div>
				<input ng-model="endereco.cidade" type="text" placeholder="Cidade" required />
			</div>
			
			<div>
				<input ng-model="endereco.cep" type="text" placeholder="CEP" required />
			</div>
			
			<div>
				<input ng-model="usuario.email" type="text" placeholder="Email" required />
			</div>
			
			<div>
				<input ng-model="usuario.senha" type="text" placeholder="Senha" required />
			</div>
			
			<div>
				<select ng-model="perfil" ng-options="p as p for p in perfils">
				
				</select>
			</div>
			
			<button type="submit" name="submit" ng-click="save(newPeople)">Salvar</button>
		
		</form>
		
	</div>


</div>
<script src="<c:url value='/resources/js/pages/cadastro.js' />"></script>