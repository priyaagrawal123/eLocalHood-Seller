## Accept or Reject Order API3(action)
   PUT/API/Accept or Reject the Particular Order 

## Request Headers
   Content-Type:application/json

#### Request body
{
   orderid:"String"
   action:"String"
}

## Response
   200-Success(OK)



Body (json)
{
   Message: "Order Accepted"
           OR
   Message: "Order Rejected",
   
}

404 - Not Found

400 - Bad Request 
      Error:"ID not present in the order table"

500 - Internal Server Error
      Error: "MySQL Query Error in the Order_1 table to update the status of the order"

