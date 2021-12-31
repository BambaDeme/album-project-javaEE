<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="beans.Users"%>
<%@page import="java.util.ArrayList"%>

<%-- <% String appRoot=request.getContextPath(); %> --%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="users" scope="request" type="ArrayList<Users>"/>


<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>Gestion des Utilisateurs </title>
	<%--<link rel="stylesheet" type="text/css" href="<c:url value="/css/design.css"/>" >
	<script src=" <c:url value="./js/script.js"/>"> </script>  --%>
	</head>
	<body>
		<div id="entete" >Gestion des Utilisateurs</div>
		 
		<div id="menu">
		  <ul>
		    <%--<li><a href="<c:url value="/accueil"/>"> Acceuil </a> </li>  --%>
		    <c:choose>
		    	<c:when test="${!empty sessionScope.utilisateur }"> 
			     <h1>Vous etes bien connectés</h1> 
			      
		       </c:when>
		       <c:otherwise>
		         <h1>Vous n'etes pas connecté</h1>
		       </c:otherwise>
		       
		      </c:choose> 
		  </ul>
		</div>
		 <div id="corps">
		
		
		  <!-- <p> Bienvenue  dans notre app web</p> -->
		   <h1 id="titre-principal">Liste des Utilisateurs</h1>
		 
		 	<c:if  test="${!empty sessionScope.utilisateur}">
		     <c:choose> 
		       <c:when test="${ empty requestScope.utilisateurs }">
		       <p> La liste est vide </p>
		       </c:when>
		    
		       <c:when test="${ !empty requestScope.utilisateurs }">
		      		<table>
		      		
					    <tr> 
					       <th>ID </th>
					       <th>Nom</th>
					       <th>Prenom</th>
					       <th>Login</th>
					       <th colspan="2">Actions</th>
					    </tr>
					    <c:forEach items="${requestScope.utilisateurs}" var="utilisateur"> 
					  	 <jsp:useBean id="user" scope="request" class="beans.Users"/>
					  	  
								<tr>  
						    	<td> <c:out value="${user.id }"/> </td> 
						    	<td>  <c:out value="${user.prenom }"/> </td>  
						    	<td>  <c:out value="${user.nom }"/> </td>  
								 <td>  <c:out value="${user.login }"/></td>  
								
							     <td>  <a href="update?id=<c:out value="${utilisateur.id }"/>"> Modifier</a> </td> 
							     <td>  <a href="delete?id=<c:out value="${utilisateur.id }"/>"> Supprimer</a> </td>  
						    </tr>
						    
						    </c:forEach>
						
		     		  
					   
				    </table>
				    </c:when>
				   </c:choose>
				   </c:if>
		    
		   
		</div> 

		<div id="pied"> 
		</div>
	</body>
</html>
