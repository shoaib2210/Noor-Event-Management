var memberPanelApp = angular.module("memberPanelApp", ['ngRoute', 'datatables', '720kb.datepicker', 'ngAnimate', 'ui.bootstrap', 'ngCookies', 'revolunet.stepper', 'ngGeolocation', 'ngJsonExportExcel']);

memberPanelApp.config(function ($routeProvider) {
    $routeProvider
        .when('/', {
            templateUrl: 'Home.aspx',
            controller: 'HomeController'
        })
        .when('/home', {
            templateUrl: 'Home.aspx',
            controller: 'HomeController'
        })
        .when('/registration', {
            templateUrl: 'Registration.aspx',
            controller: 'RegistrationController'
        })

        .when('/login', {
            templateUrl: 'Login.aspx',
            controller: 'LoginController'
        })

        .when('/logOut', {
            templateUrl: 'LogOut.aspx',
            controller: 'LogOutController'
        })

       .when('/hall', {
           templateUrl: 'Hall.aspx',
           controller: 'HallController'
       })

        .when('/hallBooking', {
            templateUrl: 'HallBooking.aspx',
            controller: 'HallBookingController'
        })

        .when('/hallDetail/:id', {
            templateUrl: 'HallDetails.aspx',
            controller: 'HallDetailsController'
        })

        .when('/Decorator', {
            templateUrl: 'Decoration.aspx',
            controller: 'DecorationController'
        })

        .when('/DecorateBooking', {
            templateUrl: 'DecorateBooking.aspx',
            controller: 'DecorateBookingController'
        })

        .when('/DecorateDetail/:id', {
            templateUrl: 'DecoratorDetails.aspx',
            controller: 'DecoratorDetailsController'
        })

        .when('/PhotographerBooking', {
            templateUrl: 'PhotographerBooking.aspx',
            controller: 'PhotographerBookingController'
        })

        .when('/Photography', {
            templateUrl: 'Photography.aspx',
            controller: 'PhotographyController'
        })

        .when('/PhotographyDetail/:id', {
            templateUrl: 'PhotographyDetails.aspx',
            controller: 'PhotographyDetailsController'
        })

         .when('/Cater', {
             templateUrl: 'Cater.aspx',
             controller: 'CaterController'
         })

        .when('/CaterBooking', {
            templateUrl: 'CaterBooking.aspx',
            controller: 'CaterBookingController'
        })

         .when('/CaterDetail/:id', {
             templateUrl: 'CaterDetails.aspx',
             controller: 'CaterDetailsController'
         })

         .when('/Quotation', {
             templateUrl: 'Quotation.aspx',
             controller: 'QuotationController'
         })

        .when('/getInvoice', {
            templateUrl: 'QuotetionPrint.aspx',
            controller: 'QuotetionPrintController'
        })

        .otherwise({
            redirectTo: '/home'
        });
});

memberPanelApp.controller('QuotetionPrintController', function ($scope, $http) {
    
    getQuotationDetails($http).success(function(data){
        $scope.quotationList = JSON.parse(data.d);
    }).error(function(error){
        alert('Error'+ JSON.stringify(error));
    })

    getInvoiceMember($http).success(function(data){
        var value = JSON.parse(data.d);
        $scope.invoiceName = value[0].MEMBER_NAME;
        $scope.invoiceAddress = value[0].MEMBER_ADDRESS;
        $scope.invoiceCity = value[0].MEMBER_ADDRESS_CITY;
        $scope.invoiceDistrict = value[0].MEMBER_ADDRESS_DISTRICT;
        $scope.invoiceContactNo = value[0].MEMBER_CONTACT_NUMBER;
        $scope.invoiceMail= value[0].MEMBER_EMAIL_ID;
    })

    $scope.getTotalSalary = function() {
        var total = 0;
        angular.forEach($scope.quotationList, function(quotetion) {
            total += quotetion.Charges;

        });
        return total;
    };
   
});

function getInvoiceMember($http){
    return $http.post('QuotetionPrint.aspx/getInvoiceDetails',{ });
};

memberPanelApp.controller('QuotationController', function ($scope, $http) {
    
    getQuotationDetails($http).success(function(data){
        $scope.quotationList = JSON.parse(data.d);
    }).error(function(error){
        alert('Error'+ JSON.stringify(error));
    })

    $scope.viewDetails = function(eventService, quotationID) {
       if (eventService === 'Hall') {
            window.location.href = '#/hallDetail/' + quotationID;
        }
        else if (eventService === 'Decoration') {
            window.location.href = '#/DecorateDetail/' + quotationID;
        }
        else if (eventService === 'Cater') {
            window.location.href = '#/CaterDetail/' + quotationID;
        }
        else if (eventService === 'Photographer') {
            window.location.href = '#/PhotographyDetail/' + quotationID;
        }

        console.log(eventService); // Log the eventService for debugging
    };

    $scope.deleteEventDetails = function(quotationID) {
       
        swal({
            title: "Are you sure?",
            text: "Are You Sure Want To Delete Quotetion??",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Yes",
            closeOnConfirm: true
        }, function () {
            
            deleteEvent(quotationID, $http).success(function(data){
                var value = JSON.parse(data.d)
                if(value[0].STR_RETURN == 'Success'){
                    showSuccessMessage('Event Service Deleted Successfully...');
                }

                getQuotationDetails($http).success(function(data){
                    $scope.quotationList = JSON.parse(data.d);
                })
            })
        }
    )};

    $scope.getTotalSalary = function() {
        var total = 0;
        angular.forEach($scope.quotationList, function(quotetion) {
            total += quotetion.Charges;

        });
        return total;
    };

    

   

    //getSuggestionDetails(charges,quotetionID,$http).success(function(data){
        getQuotationDetails($http).success(function(data){
            // Parse the returned JSON data
            var quotationData = JSON.parse(data.d);

            // Loop through each quotation and add the 'charges' value
            for (var i = 0; i < quotationData.length; i++) {
                // Add the 'charges' property to each quotation record
                quotationData[i].charges = quotationData[i].Charges;  // Assuming 'Charges' is a property in the response

                // If you want to modify the name, you can change the 'charges' to any name you prefer
            }

            // Assign the modified data to $scope.quotationList
            $scope.quotationList = quotationData;
            console.log(quotationData);
        });
        
    })
       
//});


function deleteEvent(quotationID, $http){
    return $http.post('Quotation.aspx/deleteEvent',{quotationID:quotationID});
}

function getQuotationDetails($http){
    return $http.post('Quotation.aspx/getQuotationDetails',{});
}

//function getSuggestionDetails(Service,quotetionID,$http){
//    return $http.post('Quotation.aspx/getSuggestionDetails',{Service:Service,quotetionID:quotetionID});
//}


memberPanelApp.controller('CaterDetailsController', function ($scope, $routeParams, Page,$http) {
    var typeID = $routeParams.id;
    var name = 'Cater';

    getCaterDetails(typeID, $http).success(function(data){
        $scope.caterList = JSON.parse(data.d);
    }).error(function(error){
        alert('Error'+ JSON.stringify(error));
    })

    getCaterImages(typeID, $http).success(function (data) {
        $scope.ImageList = JSON.parse(data.d);
    });

    $scope.caterQuotationDetails = function(){
       
        if(getCookie('EventCustomerCookie') === undefined || getCookie('EventCustomerCookie') === null){
            window.location.href = "#/login";
        }
        else{

            caterQuotation(typeID,name, $http).success(function (data) {
                var value = JSON.parse(data.d);
                if(value[0].STR_RETURN == 'success'){
                    showSuccessMessage('Added to Qoutation....');
                }

                else{
                    showErrorMessage(value[0].STR_RETURN);
                }
            });
            console.log("success")
        }
    }
});

function caterQuotation(typeID,name,$http){
    return $http.post('CaterDetails.aspx/caterQuotation',{typeID:typeID,name:name});
}

function getCaterDetails(typeID,$http){
    return $http.post('CaterDetails.aspx/getCaterDetails',{typeID:typeID});
}

function getCaterImages(typeID, $http){
    return $http.post('CaterDetails.aspx/getCaterImages',{typeID:typeID});
}

memberPanelApp.controller('CaterBookingController', function ($scope, $http) {

    $scope.caterBookingDetail = function () {
        if (CaterBookingValidation($scope)) {
            var caterName = ($scope.caterName == '' || $scope.caterName == undefined) ? '' : $scope.caterName;
            var northIndia = ($scope.northIndia == '' || $scope.northIndia == undefined) ? '' : $scope.northIndia;
            var southIndia = ($scope.southIndia == '' || $scope.southIndia == undefined) ? '' : $scope.southIndia;
            var chaatFood = ($scope.chaatFood == '' || $scope.chaatFood == undefined) ? '' : $scope.chaatFood;
            var seaFood = ($scope.seaFood == '' || $scope.seaFood == undefined) ? '' : $scope.seaFood;
            var licenceImg = ($scope.licenceImg == '' || $scope.licenceImg == undefined) ? '' : $scope.licenceImg;
            var caterImagesList = ($scope.imageList == '' || $scope.imageList == undefined) ? '' : JSON.stringify($scope.imageList);
            var caterAddress = ($scope.caterAddress == '' || $scope.caterAddress == undefined) ? '' : $scope.caterAddress;
            var selectedDistrict = ($scope.selectedDistrict == '' || $scope.selectedDistrict == undefined) ? '' : $scope.selectedDistrict;
            var city = ($scope.city == '' || $scope.city == undefined) ? '' : $scope.city;
            var pinCode = ($scope.pinCode == '' || $scope.pinCode == undefined) ? '' : $scope.pinCode;
            var totalcharges = ($scope.totalcharges == '' || $scope.totalcharges == undefined) ? '' : $scope.totalcharges;
            var aboutCater = ($scope.aboutCater == '' || $scope.aboutCater == undefined) ? '' : $scope.aboutCater;
            var phoneNumber = ($scope.phoneNumber == '' || $scope.phoneNumber == undefined) ? '' : $scope.phoneNumber;

            CaterBooking(caterName, northIndia, southIndia, chaatFood,seaFood,licenceImg, caterImagesList, caterAddress, selectedDistrict, city, pinCode,totalcharges, aboutCater, phoneNumber, $http).success(function (data) {
                var value = JSON.parse(data.d);
                showSuccessMessage('Cater Added Successfully....');

                $scope.caterName = '';
                $scope.northIndia = '';
                $scope.southIndia = '';
                $scope.chaatFood = '';
                $scope.seaFood = '';
                $scope.licenceImg = '';
                $scope.imageList.splice(0,$scope.imageList.length);
                $scope.caterAddress = '';
                $scope.selectedDistrict = '';
                $scope.city = '';
                $scope.pinCode = '';
                $scope.totalcharges == '';
                $scope.aboutCater == '';
                $scope.phoneNumber == '';
            });
            console.log("success")
        }
        
    }

    $scope.uploadMemberLicenceImage = function (evt) {
        var fileUpload = $("#licenceImage").get(0);
        var files = fileUpload.files;

        var data = new FormData();
        for (var i = 0; i < files.length; i++) {
            data.append(files[i].name, files[i]);
        }

        $.ajax({
            url: "HallLicenceImage.ashx",
            type: "POST",
            data: data,
            contentType: false,
            processData: false,
            success: function (result) {
                $scope.licenceImg = result;
                $scope.$apply();
            },
            error: function (err) {
                alert(err.statusText)
            }
        });

    }

    $scope.imageList = [];  

    $scope.uploadCaterImage = function () {
        var fileUpload = $("#caterImage").get(0);
        var files = fileUpload.files;

        var data = new FormData();
        for (var i = 0; i < files.length; i++) {
            data.append(files[i].name, files[i]);
        }

        getAjaxImage("CaterImage.ashx", data).done(function (data){
            $scope.decorateImages = data;

            if($scope.imageList.length <4){
                $scope.imageList.push({'PRODUCT_IMAGE_PATH':data});
                console.log($scope.imageList);
                $scope.$apply();
            }
            else{
                showErrorMessage("Cant Add More than 4 Images");
            }
        }).fail(function(error){
            alert(JSON.stringify(error))
        })
    }

    $scope.deleteImageList = function (name) {

        for (var i = 0 ; i < $scope.imageList.length; i++) {

            if ($scope.imageList[i].$$hashKey == name) {
                $scope.imageList.splice(i, 1); 
                break; 
            }
        }
    }
});


function  getAjaxImage(filePath,data){
    return $.ajax({
        url: filePath,
        type: "POST",
        data: data,
        contentType: false,
        processData: false,
    });
    
}

function CaterBooking(caterName, northIndia, southIndia, chaatFood, seaFood,licenceImg, caterImagesList, caterAddress, selectedDistrict, city, pinCode,totalcharges, aboutCater, phoneNumber, $http) {
    return $http.post('CaterBooking.aspx/caterBooking', { caterName: caterName, northIndia: northIndia, southIndia: southIndia, chaatFood: chaatFood,
        seaFood:seaFood, licenceImg:licenceImg, caterImagesList:caterImagesList, caterAddress:caterAddress, selectedDistrict:selectedDistrict, city:city,
        pinCode:pinCode, totalcharges:totalcharges, aboutCater:aboutCater, phoneNumber:phoneNumber})
}

function CaterBookingValidation($scope) {
    var isValid = true;

    if ($scope.caterName == '' || $scope.caterName == null || $scope.caterName == undefined) {
        showErrorMessage("Please Enter Cater Name");
        isValid = false;
    }
    else if ($scope.phoneNumber == '' || $scope.phoneNumber == null || $scope.phoneNumber == undefined) {
        showErrorMessage("Please Enter Phone Number");
        isValid = false;
    }
    else if ($scope.northIndia == '' || $scope.northIndia == null || $scope.northIndia == undefined) {
        showErrorMessage("Please Enter North Indian Dish Charges");
        isValid = false;
    }
    else if ($scope.southIndia == '' || $scope.southIndia == null || $scope.southIndia == undefined) {
        showErrorMessage("Please Enter South Indian Dish Charges");
        isValid = false;
    }
    else if ($scope.chaatFood == '' || $scope.chaatFood == null || $scope.chaatFood == undefined) {
        showErrorMessage("Please Enter Chaat Food Charges");
        isValid = false;
    }
    else if ($scope.totalcharges == '' || $scope.totalcharges == null || $scope.totalcharges == undefined) {
        showErrorMessage("Please Enter Total Catering Charges");
        isValid = false;
    }
    else if ($scope.seaFood == '' || $scope.seaFood == null || $scope.seaFood == undefined) {
        showErrorMessage("Please Enter Sea Food Charges");
        isValid = false;
    }
    else if ($scope.licenceImg == '' || $scope.licenceImg == null || $scope.licenceImg == undefined) {
        showErrorMessage("Please Insert Licence Image");
        var isValid = false;
    }
    else if ($scope.imageList == '' || $scope.imageList == null || $scope.imageList == undefined) {
        showErrorMessage("Please Insert Decorates Images");
        var isValid = false;
    }
    else if ($scope.aboutCater == '' || $scope.aboutCater == null || $scope.aboutCater == undefined) {
        showErrorMessage("Please Enter About Caters");
        var isValid = false;
    }
    else if ($scope.caterAddress == '' || $scope.caterAddress == null || $scope.caterAddress == undefined) {
        showErrorMessage("Please Enter Cater Address");
        var isValid = false;
    }
    else if ($scope.selectedDistrict == '' || $scope.selectedDistrict == null || $scope.selectedDistrict == undefined) {
        showErrorMessage("Please Select District");
        var isValid = false;
    }
    else if ($scope.city == '' || $scope.city == null || $scope.city == undefined) {
        showErrorMessage("Please Enter City");
        var isValid = false;
    }
    else if ($scope.pinCode == '' || $scope.pinCode == null || $scope.pinCode == undefined) {
        showErrorMessage("Please Enter Pin Code");
        var isValid = false;
    }
    return isValid;
}

memberPanelApp.controller('CaterController', function ($scope, $http) {
    function getCookie(name) {
        const value = `; ${document.cookie}`;
        const parts = value.split(`; ${name}=`);
        if (parts.length === 2) return parts.pop().split(';').shift();
        return null; // Return null if the cookie is not found
    }

    $scope.checkLogin = function(){
        if(getCookie('EventCustomerCookie') === undefined || getCookie('EventCustomerCookie') === null){
            //alert("Please log in first to add hall")
            window.location.href = "#/login";
            //window.location.reload();
        }
        else{
            window.location.href = "#/CaterBooking";
            window.location.reload();
        }
    }
    getCater( $http).success(function (data) {
        $scope.caterList = JSON.parse(data.d);
    });
});

function getCater($http) {
    return $http.post('Cater.aspx/getCater',{})
}

memberPanelApp.controller('PhotographyDetailsController', function ($scope, $routeParams, Page,$http) {
    var typeID = $routeParams.id;
    var name = 'Photographer';

    getPhotographerDetails(typeID, $http).success(function(data){
        $scope.photographerList = JSON.parse(data.d);
    }).error(function(error){
        alert('Error'+ JSON.stringify(error));
    })

    getPhotographerImages(typeID, $http).success(function (data) {
        $scope.ImageList = JSON.parse(data.d);
    });

    $scope.photographyQuotationDetails = function(){
      
        if(getCookie('EventCustomerCookie') === undefined || getCookie('EventCustomerCookie') === null){
            window.location.href = "#/login";
        }
        else{

            photographyQuotation(typeID,name, $http).success(function (data) {
                var value = JSON.parse(data.d);
                if(value[0].STR_RETURN == 'success'){
                    showSuccessMessage('Added to Qoutation....');
                }

                else{
                    showErrorMessage(value[0].STR_RETURN);
                }
            });
            console.log("success")
        }
    }
});

function photographyQuotation(typeID,name,$http){
    return $http.post('PhotographyDetails.aspx/photographyQuotation',{typeID:typeID,name:name});
}

function getPhotographerDetails(typeID,$http){
    return $http.post('PhotographyDetails.aspx/getPhotographerDetails',{typeID:typeID});
}

function getPhotographerImages(typeID, $http){
    return $http.post('PhotographyDetails.aspx/getPhotographerImages',{typeID:typeID});
}


memberPanelApp.controller('PhotographerBookingController', function ($scope, $http) {

    $scope.PhotographerBookingDetail = function () {
        if (PhotographerBookingValidation($scope)) {
            var photographerName = ($scope.photographerName == '' || $scope.photographerName == undefined) ? '' : $scope.photographerName;
            var PreWedding = ($scope.PreWedding == '' || $scope.PreWedding == undefined) ? '' : $scope.PreWedding;
            var wholeWedding = ($scope.wholeWedding == '' || $scope.wholeWedding == undefined) ? '' : $scope.wholeWedding;
            var traditional = ($scope.traditional == '' || $scope.traditional == undefined) ? '' : $scope.traditional;
            var candid = ($scope.candid == '' || $scope.candid == undefined) ? '' : $scope.candid;
            var licenceImg = ($scope.licenceImg == '' || $scope.licenceImg == undefined) ? '' : $scope.licenceImg;
            var photographyImagesList = ($scope.imageList == '' || $scope.imageList == undefined) ? '' : JSON.stringify($scope.imageList);
            var photographerAddress = ($scope.photographerAddress == '' || $scope.photographerAddress == undefined) ? '' : $scope.photographerAddress;
            var selectedDistrict = ($scope.selectedDistrict == '' || $scope.selectedDistrict == undefined) ? '' : $scope.selectedDistrict;
            var city = ($scope.city == '' || $scope.city == undefined) ? '' : $scope.city;
            var pinCode = ($scope.pinCode == '' || $scope.pinCode == undefined) ? '' : $scope.pinCode;
            var phoneNumber = ($scope.phoneNumber == '' || $scope.phoneNumber == undefined) ? '' : $scope.phoneNumber;

            PhotographerBooking(photographerName, PreWedding, wholeWedding, traditional,candid,licenceImg, photographyImagesList, photographerAddress, selectedDistrict, city, pinCode, phoneNumber, $http).success(function (data) {
                var value = JSON.parse(data.d);
                showSuccessMessage('Photographer Added Successfully....');

                $scope.photographerName = '';
                $scope.PreWedding = '';
                $scope.wholeWedding = '';
                $scope.traditional = '';
                $scope.candid = '';
                $scope.licenceImg = '';
                $scope.imageList.splice(0,$scope.imageList.length);
                $scope.photographerAddress = '';
                $scope.selectedDistrict = '';
                $scope.city = '';
                $scope.pinCode = '';
                $scope.phoneNumber = '';
            });
            console.log("success")
        }
        
    }

    $scope.uploadMemberLicenceImage = function (evt) {
        var fileUpload = $("#licenceImage").get(0);
        var files = fileUpload.files;

        var data = new FormData();
        for (var i = 0; i < files.length; i++) {
            data.append(files[i].name, files[i]);
        }

        $.ajax({
            url: "HallLicenceImage.ashx",
            type: "POST",
            data: data,
            contentType: false,
            processData: false,
            success: function (result) {
                $scope.licenceImg = result;
                $scope.$apply();
            },
            error: function (err) {
                alert(err.statusText)
            }
        });

    }

    $scope.imageList = [];  

    $scope.uploadPhotographyImage = function () {
        var fileUpload = $("#photographyImage").get(0);
        var files = fileUpload.files;

        var data = new FormData();
        for (var i = 0; i < files.length; i++) {
            data.append(files[i].name, files[i]);
        }

        getAjaxImage("PhotographyImages.ashx", data).done(function (data){
            $scope.decorateImages = data;

            if($scope.imageList.length <4){
                $scope.imageList.push({'PRODUCT_IMAGE_PATH':data});
                console.log($scope.imageList);
                $scope.$apply();
            }
            else{
                showErrorMessage("Cant Add More than 4 Images");
            }
        }).fail(function(error){
            alert(JSON.stringify(error))
        })
    }

    $scope.deleteImageList = function (name) {

        for (var i = 0 ; i < $scope.imageList.length; i++) {

            if ($scope.imageList[i].$$hashKey == name) {
                $scope.imageList.splice(i, 1); 
                break; 

            }
        }
    }

});


function  getAjaxImage(filePath,data){
    return $.ajax({
        url: filePath,
        type: "POST",
        data: data,
        contentType: false,
        processData: false,
    });
    
}

function PhotographerBooking(photographerName, PreWedding, wholeWedding, traditional, candid,licenceImg, photographyImagesList, photographerAddress, selectedDistrict, city,
    pinCode,phoneNumber, $http) {
    return $http.post('PhotographerBooking.aspx/photographerBooking', { photographerName: photographerName, PreWedding: PreWedding, wholeWedding: wholeWedding, traditional: traditional,
        candid:candid, licenceImg:licenceImg, photographyImagesList:photographyImagesList, photographerAddress:photographerAddress, selectedDistrict:selectedDistrict, city:city,
        pinCode:pinCode, phoneNumber:phoneNumber})
}

function PhotographerBookingValidation($scope) {
    var isValid = true;

    if ($scope.photographerName == '' || $scope.photographerName == null || $scope.photographerName == undefined) {
        showErrorMessage("Enter Photographer Name");
        isValid = false;
    }
    else if ($scope.phoneNumber == '' || $scope.phoneNumber == null || $scope.phoneNumber == undefined) {
        showErrorMessage("Please Enter Phone Number");
        isValid = false;
    }
    else if ($scope.PreWedding == '' || $scope.PreWedding == null || $scope.PreWedding == undefined) {
        showErrorMessage("Please Enter Pre-wedding Photography Charges");
        isValid = false;
    }
    else if ($scope.wholeWedding == '' || $scope.wholeWedding == null || $scope.wholeWedding == undefined) {
        showErrorMessage("Please Enter Whole Wedding Photography Charges");
        isValid = false;
    }
    else if ($scope.traditional == '' || $scope.traditional == null || $scope.traditional == undefined) {
        showErrorMessage("Please Enter Traditional Photography Charges");
        isValid = false;
    }
    else if ($scope.candid == '' || $scope.candid == null || $scope.candid == undefined) {
        showErrorMessage("Please Enter Candid Photography Charges");
        isValid = false;
    }
    else if ($scope.licenceImg == '' || $scope.licenceImg == null || $scope.licenceImg == undefined) {
        showErrorMessage("Please Insert Licence Image");
        var isValid = false;
    }
    else if ($scope.imageList == '' || $scope.imageList == null || $scope.imageList == undefined) {
        showErrorMessage("Please Insert Photography Images");
        var isValid = false;
    }
    else if ($scope.photographerAddress == '' || $scope.photographerAddress == null || $scope.photographerAddress == undefined) {
        showErrorMessage("Please Enter Photographer Address");
        var isValid = false;
    }
    else if ($scope.selectedDistrict == '' || $scope.selectedDistrict == null || $scope.selectedDistrict == undefined) {
        showErrorMessage("Please Select District");
        var isValid = false;
    }
    else if ($scope.city == '' || $scope.city == null || $scope.city == undefined) {
        showErrorMessage("Please Enter City");
        var isValid = false;
    }
    else if ($scope.pinCode == '' || $scope.pinCode == null || $scope.pinCode == undefined) {
        showErrorMessage("Please Enter Pin Code");
        var isValid = false;
    }
    return isValid;
}

memberPanelApp.controller('PhotographyController', function ($scope, $http) {
    function getCookie(name) {
        const value = `; ${document.cookie}`;
        const parts = value.split(`; ${name}=`);
        if (parts.length === 2) return parts.pop().split(';').shift();
        return null; // Return null if the cookie is not found
    }

    $scope.checkLogin = function(){
        if(getCookie('EventCustomerCookie') === undefined || getCookie('EventCustomerCookie') === null){
            //alert("Please log in first to add hall")
            window.location.href = "#/login";
            //  window.location.reload();
        }
        else{
            window.location.href = "#/PhotographerBooking";
            window.location.reload();
        }
    }
    getPhotographer( $http).success(function (data) {
        $scope.photographerList = JSON.parse(data.d);
    });
});

function getPhotographer($http) {
    return $http.post('Photography.aspx/getPhotographer',{})
}

memberPanelApp.controller('DecoratorDetailsController', function ($scope, $routeParams, Page,$http) {
    var typeID = $routeParams.id;
    var name = 'Decoration'

    getDecorateDetails(typeID, $http).success(function(data){
        $scope.decorateList = JSON.parse(data.d);
    }).error(function(error){
        alert('Error'+ JSON.stringify(error));
    })

    getDecorateImages(typeID, $http).success(function (data) {
        $scope.ImageList = JSON.parse(data.d);
    });

    $scope.decorateQuotationDetails = function(){
       
        if(getCookie('EventCustomerCookie') === undefined || getCookie('EventCustomerCookie') === null){
            window.location.href = "#/login";
        }
        else{
            decorateQuotation(typeID,name, $http).success(function (data) {
                var value = JSON.parse(data.d);
                if(value[0].STR_RETURN == 'success'){
                    showSuccessMessage('Added to Qoutation....');
                }

                else{
                    showErrorMessage(value[0].STR_RETURN);
                }
            });
            console.log("success")
        }
    }
});

function decorateQuotation(typeID,name,$http){
    return $http.post('DecoratorDetails.aspx/decorateQuotation',{typeID:typeID,name:name});
}

function getDecorateDetails(typeID,$http){
    return $http.post('DecoratorDetails.aspx/getDecorateDetails',{typeID:typeID});
}

function getDecorateImages(typeID, $http){
    return $http.post('DecoratorDetails.aspx/getDecorateImages',{typeID:typeID});
}

memberPanelApp.controller('DecorateBookingController', function ($scope, $http) {

    $scope.DecorateBookingDetail = function () {
        if (DecorateBookingValidation($scope)) {
            var decoratorName = ($scope.decoratorName == '' || $scope.decoratorName == undefined) ? '' : $scope.decoratorName;
            var realFloralCharges = ($scope.realFloralCharges == '' || $scope.realFloralCharges == undefined) ? '' : $scope.realFloralCharges;
            var floralCarCharges = ($scope.floralCarCharges == '' || $scope.floralCarCharges == undefined) ? '' : $scope.floralCarCharges;
            var artificialFloralCharges = ($scope.artificialFloralCharges == '' || $scope.artificialFloralCharges == undefined) ? '' : $scope.artificialFloralCharges;
            var artificialFloralCarCharges = ($scope.artificialFloralCarCharges == '' || $scope.artificialFloralCarCharges == undefined) ? '' : $scope.artificialFloralCarCharges;
            var totalCharges = ($scope.totalCharges == '' || $scope.totalCharges == undefined) ? '' : $scope.totalCharges;
            var licenceImg = ($scope.licenceImg == '' || $scope.licenceImg == undefined) ? '' : $scope.licenceImg;
            var decorateImagesList = ($scope.imageList == '' || $scope.imageList == undefined) ? '' : JSON.stringify($scope.imageList);
            var decoratorAddress = ($scope.decoratorAddress == '' || $scope.decoratorAddress == undefined) ? '' : $scope.decoratorAddress;
            var aboutDecoration = ($scope.aboutDecoration == '' || $scope.aboutDecoration == undefined) ? '' : $scope.aboutDecoration;
            var selectedDistrict = ($scope.selectedDistrict == '' || $scope.selectedDistrict == undefined) ? '' : $scope.selectedDistrict;
            var city = ($scope.city == '' || $scope.city == undefined) ? '' : $scope.city;
            var pinCode = ($scope.pinCode == '' || $scope.pinCode == undefined) ? '' : $scope.pinCode;
            var mobileNumber = ($scope.mobileNumber == '' || $scope.mobileNumber == undefined) ? '' : $scope.mobileNumber;

            DecorateBooking(decoratorName, realFloralCharges, floralCarCharges, artificialFloralCharges,artificialFloralCarCharges,totalCharges,licenceImg, decorateImagesList, decoratorAddress,aboutDecoration, selectedDistrict, city, pinCode, mobileNumber, $http).success(function (data) {
                var value = JSON.parse(data.d);
                showSuccessMessage('Decorator Added Successfully....');

                $scope.decoratorName = '';
                $scope.realFloralCharges = '';
                $scope.floralCarCharges = '';
                $scope.artificialFloralCharges = '';
                $scope.artificialFloralCarCharges = '';
                $scope.totalCharges = '';
                $scope.licenceImg = '';
                $scope.imageList.splice(0,$scope.imageList.length);
                $scope.decoratorAddress = '';
                $scope.aboutDecoration == ''
                $scope.selectedDistrict = '';
                $scope.city = '';
                $scope.pinCode = '';
                $scope.mobileNumber = '';
            });
            console.log("success")
        }
        
    }

    $scope.uploadMemberLicenceImage = function (evt) {
        var fileUpload = $("#licenceImage").get(0);
        var files = fileUpload.files;

        var data = new FormData();
        for (var i = 0; i < files.length; i++) {
            data.append(files[i].name, files[i]);
        }

        $.ajax({
            url: "HallLicenceImage.ashx",
            type: "POST",
            data: data,
            contentType: false,
            processData: false,
            success: function (result) {
                $scope.licenceImg = result;
                $scope.$apply();
            },
            error: function (err) {
                alert(err.statusText)
            }
        });

    }

    $scope.imageList = [];  

    $scope.uploadDecorateImage = function () {
        var fileUpload = $("#decorateImage").get(0);
        var files = fileUpload.files;

        var data = new FormData();
        for (var i = 0; i < files.length; i++) {
            data.append(files[i].name, files[i]);
        }

        getAjaxImage("DecoratorImage.ashx", data).done(function (data){
            $scope.decorateImages = data;

            if($scope.imageList.length <4){
                $scope.imageList.push({'PRODUCT_IMAGE_PATH':data});
                console.log($scope.imageList);
                $scope.$apply();
            }
            else{
                showErrorMessage("Cant Add More than 4 Images");
            }
        }).fail(function(error){
            alert(JSON.stringify(error))
        })
    }

    $scope.deleteImageList = function (name) {

        for (var i = 0 ; i < $scope.imageList.length; i++) {

            if ($scope.imageList[i].$$hashKey == name) {
                $scope.imageList.splice(i, 1); 
                break; 

            }
        }
    }

});


function  getAjaxImage(filePath,data){
    return $.ajax({
        url: filePath,
        type: "POST",
        data: data,
        contentType: false,
        processData: false,
    });
    
}

function DecorateBooking(decoratorName, realFloralCharges, floralCarCharges, artificialFloralCharges, artificialFloralCarCharges,totalCharges,licenceImg, decorateImagesList, decoratorAddress, aboutDecoration,selectedDistrict, city,
    pinCode, mobileNumber, $http) {
    return $http.post('DecorateBooking.aspx/decorateBooking', { decoratorName: decoratorName, realFloralCharges: realFloralCharges, floralCarCharges: floralCarCharges, artificialFloralCharges: artificialFloralCharges,
        artificialFloralCarCharges:artificialFloralCarCharges,totalCharges:totalCharges, licenceImg:licenceImg, decorateImagesList:decorateImagesList, decoratorAddress:decoratorAddress, aboutDecoration:aboutDecoration,selectedDistrict:selectedDistrict, city:city,
        pinCode:pinCode, mobileNumber:mobileNumber})
}

function DecorateBookingValidation($scope) {
    var isValid = true;

    if ($scope.decoratorName == '' || $scope.decoratorName == null || $scope.decoratorName == undefined) {
        showErrorMessage("Enter Decorator Name");
        isValid = false;
    }
    else if ($scope.mobileNumber == '' || $scope.mobileNumber == null || $scope.mobileNumber == undefined) {
        showErrorMessage("Please Enter Contact Number");
        isValid = false;
    }
    else if ($scope.realFloralCharges == '' || $scope.realFloralCharges == null || $scope.realFloralCharges == undefined) {
        showErrorMessage("Enter Real Floral Decoration Charges");
        isValid = false;
    }
    else if ($scope.floralCarCharges == '' || $scope.floralCarCharges == null || $scope.floralCarCharges == undefined) {
        showErrorMessage("Please Enter Floral Car Decoration Charges");
        isValid = false;
    }
    else if ($scope.artificialFloralCharges == '' || $scope.artificialFloralCharges == null || $scope.artificialFloralCharges == undefined) {
        showErrorMessage("Please Enter Artificial Floral Decoration Charges");
        isValid = false;
    }
    else if ($scope.artificialFloralCarCharges == '' || $scope.artificialFloralCarCharges == null || $scope.artificialFloralCarCharges == undefined) {
        showErrorMessage("Please Enter Artificial Floral Car Decoration Charges");
        isValid = false;
    }
    else if ($scope.totalCharges == '' || $scope.totalCharges == null || $scope.totalCharges == undefined) {
        showErrorMessage("Please Enter Total Charges");
        isValid = false;
    }
    else if ($scope.licenceImg == '' || $scope.licenceImg == null || $scope.licenceImg == undefined) {
        showErrorMessage("Please Insert Licence Image");
        var isValid = false;
    }
    else if ($scope.imageList == '' || $scope.imageList == null || $scope.imageList == undefined) {
        showErrorMessage("Please Insert Decorates Images");
        var isValid = false;
    }
    else if ($scope.aboutDecoration == '' || $scope.aboutDecoration == null || $scope.aboutDecoration == undefined) {
        showErrorMessage("Please Enter About Decorations");
        var isValid = false;
    }
    else if ($scope.decoratorAddress == '' || $scope.decoratorAddress == null || $scope.decoratorAddress == undefined) {
        showErrorMessage("Please Enter Decorator Address");
        var isValid = false;
    }
    else if ($scope.selectedDistrict == '' || $scope.selectedDistrict == null || $scope.selectedDistrict == undefined) {
        showErrorMessage("Please Select District");
        var isValid = false;
    }
    else if ($scope.city == '' || $scope.city == null || $scope.city == undefined) {
        showErrorMessage("Please Enter City");
        var isValid = false;
    }
    else if ($scope.pinCode == '' || $scope.pinCode == null || $scope.pinCode == undefined) {
        showErrorMessage("Please Enter Pin Code");
        var isValid = false;
    }
    return isValid;
}

memberPanelApp.controller('DecorationController', function ($scope, $http) {

    function getCookie(name) {
        const value = `; ${document.cookie}`;
        const parts = value.split(`; ${name}=`);
        if (parts.length === 2) return parts.pop().split(';').shift();
        return null; // Return null if the cookie is not found
    }

    $scope.checkLogin = function(){
        if(getCookie('EventCustomerCookie') === undefined || getCookie('EventCustomerCookie') === null){
            //alert("Please log in first to add hall")
            window.location.href = "#/login";
            //window.location.reload();
        }
        else{
            window.location.href = "#/DecorateBooking";
            window.location.reload();
        }
    }
    getDecorator( $http).success(function (data) {
        $scope.decorateList = JSON.parse(data.d);
    });
});

function getDecorator($http) {
    return $http.post('Decoration.aspx/getDecorator',{})
}

memberPanelApp.controller('HallDetailsController', function ($scope, $routeParams, Page,$http) {
    var typeID = $routeParams.id;
    var name = 'Hall';
    //var name;
    getHallDetails(typeID, $http).success(function(data){
        $scope.hallImages = JSON.parse(data.d);

        //$scope.mobileNumber = hallImages[0].CONTACT_NUMBER;
        //$scope.hallEvent = 'Hall';
    }).error(function(error){
        alert('Error'+ JSON.stringify(error));
    })

    getHallImages(typeID, $http).success(function (data) {
        $scope.ImageList = JSON.parse(data.d);
    });

    $scope.hallQuotationDetails = function(){
        
        if(getCookie('EventCustomerCookie') === undefined || getCookie('EventCustomerCookie') === null){
            window.location.href = "#/login";
        }
        else{
            
            hallQuotation(typeID,name, $http).success(function (data) {
                var value = JSON.parse(data.d);
                if(value[0].STR_RETURN == 'success'){
                    showSuccessMessage('Added to Qoutation....');
                }

                else{
                    showErrorMessage(value[0].STR_RETURN);
                }
            });
            console.log("success")
        }
    }
});

function hallQuotation(typeID,name,$http){
    return $http.post('HallDetails.aspx/hallQuotation',{typeID:typeID,name:name});
}

function getHallDetails(typeID,$http){
    return $http.post('HallDetails.aspx/getHallDetails',{typeID:typeID});
}

function getHallDetails(typeID,$http){
    return $http.post('HallDetails.aspx/getHallDetails',{typeID:typeID});
}

function getHallImages(typeID, $http){
    return $http.post('HallDetails.aspx/getHallImages',{typeID:typeID});
}

memberPanelApp.controller('HallController', function ($scope, $http) {

    function getCookie(name) {
        const value = `; ${document.cookie}`;
        const parts = value.split(`; ${name}=`);
        if (parts.length === 2) return parts.pop().split(';').shift();
        return null; // Return null if the cookie is not found
    }

    $scope.checkLogin = function(){
        if(getCookie('EventCustomerCookie') === undefined || getCookie('EventCustomerCookie') === null){
            //alert("Please log in first to add hall")
            window.location.href = "#/login";
            //   window.location.reload();
        }
        else{
            window.location.href = "#/hallBooking";
            window.location.reload();
        }
    }
    getHall( $http).success(function (data) {
        $scope.hallList = JSON.parse(data.d);
    });
});

function getHall($http) {
    return $http.post('Hall.aspx/getHall',{})
}

memberPanelApp.controller('LogOutController', function ($scope, $http) {

    logout($http).success(function(data){
        window.location.href = "#/login";
        window.location.reload();
    }).error(function(error){
        alert('Error'+JSON.stringify(error));
    });

});

function logout($http){
    return $http.post('LogOut.aspx/logOutMember',{data:{} })
}

memberPanelApp.controller('HallBookingController', function ($scope, $http) {

    $scope.HallBookingDetail = function () {
        if (HallBookingValidation($scope)) {
            var hallName = ($scope.hallName == '' || $scope.hallName == undefined) ? '' : $scope.hallName;
            var capacity = ($scope.capacity == '' || $scope.capacity == undefined) ? '' : $scope.capacity;
            var hallType = ($scope.hallType == '' || $scope.hallType == undefined) ? '' : $scope.hallType;
            var catering = ($scope.catering == '' || $scope.catering == undefined) ? '' : $scope.catering;
            var licenceImg = ($scope.licenceImg == '' || $scope.licenceImg == undefined) ? '' : $scope.licenceImg;
            var hallImagesList = ($scope.imageList == '' || $scope.imageList == undefined) ? '' : JSON.stringify($scope.imageList);
            var rent = ($scope.rent == '' || $scope.rent == undefined) ? '' : $scope.rent;
            var selectedDistrict = ($scope.selectedDistrict == '' || $scope.selectedDistrict == undefined) ? '' : $scope.selectedDistrict;
            var city = ($scope.city == '' || $scope.city == undefined) ? '' : $scope.city;
            var pinCode = ($scope.pinCode == '' || $scope.pinCode == undefined) ? '' : $scope.pinCode;
            var hallAddress = ($scope.hallAddress == '' || $scope.hallAddress == undefined) ? '' : $scope.hallAddress;
            var aboutHall = ($scope.aboutHall == '' || $scope.aboutHall == undefined) ? '' : $scope.aboutHall;
            var mobileNumber = ($scope.mobileNumber == '' || $scope.mobileNumber == undefined) ? '' : $scope.mobileNumber;

            HallBooking(hallName, capacity, hallType, catering,licenceImg, hallImagesList, rent, selectedDistrict, city, pinCode, hallAddress,aboutHall, mobileNumber, $http).success(function (data) {
                var value = JSON.parse(data.d);
                showSuccessMessage('Hall Added Successfully....');

                $scope.hallName = '';
                $scope.capacity = '';
                $scope.hallType = '';
                $scope.catering = '';
                $scope.licenceImg = '';
                $scope.imageList.splice(0,$scope.imageList.length);
                $scope.rent = '';
                $scope.selectedDistrict = '';
                $scope.city = '';
                $scope.pinCode = '';
                $scope.hallAddress = '';
                $scope.aboutHall = '';
                $scope.mobileNumber = '';
            });
            console.log("success")
        }
        
    }

    $scope.uploadMemberLicenceImage = function (evt) {
        var fileUpload = $("#licenceImage").get(0);
        var files = fileUpload.files;

        var data = new FormData();
        for (var i = 0; i < files.length; i++) {
            data.append(files[i].name, files[i]);
        }

        $.ajax({
            url: "HallLicenceImage.ashx",
            type: "POST",
            data: data,
            contentType: false,
            processData: false,
            success: function (result) {
                $scope.licenceImg = result;
                $scope.$apply();
            },
            error: function (err) {
                alert(err.statusText)
            }
        });

    }

    $scope.imageList = [];  

    $scope.uploadHallImage = function () {
        var fileUpload = $("#hallImage").get(0);
        var files = fileUpload.files;

        var data = new FormData();
        for (var i = 0; i < files.length; i++) {
            data.append(files[i].name, files[i]);
        }

        getAjaxImage("HallImage.ashx", data).done(function (data){
            $scope.hallImages = data;

            if($scope.imageList.length <4){
                $scope.imageList.push({'PRODUCT_IMAGE_PATH':data});
                console.log($scope.imageList);
                $scope.$apply();
            }
            else{
                showErrorMessage("Cant Add More than 4 Images");
            }
        }).fail(function(error){
            alert(JSON.stringify(error))
        })
    }

    $scope.deleteImageList = function (name) {

        for (var i = 0 ; i < $scope.imageList.length; i++) {

            if ($scope.imageList[i].$$hashKey == name) {
                $scope.imageList.splice(i, 1); 
                break; 

            }
        }
    }

});


function  getAjaxImage(filePath,data){
    return $.ajax({
        url: filePath,
        type: "POST",
        data: data,
        contentType: false,
        processData: false,
    });
    
}

function HallBooking(hallName, capacity, hallType, catering, licenceImg, hallImagesList, rent, selectedDistrict, city,
    pinCode, hallAddress,aboutHall, mobileNumber, $http) {
    return $http.post('HallBooking.aspx/HallBook', { hallName: hallName, capacity: capacity, hallType: hallType, catering: catering,
        licenceImg:licenceImg, hallImagesList:hallImagesList, rent:rent, selectedDistrict:selectedDistrict, city:city,
        pinCode:pinCode, hallAddress:hallAddress, aboutHall:aboutHall, mobileNumber:mobileNumber})
}

function HallBookingValidation($scope) {
    var isValid = true;

    if ($scope.hallName == '' || $scope.hallName == null || $scope.hallName == undefined) {
        showErrorMessage("Enter Hall Name");
        isValid = false;
    }
    else if ($scope.capacity == '' || $scope.capacity == null || $scope.capacity == undefined) {
        showErrorMessage("Enter Hall Capacity");
        isValid = false;
    }
    else if ($scope.hallType == '' || $scope.hallType == null || $scope.hallType == undefined) {
        showErrorMessage("Please Select Hall Type");
        isValid = false;
    }
    else if ($scope.catering == '' || $scope.catering == null || $scope.catering == undefined) {
        showErrorMessage("Please Select Catering Type");
        isValid = false;
    }
    else if ($scope.licenceImg == '' || $scope.licenceImg == null || $scope.licenceImg == undefined) {
        showErrorMessage("Please Insert Licence Image");
        var isValid = false;
    }
    else if ($scope.imageList == '' || $scope.imageList == null || $scope.imageList == undefined) {
        showErrorMessage("Please Insert Hall Images");
        var isValid = false;
    }
    else if ($scope.rent == '' || $scope.rent == null || $scope.rent == undefined) {
        showErrorMessage("Please Enter Rent Amount");
        var isValid = false;
    }
    else if ($scope.mobileNumber == '' || $scope.mobileNumber == null || $scope.mobileNumber == undefined) {
        showErrorMessage("Please Enter Phone Number");
        var isValid = false;
    }
    else if ($scope.selectedDistrict == '' || $scope.selectedDistrict == null || $scope.selectedDistrict == undefined) {
        showErrorMessage("Please Select District");
        var isValid = false;
    }
    else if ($scope.city == '' || $scope.city == null || $scope.city == undefined) {
        showErrorMessage("Please Enter City");
        var isValid = false;
    }
    else if ($scope.pinCode == '' || $scope.pinCode == null || $scope.pinCode == undefined) {
        showErrorMessage("Please Enter Pin Code");
        var isValid = false;
    }
    else if ($scope.hallAddress == '' || $scope.hallAddress == null || $scope.hallAddress == undefined) {
        showErrorMessage("Please Enter Hall Address");
        var isValid = false;
    }
    else if ($scope.aboutHall == '' || $scope.aboutHall == null || $scope.aboutHall == undefined) {
        showErrorMessage("Please Write About Hall");
        var isValid = false;
    }
    return isValid;
}



memberPanelApp.controller('LoginController', function ($scope, $http) {

    $scope.LoginDetail = function () {
        var eMail = ($scope.eMail == '' || $scope.eMail == undefined) ? '' : $scope.eMail;
        var password = ($scope.password == '' || $scope.password == undefined) ? '' : $scope.password;

        if (eMail =='' || password =='') {
            showErrorMessage("Please Enter All Fields");
            return;
        } else {
            checkLogin(eMail, password, $http).success(function (data) {
                // Since data is a JSON string, parse it first
                var value = JSON.parse(data.d);
                console.log(value);
                if (value.status === "wrong") {
                    showErrorMessage("Invalid Username or Password");
                }
                else if (value.status === "error") {
                    showErrorMessage("Invalid Username or Password");
                }
                else if (value.status === "success") {
                    // Successfully logged in
                    window.location.href = "#/home";
                    window.location.reload();
                } 
                else {
                    showErrorMessage("An unexpected error occurred.");
                }
            }).error(function (error) {
                showErrorMessage("An error occurred while communicating with the server.");
                console.error(error); // Log error details
            });
        }
    };

});

function checkLogin(eMail, password, $http) {
    return $http.post('Login.aspx/checkLogin', { eMail: eMail, password: password })
}

memberPanelApp.controller('RegistrationController', function ($scope, $http) {
    $scope.MemberRegistrationDetail = function () {
        if (registrationValidation($scope)) {
            var memberName = ($scope.memberName == '' || $scope.memberName == undefined) ? '' : $scope.memberName;
            var eMail = ($scope.eMail == '' || $scope.eMail == undefined) ? '' : $scope.eMail;
            var mobileNumber = ($scope.mobileNumber == '' || $scope.mobileNumber == undefined) ? '' : $scope.mobileNumber;
            var password = ($scope.password == '' || $scope.password == undefined) ? '' : $scope.password;
            var cPassword = ($scope.cPassword == '' || $scope.cPassword == undefined) ? '' : $scope.cPassword;
            var address = ($scope.address == '' || $scope.address == undefined) ? '' : $scope.address;
            var city = ($scope.city == '' || $scope.city == undefined) ? '' : $scope.city;
            var district = ($scope.district == '' || $scope.district == undefined) ? '' : $scope.district;

            MemberRegistration(memberName, eMail, mobileNumber, password,address,city,district, $http).success(function (data) {
                var value = JSON.parse(data.d);
                showSuccessMessage('Member Registration Successfully....');

                $scope.memberName = '';
                $scope.eMail = '';
                $scope.mobileNumber = '';
                $scope.password = '';
                $scope.cPassword = '';
                $scope.address = '';
                $scope.city = '';
                $scope.district = '';
            });
            console.log("success")
        }
        
    }
});

function MemberRegistration(memberName, eMail, mobileNumber, password,address,city,district, $http) {
    return $http.post('Registration.aspx/MemberRegistration', { memberName: memberName, eMail: eMail, mobileNumber: mobileNumber, password: password,address:address, city:city,district:district })
}

function registrationValidation($scope) {
    var isValid = true;

    if ($scope.memberName == '' || $scope.memberName == null || $scope.memberName == undefined) {
        showErrorMessage("Enter Your Name");
        isValid = false;
    }
    else if ($scope.eMail == '' || $scope.eMail == null || $scope.eMail == undefined) {
        showErrorMessage("Enter Your Email");
        isValid = false;
    }
    else if ($scope.mobileNumber == '' || $scope.mobileNumber == null || $scope.mobileNumber == undefined) {
        showErrorMessage("Enter Your Mobile Number");
        isValid = false;
    }
    else if ($scope.address == '' || $scope.address == null || $scope.address == undefined) {
        showErrorMessage("Enter Your Address ");
        isValid = false;
    }
    else if ($scope.city == '' || $scope.city == null || $scope.city == undefined) {
        showErrorMessage("Enter Your city");
        isValid = false;
    }
    else if ($scope.district == '' || $scope.district == null || $scope.district == undefined) {
        showErrorMessage("Enter Your district");
        isValid = false;
    }
    else if ($scope.password == '' || $scope.password == null || $scope.password == undefined) {
        showErrorMessage("Enter Your Password");
        isValid = false;
    }
    else if ($scope.cPassword == '' || $scope.cPassword == null || $scope.cPassword == undefined) {
        showErrorMessage("Enter Your Confirm Password");
        var isValid = false;
    }
    else if ($scope.password != $scope.cPassword) {
        showErrorMessage("Password Does not match");
        var isValid = false;
    }

    return isValid;
}

function getUrlVars() {
    var vars = [], hash;
    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
    for (var i = 0; i < hashes.length; i++) {
        hash = hashes[i].split('=');
        vars.push(hash[0]);
        vars[hash[0]] = hash[1];
    }
    return vars;
}


function getCookie(name) {
    const value = `; ${document.cookie}`;
    const parts = value.split(`; ${name}=`);
    if (parts.length === 2) return parts.pop().split(';').shift();
    return null; // Return null if the cookie is not found
}

function parseCookie(cookieValue) {
    const cookieData = {};
    if (cookieValue) {
        cookieValue.split('&').forEach(item => {
            const [key, value] = item.split('=');
            cookieData[key] = decodeURIComponent(value);
        });
    }
    return cookieData;
}
memberPanelApp.controller('header', function ($scope,$location, Page, $http) {
    $scope.Page = Page;
    $scope.profile = false;
    $scope.menu = true;

    getUrlVars()

    var referralCode = getUrlVars()["memberCode"];

    function getCookie(name) {
        const value = `; ${document.cookie}`;
        const parts = value.split(`; ${name}=`);
        if (parts.length === 2) return parts.pop().split(';').shift();
        return null; // Return null if the cookie is not found
    }

    function parseCookie(cookieValue) {
        const cookieData = {};
        if (cookieValue) {
            cookieValue.split('&').forEach(item => {
                const [key, value] = item.split('=');
                cookieData[key] = decodeURIComponent(value);
            });
        }
        return cookieData;
    }

    if (getCookie('EventCustomerCookie') === undefined || getCookie('EventCustomerCookie') === null) {
        $scope.profile = false;
        $scope.menu = true;

    }
    else {
        $scope.profile = true;
        $scope.menu = false;

        const cookievalue = getCookie('EventCustomerCookie');
        const parsedData = parseCookie(cookievalue);
        $scope.userName = parsedData.EVENTCUSTOMERUSERNAME;
    }   


});

memberPanelApp.factory('Page', function () {
    var title = '';
    var withdrawal = '';
    var imagePath = '';
    var isGreen = false;
    return {
        title: function () { return title; },
        setTitle: function (newTitle) { title = newTitle; },
        withdrawal: function () { return withdrawal; },
        setTitleWithdrawal: function (newTitle) { withdrawal = newTitle; },
        imagePath: function () { return imagePath; },
        isGreen: function () { return isGreen; },
        setIsGreen: function (greenStatus) { isGreen = greenStatus; },
        setImagePath: function (newTitle) { imagePath = newTitle; }
    };


});
//function getMember($http, Page) {

//}
//function tryParseInt(str, defaultValue) {
//    var retValue = defaultValue;
//    if (typeof str !== "undefined") {
//        if (str.length > 0) {
//            if (!isNaN(str)) {
//                retValue = parseInt(str);
//            }
//        }
//    }
//    return retValue;
//}

memberPanelApp.directive('onlyNumbers', function () {
    return {
        restrict: 'A',
        link: function (scope, elm, attrs, ctrl) {
            elm.on('keydown', function (event) {
                if (event.shiftKey) { event.preventDefault(); return false; }
                //console.log(event.which);
                if ([8, 9, 13, 27, 37, 38, 39, 40].indexOf(event.which) > -1) {
                    // backspace, enter, escape, arrows
                    return true;
                } else if (event.which >= 48 && event.which <= 57) {
                    // numbers
                    return true;
                } else if (event.which >= 96 && event.which <= 105) {
                    // numpad number
                    return true;
                }
                    // else if ([110, 190].indexOf(event.which) > -1) {
                    //     // dot and numpad dot
                    //     return true;
                    // }
                else {
                    event.preventDefault();
                    return false;
                }
            });
        }
    }
});