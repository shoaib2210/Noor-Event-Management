﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Photography.aspx.cs" Inherits="Photography" %>

<style>
    .detail{
        font-style: italic;
        font-size: 15px;
    }
</style>

 <div class="breadcumb-wrapper" >
    <div class="overlay"></div>
    <img src="assets/img/shapes/b-1-1.png" alt="shape" class="shape">
    <div class="container z-index-common">
      <div class="breadcumb-content">
        <h1 class="breadcumb-title">Our Noor Event</h1>
        <div class="breadcumb-menu-wrap">
          <ul class="breadcumb-menu">
            <li><a href="#/home">Home</a></li>
            <li>Photography</li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <!-- Service Area -->
  <!-- Blog Area -->
  <section class="space-extra-bottom">
    <div class="container">
       <div class="row justify-content-end">
        <div class="col-auto">
          <div class="vs-pagination" ><a ng-click="checkLogin()" class="pagi-btn">ADD PHOTOGRAPHER</a>
            
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-4 col-md-6" ng-repeat="photography in photographerList">
          <div class="vs-blog blog-style1">
            <div class="blog-img">
              <a href="#/PhotographyDetail/{{photography.PHOTOGRAPHER_MASTER_ID}}">
                <img class="blog-img__item" ng-src="{{photography.PHOTOGRAPHER_IMAGE_PATH}}" style="width:100%">
                <img class="blog-img__item" ng-src="{{photography.PHOTOGRAPHER_IMAGE_PATH}}" style="width:100%">
              </a>
            </div>
            <div class="blog-content">
              <div class="blog-metas row">
                <span class="blog-date col-md-12" style="margin-top:10px"> <span>Whole Wedding Charges</span>{{photography.PHOTOGRAPHER_WHOLE_WEDDING_CHARGES}}</span>
              <%-- <span class="blog-date col-md-12">{{decorate.DECORATOR_FLORAL_CAR_CHARGES}} <span>Floral Car Charges</span></span>
                 <span class="blog-date col-md-12">{{decorate.DECORATOR_ARTIFICIAL_FLORAL_CAR_CHARGES}} <span>ArtificialFloral Floral Charges</span></span>
                  <span class="blog-date col-md-12">{{decorate.DECORATOR_ARTIFICIAL_FLORAL_CAR_CHARGES}} <span>ArtificialFloral Floral Car Charges</span></span>
                 --%>
                  <span class="blog-date col-md-12"> <span>Name</span>{{photography.PHOTOGRAPHER_NAME}}</span>
                  <span class="blog-date col-md-12"> <span>City</span>{{photography.PHOTOGRAPHER_DISTRICT}}</span>
              </div>
             <%-- <label class="blog-title h5">{{decorate.DECORATOR_NAME}}</label>
              <label class="detail">{{decorate.DECORATOR_DISTRICT}}</label>--%>
              <a class="blog-link" href="#/PhotographyDetail/{{photography.PHOTOGRAPHER_MASTER_ID}}">Read More<i class="far fa-arrow-right"></i></a>
            </div>
          </div>
        </div>
      
      </div>
     <%-- <div class="row justify-content-center">
        <div class="col-auto">
          <div class="vs-pagination"><a href="#" class="pagi-btn">Prev</a>
            <ul>
              <li><a href="#">1</a></li>
              <li><a href="#">2</a></li>
              <li><a href="#">3</a></li>
              <li><a href="#">...</a></li>
              <li><a href="#">16</a></li>
            </ul><a href="#" class="pagi-btn">next</a>
          </div>
        </div>
      </div>--%>
    </div>
  </section>
