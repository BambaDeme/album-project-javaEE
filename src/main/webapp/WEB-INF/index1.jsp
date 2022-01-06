<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="beans.Users"%>
<%@page import="beans.Albums"%>
<%@page import="java.util.ArrayList"%>



<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="users" scope="request" type="ArrayList<Users>"/>
<jsp:useBean id="publicAlbums" scope="request" type="ArrayList<Albums>"/>

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
		   <h1 id="titre-principal">Liste des Albums publics</h1>
		 
		 	<c:if  test="${empty sessionScope.utilisateur}">
		     <c:choose> 
		       <c:when test="${ empty requestScope.publicAlbums }">
		       <p> La liste est vide </p>
		       </c:when>
		    
		       <c:when test="${ !empty requestScope.publicAlbums }">
		      		<table>
		      		
					    <tr> 
					       <th>ID </th>
					       <th>Theme</th>
					       <th>Visibility</th>
					       <th>Propriétaire</th>
					       
					    </tr>
					    <c:forEach items="${requestScope.publicAlbums}" var="album"> 
					  	 <jsp:useBean id="album" scope="request" class="beans.Albums"/>
					  	  
								<tr>  
						    	<td> <c:out value="${album.id }"/> </td> 
						    	<td>  <c:out value="${album.theme }"/> </td>  
						    	<td>  <c:out value="${album.visibility }"/> </td>  
								 <td>  <c:out value="${album.id_proprietaire }"/></td>  
					  
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
