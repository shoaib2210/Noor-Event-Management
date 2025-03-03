<%@ Page Language="C#" AutoEventWireup="true" CodeFile="QuotetionPrint.aspx.cs" Inherits="QuotetionPrint" %>

<div class="invoice-container" id="print">
<!-- Styles -->
<style>
    .invoice-container {
        font-family: Arial, sans-serif;
        background-color: #f9f9f9;
        color: #333;
        padding: 20px;
        margin-top: 40px;
        background-color: azure;
    }

    .invoice-header {
        background-color: #28a745;
        color: white !important;
        padding: 20px;
        text-align: center;
    }

    .invoice-details {
        margin-top: 20px;
    }

    .invoice-info {
        display: flex;
        justify-content: left;
        padding-left: 20px;
    }

    .billing-info {
        width: 45%;
    }

    th {
        border: none !important;
        padding: 9px 12px;
        background-color: #007bff;
        color: white;
    }

    td {
        border: none;
        border-bottom: 1px solid #ddd !important;
    }

    .company {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        text-align: center;
        color: white;
        padding: 20px;
    }

    /* Only for print */
    @media print {
        table, th, td {
            padding: 15px 20px; /* Padding for print view only */
            /*border: 1px solid #ddd;*/ /* Border for print view */
        }

        /* Exclude <tfoot> from the changes */
        tfoot {
            border: none;
            padding: 9px 12px; /* No change to tfoot */
        }

        th {
            background-color: #007bff;
            color: white;
        }
        td {
            border-bottom: 1px solid #ddd !important;
        }
    }
</style>


    <!-- Invoice Header -->
    <div class="invoice-header">
        <h2 style="color:white;">Invoice</h2>
        <p style="color:white;">Noor Event</p>
        <p id="date" style="color:white;"></p>
    </div>

    <!-- Invoice Details Section -->
    <div class="invoice-details">
        <div class="invoice-info">
            <div class="billing-info">
                <h4>Billing Information</h4>
                <p><strong>Name:</strong> {{invoiceName}}</p>
                <p><strong>Address:</strong> {{invoiceAddress}}, {{invoiceCity}}, {{invoiceDistrict}}</p>
                 <p><strong>Contact Number:</strong> {{invoiceContactNo}}</p>
                <p><strong>Email:</strong> {{invoiceMail}}</p>
            </div>
        </div>
    </div>

    <div class="table-responsive">
        <table>
            <thead>
                <tr style="border:none;">
                    <th>SR.NO</th>
                    <th>EVENT</th>
                    <th>NAME</th>
                    <th>ADDRESS</th>
                    <th>DISTRICT</th>
                    <th>CONTACT NUMBER</th>
                    <th>CHARGES</th>
                </tr>
            </thead>

            <!-- Item Rows -->
            <tbody>
                <tr ng-repeat="quotetion in quotationList">
                    <td>{{ $index + 1 }}</td>
                    <td>{{ quotetion.EventService }}</td>
                    <td>{{ quotetion.EventName }}</td>
                    <td>{{ quotetion.Adress }},{{ quotetion.City }}</td>
                    <td>{{ quotetion.District}}</td>
                    <td>{{ quotetion.ContactNumber}}</td>
                    <td>₹ {{ quotetion.Charges | number:2}}</td>
                </tr>
            </tbody>
            <tfoot style="background-color:#ffc107">
                <tr>
                    <td></td><td></td><td></td><td></td><td></td>
                    <td style="font-weight:900">Total</td>
                    <td style="color: #28a745;font-weight:900">₹ {{ getTotalSalary() | number:2 }}</td>
                </tr>
            </tfoot>
        </table>
        
    </div>
         <div class="company">
            <p>&copy; 2025 Noor Event. All rights reserved.</p>
            <p>Thank you for choosing Noor Event for your special occasion!</p>
            <p>Created by Shoaib Kurane</p>
            <p style="color:black;font-weight:600;">shoaibkurane@gmail.com | 7499558835.</p>
        </div>
</div>
<div style="display: flex; justify-content: flex-end; padding: 20px;">
    <button style="width: 100px; height: 36px;    background-color: darkgreen;color: white;" onclick="printContent('print')">Print</button>
</div>

<!-- Print Button -->


<script>
    // Get the current date
    const today = new Date();
    const options = { year: 'numeric', month: 'long', day: 'numeric' };
    const formattedDate = today.toLocaleDateString('en-US', options);

    // Display the date in the paragraph
    document.getElementById('date').textContent = `Date: ${formattedDate}`;

    function printContent(id) {
        var content = document.getElementById(id).innerHTML;
        var myWindow = window.open('', '', 'height=600,width=800');
        myWindow.document.write('<html><head><title>Invoice</title>');
        myWindow.document.write('<style>body { font-family: Arial, sans-serif; }</style>');
        myWindow.document.write('</head><body>');
        myWindow.document.write(content);
        myWindow.document.write('</body></html>');
        myWindow.document.close(); // Necessary for IE >= 10
        myWindow.print();
    }
</script>
