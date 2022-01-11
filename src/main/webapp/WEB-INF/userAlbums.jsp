<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="beans.Users"%>
<%@page import="beans.Albums"%>
<%@page import="java.util.ArrayList"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<jsp:useBean id="userAlbums" scope="request" type="ArrayList<Albums>"/>
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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">


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

      <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
          <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
          <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
          <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <!-- <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg> -->
            <img src="https://cdn.jevelin.shufflehound.com/wp-content/uploads/sites/12/2017/03/Port_2_Background.jpg" alt="">

            <div class="container">
              <div class="carousel-caption">
                <h1>Example headline.</h1>
                <p>Some representative placeholder content for the first slide of the carousel.</p>
                
              </div>
            </div>
          </div>
          <div class="carousel-item">
            <!-- <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg> -->
            <img src="https://cdn.jevelin.shufflehound.com/wp-content/uploads/sites/12/2017/03/Port_2_Background.jpg" alt="">

            <div class="container">
              <div class="carousel-caption">
                <h1>Another example headline.</h1>
                <p>Some representative placeholder content for the second slide of the carousel.</p>
                
              </div>
            </div>
          </div>
          <div class="carousel-item">
            <!-- <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg> -->
            <img src="https://cdn.jevelin.shufflehound.com/wp-content/uploads/sites/12/2017/03/Port_2_Background.jpg" alt="">

            <div class="container">
              <div class="carousel-caption">
                <h1>Another example headline.</h1>
                <p>Some representative placeholder content for the second slide of the carousel.</p>
                
              </div>
            </div>
          </div>
        
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>

    
        <div class="container marketing">

          <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
            <c:choose>
              <c:when test="${ empty requestScope.userAlbums }">
              <p> Vous n'avez aucun album </p>
              </c:when>

              <c:when test="${ !empty requestScope.userAlbums }">
                <c:forEach items="${requestScope.userAlbums}" var="album">
                  <jsp:useBean id="album" scope="request" class="beans.Albums"/>
                  <div class="col">
                    <div class="card shadow-sm">
                      <c:choose>
                        <c:when test="${ empty album.cover }">
                          <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
                        </c:when>
                        <c:when test="${ !empty album.cover }">
                          <img class="bd-placeholder-img card-img-top" src="images/<c:out value="${album.cover }"/>" alt="" style="width: 100;height: 225px;">
                        </c:when>
                      </c:choose>
                      <div class="card-body">
                        <p class="card-text"><a href="albums?id=<c:out value="${album.id }"/>"><c:out value="${album.theme }"/></a></p>
                        <div class="d-flex justify-content-between align-items-center">
                          <div class="btn-group">
                            <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                            <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                          </div>
                          <small class="text-muted">9 mins</small>
                        </div>
                      </div>
                    </div>
                  </div>
                </c:forEach>
              </c:when>
            </c:choose>
          </div>

          <div style="margin-top:1rem;" >
            <a class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addAlbum">
                <i class="fa fa-plus"></i>
                Ajouter
            </a>

            <!-- Album modal -->
            <div id="addAlbum" class="modal fade" role="dialog">
                <div class="modal-dialog">
              
                  <!-- Modal content-->
                  <div class="modal-content">
                    <div class="modal-header">
                      <h4 class="modal-title">Créer un album</h4>
                      <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                      <form method="post" action="AddAlbum" enctype="multipart/form-data">
                        <div class="form-group mb-3">
                            <label for="theme">Théme</label>
                            <input type="text" name="theme" placeholder="vacances,sport,..." class="form-control">
                        </div>

                        <div class="form-group mb-3">
                            <label for="visibility">Visibilité</label>
                            <select name="visibility" id="" class="form-select">
                                <option value="public">public</option>
                                <option value="private">private</option>
                            </select>
                        </div>
                        <div class="form-group mb-3">
                            <label for="cover">photo de Couverture</label>
                            <input type="file" name="cover" class="form-control">
                        </div>
                        <button type="submit" class="btn btn-primary btn-blockl shadow-sm"> Créer  </button>
                      </form>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-default" data-bs-dismiss="modal">Close</button>
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
    <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script> -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
      
  </body>
</html>
