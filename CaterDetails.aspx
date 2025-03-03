<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CaterDetails.aspx.cs" Inherits="CaterDetails" %>

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
            <li>Caters Details</li>
          </ul>
        </div>
      </div>
    </div>
  </div>


  <div class="space-top space-extra-bottom">
    <div class="container">
      <div class="row" ng-repeat="cater in caterList">
        <div class="col-lg-6" >
            <div>
                 <img ng-src={{cater.CATER_IMAGE_PATH}} alt="Event Details" class="event-details-img mb-50" style="height: 500px; width: auto; display: block; margin: auto;">
            </div>
             <div class="row" style="margin-top:20px"> 
                    <div class="col-4" ng-repeat="img in ImageList">
                      <div class="gallery-style1" >
                        <a href="{{img.CATER_IMAGE_PATH}} " class="popup-image popup-link" >
                          <i class="fas fa-image"></i>
                        </a>
                        <div class="overlay"></div>
                        <div class="gallery-thumb">
                          <img ng-src={{img.CATER_IMAGE_PATH}} alt="gallery" style="height:150px;width:auto">
                        </div>
                      </div>
                    </div>
             </div>
          </div>
         <div class="col-lg-6" >
             <div style="margin-top:25px">
                <h2>{{cater.CATER_NAME}}</h2>
              </div>

            <div style="display:inline-flex;">
                <p class="title">Total Cater Charges:</p>
                 <span class="item-text" style="font-size: 25px;font-weight: 900;color: #0d2964; ">₹{{cater.CATER_TOTAL_AMOUNT}}</span>
             </div>

            <div style="margin-bottom:20px">
                <div style="display:inline-flex">
                <p class="title" >About Caters:</p>
                <span class="item-tex"  style="font-size: 25px;font-weight: 900;color: #0d2964; ">{{cater.CATER_ABOUT_CATERING}} </span>
             </div>
            </div>
             <div class="row gx-10" >
            <div class="col-md-10 mb-30">
              <div class="item-card" style="margin-bottom:20px">
                <div class="item-icon">
                  <i class="fas fa-calendar"></i>
                </div>
                <div class="item-content">
                  <span class="item-title">North India Dish Per Plate Charges</span>
                  <span class="item-text">{{cater.CATER_NORTH_INDIA_CHARGES}} </span>
                </div>
              </div>
            </div>
            <div class="col-md-10 mb-30">
              <div class="item-card" style="margin-bottom:20px">
                <div class="item-icon">
                  <i class="fas fa-calendar"></i>
                </div>
                <div class="item-content">
                  <span class="item-title">Souuth India Dish Per Plate Charges</span>
                  <span class="item-text">{{cater.CATER_SOUTH_INDIA_CHARGES}}</span>
                </div>
              </div>
            </div>
            <div class="col-md-10 mb-30">
              <div class="item-card" style="margin-bottom:20px">
                <div class="item-icon">
                  <i class="fas fa-calendar"></i>
                </div>
                <div class="item-content">
                  <span class="item-title">chaat & Street Food Per Plate Charges</span>
                  <span class="item-text">{{cater.CATER_CHAAT_FOOD_CHARGES}}</span>
                </div>
              </div>
            </div>
          </div>
            <div style="margin-bottom:20px">
                <div style="display:inline-flex">
                <p style="font-weight: bold; font-size: 20px;margin-right: 10px;">Address</p>
                <p style="font-size: 20px;">{{cater.CATER_ADDRESS}},  {{cater.CATER_CITY}},  {{cater.CATER_DISTRICT}},  {{cater.CATER_PINCODE}}. </span>
             </div>
            </div>
            <div class="d-inline-flex">
                <button  class="vs-btn" tabindex="0" ng-click="caterQuotationDetails()">
                  Add to Quotation
                </button>
          </div>
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
                  <span>See Caters</span>
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