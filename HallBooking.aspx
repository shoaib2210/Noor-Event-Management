<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HallBooking.aspx.cs" Inherits="HallBooking" %>

<div class="breadcumb-wrapper" >
    <div class="overlay"></div>
    <img src="assets/img/shapes/b-1-1.png" alt="shape" class="shape">
    <div class="container z-index-common">
      <div class="breadcumb-content">
        <h1 class="breadcumb-title">Our Noor Event</h1>
        <div class="breadcumb-menu-wrap">
          <ul class="breadcumb-menu">
            <li><a href="#/home">Home</a></li>
            <li>Hall Book</li>
          </ul>
        </div>
      </div>
    </div>
  </div>

    <div class="book" style="display: flex; justify-content: center; margin: 30px;">
        <div class="col-lg-10 mb-30">
          <div class="contact-box">
            <h3 class="contact-box__title h4">Hall Booking</h3>

              <div class="row gx-20">
                <div class="col-md-6 form-group">
                  <input type="text" name="name" id="name" placeholder="Enter Hall Name" ng-model="hallName">
                </div>
                <div class="col-md-6 form-group">
                  <input type="number" name="name" id="name" placeholder="Hall Capacity" ng-model="capacity">
                </div>
                <div class="col-md-6 form-group">
                  <select ng-model="hallType">
                    <option value="" disabled selected>Select Hall Type</option>
                    <option value="AC">AC</option>
                    <option value="Non AC">Non AC</option>
                  </select>
                </div>
                <div class="col-md-6 form-group">
                  <select  ng-model="catering">
                    <option value="" disabled selected>Select Catering</option>
                    <option value="With Catering">With Catering</option>
                    <option value="WithOut Catering">WithOut Catering</option>
                  </select>
                </div>
                 <div class="col-md-6 form-group">
                    <div class="img" style="display:inline-flex;margin-left:20px" >
                        <label style="padding-top:7px;">Licence:</label>
                        <input type="file" class="form-cotrol" id="licenceImage" style=" background: #f6f6f6; border: none;" />
                    </div>
                     <div class="upload">
                        <input type="button" class="btn btn-primary" value="Upload" style="width: 20%; height: auto; font-size: small; margin-left: 106px;" ng-click="uploadMemberLicenceImage(evt)" />
                     </div>
                </div>
                 <div class="col-md-6 form-group">
                    <img id="Img1" src="" class="img-responsive" ng-src="{{licenceImg}}"  style="width: 230px; height: 170px" ng-model="licenceImg"/>
                     <label>{{licenceImg}}</label>   
                </div>
                <div class="col-md-6 form-group">
                    <div class="img" style="display:inline-flex;margin-left:20px">
                        <label style="padding-top:7px;">Hall Image:</label>
                        <input type="file" class="form-cotrol" id="hallImage"  onchange="angular.element(this).scope().uploadHallImage()" style=" background: #f6f6f6; border: none;"/>
                    </div>
                     
                </div>
                 <div class="col-md-6 form-group">
                       <table class="table">
                            <thead>
                                <tr>
                                    <th>Sr No</th>
                                    <th>Hall Image</th>

                                </tr>
                            </thead>
                            <tbody>
                                <tr ng-repeat="image in imageList">
                                    <td>#{{$index + 1}}</td>
                                    <td>
                                        <img ng-src="{{image.PRODUCT_IMAGE_PATH}}"  style="height: 70px; width: 100px" ng-model="hallImagesList"/></td>  

                                    <td>
                                        <button class="btn btn-danger" ng-click="deleteImageList(image.$$hashKey)">X</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>  
                </div>
                
                 
                <div class="col-md-6 form-group" >
                   <input type="number" name="name" id="name" placeholder="Rent" ng-model="rent">
                </div>
                   <div class="col-md-6 form-group" >
                   <input type="text" name="name" id="name" placeholder="Phone Number" maxlength="10" ng-model="mobileNumber">
                </div>
                 <div class="col-md-6 form-group">
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


                <div class="col-md-6 form-group" >
                   <input type="text" name="name" id="name" placeholder="City" ng-model="city">
                </div>
               
                <div class="col-md-6 form-group" >
                   <input type="text" name="name" id="name" placeholder="Pin Code" maxlength="6" ng-model="pinCode" >
                </div>
                <div class="col-12 form-group">
                  <textarea name="message" id="message" placeholder="Enter Your Address"  ng-model="hallAddress"></textarea>
                </div>
                <div class="col-12 form-group">
                  <textarea name="message" id="message" placeholder="Write About Hall"  ng-model="aboutHall"></textarea>
                </div>
                <div class="col-12">
                  <button class="vs-btn" ng-click="HallBookingDetail()">Book <i class="far fa-arrow-right"></i></button>
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
