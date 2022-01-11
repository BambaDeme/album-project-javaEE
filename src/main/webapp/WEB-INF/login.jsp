<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="beans.Users"%>
<%@page import="java.util.ArrayList"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" >
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/login.css">
</head>
<body>
    <div class="container-fluid">
        <div class="row no-gutter">
            <!-- The image half -->
            <div class="col-md-6 d-none d-md-flex bg-image"></div>
    
    
            <!-- The content half -->
            <div class="col-md-6 bg-light">
                <div class="login d-flex align-items-center " >
    
                    <!-- Demo content-->
                    <div class="container">
                        <div class="row">
                            
                            <div class="container">
                              
                                <div class="row">
                                  <div class="col-lg-9 mx-auto">
                                    <div class="bg-white rounded-lg shadow-sm p-5">
                                      <!-- Credit card form tabs -->
                                      <ul role="tablist" class="nav bg-light nav-pills rounded-pill nav-fill mb-3">
                                        <li class="nav-item">
                                          <a data-toggle="pill" href="#nav-tab-signin" class="nav-link active rounded-pill">
                                                <i class="fa fa-user fa-sign-in"></i>
                                                Connexion
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a data-toggle="pill" href="#nav-tab-signup" class="nav-link rounded-pill">
                                                <i class="fa fa-sign-out"></i>
                                                Inscription
                                            </a>
                                        </li>
                                        
                                      </ul>
                                      <!-- End -->
                              
                                      <!-- Login form content -->
                                      <div class="tab-content">
                              
                                        <!-- Login info-->
                                        <div id="nav-tab-signin" class="tab-pane fade show active">
                                            <c:if test="${!empty requestScope.loginError }">
                                                <p class="alert alert-danger"><c:out value="${loginError }"/></p>
                                            </c:if>
                                          <form role="form" method="post">
                                            <div class="form-group">
                                              <label for="username">Nom d'utilisateur</label>
                                              <input type="text" name="username" placeholder="Jason Doe" required class="form-control">
                                            </div>

                                            <div class="form-group">
                                                <label for="username">Mot de passe</label>
                                                <input type="password" name="password" placeholder="password" required class="form-control">
                                            </div>
                                            
                                            <button type="submit" class="subscribe btn btn-primary btn-block rounded-pill shadow-sm"> Confirm  </button>
                                          </form>
                                        </div>
                                        <!-- End -->
                              
                                        <!-- Paypal info -->
                                        <div id="nav-tab-signup" class="tab-pane fade">
                                            <form role="form" method="post" action="/add">
                                                <div class="form-group">
                                                    <label for="firstName">Prénom</label>
                                                    <input type="text" name="firstName" placeholder="Prénom" required class="form-control">
                                                </div>
                                                <div class="form-group">
                                                    <label for="lastName">Nom</label>
                                                    <input type="text" name="lastName" placeholder="nom" required class="form-control">
                                                </div>
                                                <div class="form-group">
                                                  <label for="username">Nom d'utilisateur</label>
                                                  <input type="text" name="username" placeholder="Jason Doe" required class="form-control">
                                                </div>
                                                <div class="form-group">
                                                    <label for="password">Mot de passe</label>
                                                    <input type="password" name="password" placeholder="password" required class="form-control">
                                                </div>
                                                <div class="form-group">
                                                    <label for="passwordConfirm">Confirmer mot de passe</label>
                                                    <input type="password" name="passwordConfirm" placeholder="password" required class="form-control">
                                                </div>
                                                
                                                <button type="submit" class="subscribe btn btn-primary btn-block rounded-pill shadow-sm"> Confirm  </button>
                                            </form>
                                        </div>
                                        <!-- End -->
                              
                                      </div>
                                      <!-- End -->
                              
                                    </div>
                                  </div>
                                </div>
                              </div>
                        </div>
                    </div><!-- End -->
    
                </div>
            </div><!-- End -->
    
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.bundle.min.js" ></script>
    <script src="js/login.js"></script>
</body>
</html>