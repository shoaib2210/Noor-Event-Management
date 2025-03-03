<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PhotographerBooking.aspx.cs" Inherits="PhotographerBooking" %>

<style>
    .label{
        font-weight: 700;
        padding-left: 20px;
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
            <li>Photographer Book</li>
          </ul>
        </div>
      </div>
    </div>
  </div>

    <div class="book" style="display: flex; justify-content: center; margin: 30px;">
        <div class="col-lg-10 mb-30">
          <div class="contact-box">
            <h3 class="contact-box__title h4">Photographer Register</h3>

              <div class="row gx-20">
                <div class="col-md-6 form-group">
                    <label class="label">Photographer Name:</label>
                  <input type="text" name="name" id="name" placeholder="Enter Decorator Name" ng-model="photographerName">
                </div>
                 <div class="col-md-6 form-group">
                    <label class="label">Phone Number:</label>
                  <input type="text" name="name" id="name" placeholder="Enter Phone Number" maxlength="10" ng-model="phoneNumber">
                </div>
                <div class="col-md-6 form-group">
                  <label class="label">Pre-wedding:</label>
                  <input type="number" name="name" id="name" placeholder="Charges" ng-model="PreWedding">
                </div>
                <div class="col-md-6 form-group">
                  <label class="label"> Wedding Whole Package:</label>
                  <input type="number" name="name" id="name" placeholder="Charges" ng-model="wholeWedding">
                </div>
                <div class="col-md-6 form-group">
                  <label class="label">Traditional Photography:</label>
                  <input type="number" name="name" id="name" placeholder="Charges" ng-model="traditional">
                </div>
                 <div class="col-md-6 form-group">
                  <label class="label">Candid Photography:</label>
                  <input type="number" name="name" id="name" placeholder="Charges" ng-model="candid">
                </div>
               
                 <div class="col-md-6 form-group">
                     <div class="row">
                         <div class="col-md-6">
                             <div class="img" >
                                <label class="label">Upload Photography Licence:</label>
                                <input type="file" class="form-cotrol" id="licenceImage" style=" background: #f6f6f6; border: none;" />
                                <input type="button" class="btn btn-primary" value="Upload" style="width: 40%; height: auto; font-size: small; margin-left:20px" ng-click="uploadMemberLicenceImage(evt)" />
                            </div>
                         </div>
                         <div class="col-md-6">
                            <img id="Img1" class="img-responsive" ng-src="{{licenceImg}}"  style="width: 120px; height: 100px; padding-top:10px" ng-model="licenceImg"/>
                             <label>{{licenceImg}}</label>   
                        </div>
                     </div>
                </div>
                
                <div class="col-md-6 form-group">
                    <div class="img" >
                        <label style="padding-top:7px;">Upload Photography Images:</label>
                        <input type="file" class="form-cotrol" id="photographyImage"  onchange="angular.element(this).scope().uploadPhotographyImage()" style=" background: #f6f6f6; border: none;"/>
                         <label class="label" style="color:red">Upload Maximum 4 Images:</label>
                    </div>
                </div>
                 <div class="col-md-6 form-group">
                       <table class="table">
                            <thead>
                                <tr>
                                    <th>Sr No</th>
                                    <th>Photo Shoot Image</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr ng-repeat="image in imageList">
                                    <td>#{{$index + 1}}</td>
                                    <td>
                                        <img ng-src="{{image.PRODUCT_IMAGE_PATH}}"  style="height: 70px; width: 100px" ng-model="photographyImagesList"/></td>  

                                    <td>
                                        <button class="btn btn-danger" ng-click="deleteImageList(image.$$hashKey)">X</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>  
                </div>
                <h3 class="contact-box__title h4">Address Detail</h3>

                 <div class="col-12 form-group">
                     <textarea name="message" id="message" placeholder="Enter Your Address"  ng-model="photographerAddress"></textarea>
                </div>

               <div class="col-md-4 form-group">
                <select ng-model="selectedDistrict">
                    <option value="" disabled selected>Select District</option>
                    <option value="Ahmednagar">Ahmednagar</option>
                    <option value="Akola">Akola</option>
                    <option value="Amravati">Amravati</option>
                    <option value="Aurangabad">Aurangabad</option>
                    <option value="Beed">Beed</option>
                    <option value="Bhandara">Bhandara</option>
                    <option value="Buldhana">Buldhana</option>
                    <option value="Chandrapur">Chandrapur</option>
                    <option value="Dhule">Dhule</option>
                    <option value="Gadchiroli">Gadchiroli</option>
                    <option value="Gondia">Gondia</option>
                    <option value="Hingoli">Hingoli</option>
                    <option value="Jalgaon">Jalgaon</option>
                    <option value="Jalna">Jalna</option>
                    <option value="Kolhapur">Kolhapur</option>
                    <option value="Latur">Latur</option>
                    <option value="Mumbai City">Mumbai City</option>
                    <option value="Mumbai Suburban">Mumbai Suburban</option>
                    <option value="Nagpur">Nagpur</option>
                    <option value="Nanded">Nanded</option>
                    <option value="Nandurbar">Nandurbar</option>
                    <option value="Nashik">Nashik</option>
                    <option value="Osmanabad">Osmanabad</option>
                    <option value="Palghar">Palghar</option>
                    <option value="Parbhani">Parbhani</option>
                    <option value="Pune">Pune</option>
                    <option value="Raigad">Raigad</option>
                    <option value="Ratnagiri">Ratnagiri</option>
                    <option value="Sangli">Sangli</option>
                    <option value="Satara">Satara</option>
                    <option value="Sindhudurg">Sindhudurg</option>
                    <option value="Solapur">Solapur</option>
                    <option value="Thane">Thane</option>
                    <option value="Wardha">Wardha</option>
                    <option value="Washim">Washim</option>
                    <option value="Yavatmal">Yavatmal</option>
                </select>
            </div>

                <div class="col-md-4 form-group" >
                   <input type="text" name="name" id="name" placeholder="City" ng-model="city">
                </div>
                <div class="col-md-4 form-group" >
                   <input type="number" name="name" id="name" placeholder="Pin Code" ng-model="pinCode">
                </div>
                <div class="col-12">
                  <button class="vs-btn" ng-click="PhotographerBookingDetail()">Register Photographer <i class="far fa-arrow-right"></i></button>
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