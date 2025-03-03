<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PhotographyDetails.aspx.cs" Inherits="PhotographyDetails" %>

<style>
    .title{
        font-size: 20px;
        font-weight: 900; 
        padding-right:20px
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
            <li>Home</li>
            <li>Photography Details</li>
          </ul>
        </div>
      </div>
    </div>
  </div>


  <div class="space-top space-extra-bottom">
    <div class="container">
      <div class="row" ng-repeat="photography in photographerList">
        <div class="col-lg-6" >
            <div>
                <img ng-src={{photography.PHOTOGRAPHER_IMAGE_PATH}} alt="Event Details" class="event-details-img mb-50" style="height: 500px; width: auto; display: block; margin: auto;">
            </div>
            <div class="row" style="margin-top:20px"> 
                <div class="col-4" ng-repeat="img in ImageList">
                      <div class="gallery-style1" >
                        <a href="{{img.PHOTOGRAPHER_IMAGE_PATH}} " class="popup-image popup-link">
                          <i class="fas fa-image"></i>
                        </a>
                        <div class="overlay"></div>
                        <div class="gallery-thumb">
                          <img ng-src={{img.PHOTOGRAPHER_IMAGE_PATH}} alt="gallery" style="height:150px;width:auto">
                        </div>
                      </div>
                </div>
            </div>
        </div>
        <div class="col-lg-6" >
           <div style="margin-top:25px">
                <h2>{{photography.PHOTOGRAPHER_NAME}}</h2>
           </div>
            <div style="display:inline-flex;">
                <p class="title">Whole Wedding Charges:</p>
                 <span class="item-text" style="font-size: 25px;font-weight: 900;color: #0d2964; ">₹{{photography.PHOTOGRAPHER_WHOLE_WEDDING_CHARGES}}</span>
             </div>
              <div style="margin-bottom:20px">
                <div style="display:inline-flex">
                    <p class="title" >About Photography:</p>
                    <span class="item-text" >{{decorate.HALL_ABOUT}} </span>
                 </div>
                </div>
          
          <div class="row gx-10">
            <div class="col-md-10 mb-30">
              <div class="item-card" style="margin-bottom:20px">
                <div class="item-icon">
                  <i class="fas fa-calendar"></i>
                </div>
                <div class="item-content">
                  <span class="item-title">Pre Wedding Charges</span>
                  <span class="item-text">{{photography.PHOTOGRAPHER_PRE_WEDDING_CHARGES}} </span>
                </div>
              </div>
            </div>
            <div class="col-md-10 mb-30">
              <div class="item-card" style="margin-bottom:20px">
                <div class="item-icon">
                  <i class="fas fa-calendar"></i>
                </div>
                <div class="item-content">
                  <span class="item-title">Traditional Charges</span>
                  <span class="item-text">{{photography.PHOTOGRAPHER_TRADITIONAL_CHARGES}}</span>
                </div>
              </div>
            </div>
            <div class="col-md-10 mb-30">
              <div class="item-card" style="margin-bottom:20px">
                <div class="item-icon">
                  <i class="fas fa-calendar"></i>
                </div>
                <div class="item-content">
                  <span class="item-title">Candid Charges</span>
                  <span class="item-text">{{photography.PHOTOGRAPHER_CANDID_CHARGES}}</span>
                </div>
              </div>
            </div>
          </div>
            <div style="margin-bottom:20px">
                <div style="display:inline-flex">
                <p style="font-weight: bold; font-size: 20px;margin-right: 10px;">Address:</p>
                <span style="font-size: 20px;" >{{photography.PHOTOGRAPHER_ADDRESS}},  {{photography.PHOTOGRAPHER_CITY}},  {{photography.PHOTOGRAPHER_DISTRICT}},  {{photography.PHOTOGRAPHER_PINCODE}}. </span>
             </div>
            </div>
            <button  class="vs-btn" tabindex="0" ng-click="photographyQuotationDetails()">
                Add to Cotetion
             </button>
           </div>
         
          <div class="row">
          <div class="event-timeline" style="margin-top:50px">
            <div class="row justify-content-between d-none d-xl-flex">
              <div class="col-auto">
                <div class="timeline-step"></div>
              </div>
              <div class="col-auto">
                <div class="timeline-step"></div>
              </div>
              <div class="col-auto">
                <div class="timeline-step"></div>
              </div>
            </div>
            <div class="event-timeline__bar">
              <div class="timeline-line"></div>
            </div>
            <div class="row justify-content-center justify-content-xl-between">
              <div class="col-auto">
                <div class="timeline-item">
                  <i class="fas fa-microphone"></i>
                  <span>See Photographers</span>
                </div>
              </div>
              <div class="col-auto">
                <div class="timeline-item">
                  <i class="fas fa-calendar"></i>
                  <span>Get Details</span>
                </div>
              </div>
              <div class="col-auto">
                <div class="timeline-item">
                  <i class="fas fa-images"></i>
                  <span>Book</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

<script>
    function showSuccessMessage(msg) {
        notie.alert(1, msg, 2);
    }

    function showErrorMessage(errorMessage) {
        notie.alert(3, errorMessage, 2);
    }
</script>