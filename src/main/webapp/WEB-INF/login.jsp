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
                                    <c:if test="${!empty form }">
                                        <c:choose>
                                            <c:when test="${form.statusMessage == 'success' }">
                                                <p class="alert alert-success">compte crée avec succées!<br>Vous pouvez vous connecter</p>
                                            </c:when>
                                            <c:when test="${form.statusMessage == 'fail' }">
                                                <p class="alert alert-danger">Erreur lors de la création!<br>vérifiez le formulaire</p>
                                            </c:when>
                                        </c:choose>

                                                
                                    </c:if>
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
                                            <form role="form" method="post" action="add">
                                                <!-- firstName control -->
                                                <c:if test="${empty form.erreurs.firstName }">
                                                    <div class="form-group">
                                                        <label for="firstName">Prénom</label>
                                                        <input type="text" name="firstName" placeholder="Prénom" class="form-control" value="${form.user.firstName }">
                                                    </div>
                                                </c:if>
                                                <c:if test="${!empty form.erreurs.firstName }">
                                                    <div class="form-group">
                                                        <label for="firstName" class="text-danger">Prénom</label>
                                                        <input type="text" name="firstName" placeholder="Prénom"  class="form-control is-invalid" value="${form.user.firstName }">
                                                        <small id="passwordHelp" class="text-danger">
                                                            <c:out value="${form.erreurs.firstName }"/>
                                                        </small> 
                                                    </div>
                                                </c:if>
                                                

                                                <!-- last name control -->
                                                <c:if test="${empty form.erreurs.lastName}">
                                                    <div class="form-group">
                                                        <label for="lastName">Nom</label>
                                                        <input type="text" name="lastName" placeholder="nom" required class="form-control" value="${form.user.lastName }">
                                                    </div>
                                                </c:if>
                                                <c:if test="${!empty form.erreurs.lastName}">
                                                    <div class="form-group">
                                                        <label for="lastName" class="text-danger">Nom</label>
                                                        <input type="text" name="lastName" placeholder="nom" required class="form-control is-invalid" value="${form.user.lastName }">
                                                        <small id="passwordHelp" class="text-danger">
                                                            <c:out value="${form.erreurs.lastName }"/>
                                                        </small> 
                                                    </div>
                                                </c:if>

                                                <!-- login control -->
                                                <c:if test="${empty form.erreurs.username}">
                                                    <div class="form-group">
                                                        <label for="username">Nom d'utilisateur</label>
                                                        <input type="text" name="username" placeholder="Jason Doe" required class="form-control" value="${form.user.login }">
                                                      </div>
                                                </c:if>
                                                <c:if test="${!empty form.erreurs.username}">
                                                    <div class="form-group">
                                                        <label for="username" class="text-danger">Nom d'utilisateur</label>
                                                        <input type="text" name="username" placeholder="Jason Doe" required class="form-control is-invalid" value="${form.user.login }">
                                                        <small id="passwordHelp" class="text-danger">
                                                            <c:out value="${form.erreurs.username }"/>
                                                        </small> 
                                                    </div>
                                                </c:if>
                                                
                                                <!-- Password control -->
                                                <c:if test="${empty form.erreurs.password }">
                                                    <div class="form-group">
                                                        <label for="password">Mot de passe</label>
                                                        <input type="password" name="password" placeholder="password" required class="form-control">
                                                    </div>
                                                </c:if>
                                                <c:if test="${!empty form.erreurs.password }">
                                                    <div class="form-group">
                                                        <label for="password" class="text-danger">Mot de passe</label>
                                                        <input type="password" name="password" placeholder="password" required class="form-control is-invalid">
                                                        <small id="passwordHelp" class="text-danger">
                                                            <c:out value="${form.erreurs.password }"/>
                                                        </small> 
                                                    </div>
                                                </c:if>
                                                
                                                <!-- confirm password control -->
                                                <c:if test="${empty form.erreurs.password }">
                                                    <div class="form-group">
                                                        <label for="passwordConfirm">Confirmer mot de passe</label>
                                                        <input type="password" name="passwordConfirm" placeholder="password" required class="form-control" >
                                                    </div>
                                                </c:if>
                                                <c:if test="${!empty form.erreurs.password }">
                                                    <div class="form-group">
                                                        <label for="passwordConfirm" class="text-danger">Confirmer mot de passe</label>
                                                        <input type="password" name="passwordConfirm" required class="form-control is-invalid" >
                                                        <small id="passwordHelp" class="text-danger">
                                                            <c:out value="${form.erreurs.passwordConfirm }"/>
                                                        </small> 
                                                    </div>
                                                </c:if>
                                                
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