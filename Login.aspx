<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<section>
    <div class="video-wrap2" data-bg-src="assets/img/bg/video-bg-1-2.jpg">
        <div class="overlay" style="background-color: #da7fff;"></div>
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                </div>
                <div class="col-lg-5" style=" margin-top: 40px;">
                    <div class="form-style1 ajax-contact">
                        <img src="assets/img/shapes/f-1-1.png" alt="form shape" class="shape-1">
                        <img src="assets/img/shapes/f-1-2.png" alt="form shape" class="shape-2">
                        <h3 class="title">Login Now</h3>
                        <span class="subtitle"></span>
                        <div class="row gx-20">
                            <div class="col-md-12 form-group">
                                <input class="form-control" type="email" name="email" placeholder="Email Address" ng-model="eMail">
                            </div>
                            <div class="col-md-12 form-group">
                                <input class="form-control" type="password" placeholder="Password" ng-model="password">
                            </div>
                            <div class="col-md-12 form-group">
                                <button class="vs-btn style2" type="submit" ng-click="LoginDetail()">Login Now</button>
                            </div>
                            <span class="subtitle">Don't have an Account please <a href="#/registration" style="color: #ffc107">Register</a></span>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


 
<script>
    function showSuccessMessage(msg) {
        notie.alert(1, msg, 2);
    }

    function showErrorMessage(errorMessage) {
        notie.alert(3, errorMessage, 2);
    }
</script>

