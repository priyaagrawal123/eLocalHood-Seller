## Accept or Reject Order API1(SellerID)
   GET/API/View Order Details of Particular Seller

## Request Headers
   Content-Type:application/json

#### Request params
   orderid:"Integer"

## Response
   200-Success(OK)

Body (json)
{
   ID:"Integer",
   SellerID:"Integer",
   NetAmount: "Integer",
   Time: "YYYY-MM-DD HH:mm:ss in Asia/Kolkata timezone",
   CustomerID:"Integer",
   Status": "String",
   TypeOfProduct:"Integer"
}

404 - Not Found

400 - Bad Request 
      Error:"ID not Present in the order table"

500 - Internal Server Error
      Error:"MySQL Query Error in the Order_1 table to get the order details"


