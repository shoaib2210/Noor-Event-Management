<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Quotation.aspx.cs" Inherits="Quotation" %>

<style>
    .detail {
        font-style: italic;
        font-size: 15px;
    }

    table {
        border-collapse: collapse;
        margin: 30px;
        width: 100%;
    }

    /* Zebra striping */
    tr:nth-of-type(odd) {
        background: #eee;
    }

    th {
        background: #3498db;
        color: white;
        font-weight: bold;
    }

    td, th {
        padding: 10px;
        border: 1px solid #ccc;
        text-align: center;
        font-size: 18px;
    }
    
    .view:hover {
        background-color: #e82dff;
    }

    .delete:hover {
        color: black;
        background-color: #e82dff;
    }

    .total {
        border: none;
    }

  
</style>


<div class="breadcumb-wrapper">
    <div class="overlay"></div>
    <img src="assets/img/shapes/b-1-1.png" alt="shape" class="shape">
    <div class="container z-index-common">
        <div class="breadcumb-content">
            <h1 class="breadcumb-title">Our Noor Event</h1>
            <div class="breadcumb-menu-wrap">
                <ul class="breadcumb-menu">
                    <li><a href="#/home">Home</a></li>
                    <li>Quotation</li>
                </ul>
            </div>
        </div>
    </div>
</div>

<!-- Table Section -->
<div>
    <div class="table-responsive">
   
    <table >
        <thead>
            <tr>
                <th>SR.NO</th>
                <th>EVENT</th>
                <th>NAME</th>
                <th>ADDRESS</th>
                <th>DISTRICT</th>
                <th>CONTACT NUMBER</th>
                <th>CHARGES</th>
                <th class="button">VIEW</th>
                <th class="button">DELETE</th>
                
            </tr>
        </thead>
        <tbody>

            <tr ng-repeat="quotetion in quotationList">
                <td>{{ $index + 1 }}</td>
                <td>{{ quotetion.EventService }}</td>
                <td>{{ quotetion.EventName }}</td>
                <td>{{ quotetion.Adress }},{{ quotetion.City }}</td>
                <td>{{ quotetion.District}}</td>
                <td>{{ quotetion.ContactNumber}}</td>
                <td>₹ {{ quotetion.Charges | number:2}}</td>
                <td>
                    <button class="button" style="border: 2px solid black; background-color: #53d411; padding: 2px 10px; text-decoration: none; transition: all 0.3s ease;" ng-click="viewDetails(quotetion.EventService, quotetion.ID)">VIEW</button></td>
                <td>
                    <button class="button" style="background-color: #e90707; color: white; border-color: white;"  ng-click="deleteEventDetails(quotetion.QuotationID);" >DELETE</button></td>
             </tr>
        </tbody>
        <tfoot>
            <tr>
                <td class="total"></td><td class="total"></td><td class="total"></td ><td class="total"></td><td class="total"></td>
                <td  style="text-align: center;color: #7903ed;font-weight:900">Total Charges</td>
                     <td style="color: #4b11d5; font-weight: bold;">₹ {{ getTotalSalary() | number:2 }}</td>
                    <td class="total"></td><td class="total"></td>
            </tr>
        </tfoot>
    </table>
  
</div>
     <div style="display: flex; justify-content: center; align-items: center; height: 30vh;">
        <a href="#/getInvoice" class="vs-btn" tabindex="0" style="margin: auto;">get Invoice</a>
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