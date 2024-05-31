## Accept or Reject Order API2(ProductID)
   GET/API/View OrderDescription of Particular Order

## Request Headers
   Content-Type:application/json

#### Request params
   productid:"Integer"

## Response
   200-Success(OK)


Body (json)
{
   Message:"Product details fetched successfully",
   OrderDescriptionID: "Integer",
   ProductID: "Integer",
   OrderDescriptionPrice:"Integer",
   OrderDescriptionTime: "YYYY-MM-DD HH:mm:ss in Asia/Kolkata timezone",
   Quantity:"Integer",
   ProductName:"String",
   ProductPrice:"Integer",
   Size: "String",
   Color: "String",
   Weight: "String"
}

404 - Not Found

400 - Bad Request 
      Error:"ID not present in the orderdescription table"

500 - Internal Server Error
      Error:"MySQL Query Error in the OrderDescription table or Product table to get the order details"

