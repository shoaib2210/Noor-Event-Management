<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Hall.aspx.cs" Inherits="Hall" %>

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
            <li>Hall</li>
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
          <div class="vs-pagination" ><a ng-click="checkLogin()" class="pagi-btn">ADD HALL</a>
            
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-4 col-md-6" ng-repeat="hall in hallList">
          <div class="vs-blog blog-style1">
            <div class="blog-img">
              <a href="#/hallDetail/{{hall.HALL_MASTER_ID}}">
                <img class="blog-img__item" ng-src="{{hall.HALL_IMAGE_PATH}}" style="width:100%">{{image}}
                <img class="blog-img__item" ng-src="{{hall.HALL_IMAGE_PATH}}" style="width:100%">{{image}}
              </a>
            </div>
            <div class="blog-content">
              <div class="blog-metas">
                <span class="blog-date">{{hall.HALL_CAPACITY}} <span>Capacity</span></span>
                <ul>
                  <li>
                       <span class="blog-date"> {{hall.HALL_TYPE}} <span>Hall Type</span></span>
                  </li>
                  <li>
                      <span class="blog-date">  {{hall.HALL_RENT}} <span>Hall Rent</span></span>
                  </li>
                </ul>
              </div>
              <label class="blog-title h5">{{hall.HALL_NAME}}</label>
              <label class="detail">{{hall.HALL_ADDRESS}}, {{hall.HALL_CITY}}, {{hall.HALL_DISTRICT}}</label>
              <a class="blog-link" href="#/hallDetail/{{hall.HALL_MASTER_ID}}">Read More<i class="far fa-arrow-right"></i></a>
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
  <!-- Blog Area End -->
  