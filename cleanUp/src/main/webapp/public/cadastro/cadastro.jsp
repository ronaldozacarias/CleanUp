<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>



<div class="member-details" ng-controller="testeController">


<form name="newPeopleForm" class="form-horizontal" role="form">

      
      <!--       NOME					    ---------------------------------------------------------------------->
      <div class="form-group">
        <label for="inputName" class="col-sm-2 control-label">*<spring:message code="contacts.name"/>:</label>
        <div class="col-sm-4">
          <input class="form-control" 
          		 id="inputName" 
          		 required
                 autofocus
                 ng-model="cliente.nome"
                 name="name"
                 placeholder="<spring:message code='contact'/>&nbsp;<spring:message code='contacts.name'/>">
        </div>
<!--         <div class="input-append"> -->
<!--         	<label> -->
<!--             	<span class="alert alert-error" -->
<!--                       ng-show="displayValidationError && newPeopleForm.name.$error.required"> -->
<%--                       <spring:message code="required"/> --%>
<!--                	</span> -->
<!--         	</label> -->
<!--         </div> -->
      </div>
      
      <!--       FONE					    ---------------------------------------------------------------------->
      <div class="form-group">
        <label for="inputFone" class="col-sm-2 control-label">*<spring:message code="contacts.phone"/>:</label>
        <div class="col-sm-4">
          <input class="form-control" 
           		 id="inputFone"
           		 required
                 ng-model="cliente.telefone"
                 name="phoneNumber"
                 placeholder="<spring:message code='sample.phone'/> ">
        </div>
<!-- 		<div class="input-append"> -->
<!--        		<label> -->
<!--            		<span class="alert alert-error" -->
<!--                       ng-show="displayValidationError && newPeopleForm.phoneNumber.$error.required"> -->
<%--                		  <spring:message code="required"/> --%>
<!--             	</span> -->
<!--         	</label> -->
<!--     	</div> -->
      </div>
      
	  <!--       BUTTONS ---------------------------------------------------------------------------->
      <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
          <button type="submit" class="btn btn-success" ng-click="createPeople(newPeopleForm)">
          		<spring:message code="create"/>
          </button>
<!--           <button type="submit" class="btn btn-danger" ng-click="removeContact(newPeopleForm);"> -->
<%--           		<spring:message code="delete"/> --%>
<!--           </button> -->
        </div>        
      </div>
      
      
    </form>
    <br>
        
<!------------------------------------------------------------------         TESTE DATAGRID -->
        
<!--         <table class="table table-bordered table-striped" ng-show="(contacts).length != 0"> -->
<!--                 <thead> -->
<!--                 <tr> -->
<%--                     <th scope="col"><spring:message code="contacts.name"/></th> --%>
<%--                     <th scope="col"><spring:message code="contacts.phone"/></th> --%>
<!--                     <th scope="col"></th> -->
<!--                 </tr> -->
<!--                 </thead> -->
<!--                 <tbody> -->
<!--                 <tr ng-repeat="contact in contacts | orderBy:'name'" > -->
<!--                     <td class="tdContactsCentered">{{contact.name}}</td> -->
<!--                     <td class="tdContactsCentered">{{contact.phoneNumber}}</td> -->
<!--                     <td class="tdContactsCentered"><input class="checkbox" type="checkbox" ng-model="contact.selected"></td> -->
<!--                 </tr> -->
<!--                 </tbody> -->
<!--          </table> -->
 </form>
<!--          RETORNA O JSON DE CONTACTS -->
<!--          <p>{"contatos":{{contacts | json}}}</p> -->
        
<!-------------------------------------------------------------------		   END TEST DATAGRID       -->

        
</div>

<!-- Users Controller -->
<script src="<c:url value='/resources/js/pages/testeController.js' />"></script>