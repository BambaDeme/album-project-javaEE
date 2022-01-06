<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="beans.Users"%>
<%@page import="beans.Albums"%>
<%@page import="java.util.ArrayList"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="album" scope="request" type="Albums"/>

    <!doctype html>
    <html lang="en">
      <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
        <meta name="generator" content="Hugo 0.88.1">
        <title>Projet JEE · Album</title>
    
        <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/carousel/">
    
        
    
        <!-- Bootstrap core CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    
    
        <style>
          .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
          }
    
          @media (min-width: 768px) {
            .bd-placeholder-img-lg {
              font-size: 3.5rem;
            }
          }
        </style>
        
        <!-- Custom styles for this template -->
        <link href="css/carousel.css" rel="stylesheet">
        <link rel="stylesheet" href="css/album-detail.css">
      </head>
      <body>
        
    <header>
      <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
        <div class="container-fluid">
          <a class="navbar-brand" href="<c:url value="/"/>">E-Album</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav me-auto mb-2 mb-md-0">
              <c:if  test="${!empty sessionScope.user}">
                <li class="nav-item">
                  <a class="nav-link active" aria-current="page" href="#">Mes albums</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link active" aria-current="page" href="#">Mes albums</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">Utilisateurs</a>
                </li>         
              </c:if>
            </ul>
            
            <div class="d-flex">
              <c:choose>
                      <c:when test="${empty sessionScope.user }"> 
                  <a href="" class="btn btn-primary">Connexion</a>
                    </c:when>
                    <c:otherwise>
                  <a href="" class="btn btn-primary">Déconnexion</a>
                    </c:otherwise>
                  </c:choose> 
            </div>
          </div>
        </div>
      </nav>
    </header>
    
    <main>
    
        <section class="py-5 text-center container" style="padding-bottom: 0px !important;">
            <div class="rows">
              <div class="col-lg-6 col-md-8 mx-auto">
                
                <h1 class="fw-light"><c:out value="${album.theme }"/></h1>
                <p class="lead text-muted">Something short and leading about the collection below—its contents, the creator, etc. Make it short and sweet, but not too short so folks don’t simply skip over it entirely.</p>
                <p>
                  <!-- <a href="#" class="btn btn-primary my-2">Main call to action</a>
                  <a href="#" class="btn btn-secondary my-2">Secondary action</a> -->
                  
                  <span class="badge bg-secondary">Propriétaire: <c:out value="${album.id_proprietaire }"/></span>
                </p>
              </div>
            </div>
        </section>
        <hr class="featurette-divider">
        <div class="container marketing">
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                <!-- DEMO 2-->
                <div class="">
                    <div class="row">
                        <!-- DEMO 2 Item-->
                        <div class="">
                            <div class="hover hover-2 text-white rounded"><img src="https://bootstrapious.com/i/snippets/sn-img-hover/hoverSet-2.jpg" alt="">
                            <div class="hover-overlay"></div>
                            <div class="hover-2-content px-5 py-4">
                                <h3 class="hover-2-title text-uppercase font-weight-bold mb-0"> <span class="font-weight-light">Image </span>Caption</h3>
                                <p class="hover-2-description text-uppercase mb-0">Lorem ipsum dolor sit amet, consectetur <br>adipisicing elit.</p>
                            </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <hr class="featurette-divider">
    
      <!-- FOOTER -->
      <footer class="container">
        <p class="float-end"><a href="#">Back to top</a></p>
        <p>&copy; 2017–2021 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
      </footer>
    </main>
    
    
        <!-- <script src="../assets/dist/js/bootstrap.bundle.min.js"></script> -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
      
    </body>
</html>
    