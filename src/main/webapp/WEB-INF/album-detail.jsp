<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="beans.Users"%>
<%@page import="beans.Albums"%>
<%@page import="beans.Images"%>
<%@page import="java.util.ArrayList"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="album" scope="request" type="Albums"/>
<c:if  test="${!empty requestScope.images}">
    <jsp:useBean id="images" scope="request" type="ArrayList<Images>"/>

</c:if>

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
                      <a class="nav-link active" aria-current="page" href="UserAlbums">Mes albums</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link active" aria-current="page" href="PrivateAlbums">Albums privés</a>
                    </li>
                    <c:if test="${ sessionScope.user.role == 'admin'}">
                      <li class="nav-item">
                        <a class="nav-link" href="#">Utilisateurs</a>
                      </li>  
                    </c:if>
                           
                  </c:if>
                </ul>
                <!-- <form class="d-flex">
                  <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                  <button class="btn btn-outline-success" type="submit">Search</button>
                </form> -->
                <div class="d-flex">
                  <c:choose>
                    <c:when test="${empty sessionScope.user }"> 
                      <a 
                        href='<c:url value="/login"/>'
                        class="btn btn-primary" 
                      >
                        Connexion
                      </a>
                    </c:when>
                    
                    <c:otherwise>
                      <a href='<c:url value="/logout"/>' class="btn btn-primary">Déconnexion</a>
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
            <!-- <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3"> -->
                <!-- <div class="row" id="gallery" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    <div class="col-12 col-sm-6 col-lg-3">
                      <img class="w-100" src="images/nature1.jpg" data-bs-target="#carouselExample" data-bs-slide-to="0">
                    </div>
                    <div class="col-12 col-sm-6 col-lg-3">
                      <img class="w-100" src="images/nature3.jpg" data-bs-target="#carouselExample" data-bs-slide-to="1">
                    </div>
                    <div class="col-12 col-sm-6 col-lg-3">
                      <img class="w-100" src="images/nature5.jpg" data-bs-target="#carouselExample" data-bs-slide-to="2">
                    </div>
                    <div class="col-12 col-sm-6 col-lg-3">
                      <img class="w-100" src="images/nature7.jpg" data-bs-target="#carouselExample" data-bs-slide-to="3">
                    </div>
                </div>

                
                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true"></span>
                        </button>
                        </div>
                        <div class="modal-body">
                        
                        <div id="carouselExample" class="carousel slide" data-bs-ride="carousel">
                            <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img class="d-block w-100" src="images/nature1.jpg">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100" src="images/nature3.jpg">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100" src="images/nature5.jpg">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100" src="images/nature7.jpg">
                            </div>
                            </div>
                            <a class="carousel-control-prev" href="#carouselExample" role="button" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            
                            </a>
                            <a class="carousel-control-next" href="#carouselExample" role="button" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                           
                            </a>
                        </div>
                        </div>
                
                        <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    </div>
                </div> -->

                <div class="row" id="gallery" data-bs-toggle="modal" data-bs-target="#galleryModal">
                    <c:choose>
                        <c:when test="${ empty requestScope.images }">
                            <p> La liste est vide </p>
                        </c:when>
                        <c:when test="${ !empty requestScope.images }">
                            <c:forEach items="${requestScope.images}" var="image" varStatus="loop">
                                <!-- <c:out value="${loop.index }"/> -->
                                <jsp:useBean id="image" scope="request" class="beans.Images"/>
                                <div class="col-12 col-sm-6 col-lg-3">
                                    <div class="hover hover-2 text-white rounded">
                                      <img 
                                        src='images/<c:out value="${image.fichier }"/>' 
                                        alt="" 
                                        data-bs-target="#carouselGallery" 
                                        data-bs-slide-to='<c:out value="${loop.index }"/>'
                                        data-id='<c:out value="${loop.index }"/>'
                                        class="openCaroussel"
                                        
                                      />
                                      <div class="hover-overlay"></div>
                                      <div class="hover-2-content px-5 py-4">
                                          <h3 class="hover-2-title text-uppercase font-weight-bold mb-0"> <span class="font-weight-light">Image </span>Caption</h3>
                                          <p class="hover-2-description text-uppercase mb-0"><c:out value="${image.description }"/></p>
                                      </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:when>
                    </c:choose>
                </div>

                <!-- Modal Gallery -->
                <div class="modal fade" id="galleryModal" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true"></span>
                                </button>
                            </div>

                            <div class="modal-body">
                                <div id="carouselGallery" class="carousel slide" data-bs-ride="carousel">
                                    <div class="carousel-inner">
                                        <c:forEach items="${requestScope.images}" var="imageShow" varStatus="loop">
                                         
                                          <c:if test="${loop.first}">
                                            <div class="carousel-item active">
                                              <img class="d-block w-100" src="images/<c:out value="${imageShow.fichier}"/>">
                                            </div>
                                          </c:if>
                                          <c:if test="${!loop.first}">
                                            <div class="carousel-item">
                                              <img class="d-block w-100" src="images/<c:out value="${imageShow.fichier}"/>">
                                            </div>
                                          </c:if>
                                           
                                        </c:forEach>
                                       
                                        <a class="carousel-control-prev" href="#carouselGallery" role="button" data-bs-slide="prev">
                                            <span class="carousel-control-prev-icon" aria-hidden="true"></span> 
                                        </a>
                                        <a class="carousel-control-next" href="#carouselGallery" role="button" data-bs-slide="next">
                                            <span class="carousel-control-next-icon" aria-hidden="true"></span>   
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
                    <!-- DEMO 2 Item-->
                    <!-- <div class="">
                        <div class="hover hover-2 text-white rounded"><img src="https://bootstrapious.com/i/snippets/sn-img-hover/hoverSet-2.jpg" alt="">
                        <div class="hover-overlay"></div>
                        <div class="hover-2-content px-5 py-4">
                            <h3 class="hover-2-title text-uppercase font-weight-bold mb-0"> <span class="font-weight-light">Image </span>Caption</h3>
                            <p class="hover-2-description text-uppercase mb-0">Lorem ipsum dolor sit amet, consectetur <br>adipisicing elit.</p>
                        </div>
                        </div>
                    </div>
                    <div class="">
                        <div class="hover hover-2 text-white rounded"><img src="https://bootstrapious.com/i/snippets/sn-img-hover/hoverSet-2.jpg" alt="">
                        <div class="hover-overlay"></div>
                        <div class="hover-2-content px-5 py-4">
                            <h3 class="hover-2-title text-uppercase font-weight-bold mb-0"> <span class="font-weight-light">Image </span>Caption</h3>
                            <p class="hover-2-description text-uppercase mb-0">Lorem ipsum dolor sit amet, consectetur <br>adipisicing elit.</p>
                        </div>
                        </div>
                    </div> -->
               
                

            <!-- </div> -->
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
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
      <script src="js/album-detail.js"></script>
    </body>
</html>
    