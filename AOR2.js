const values = require("@hapi/joi/lib/values");
const express=require("express");
const mysql=require("mysql2");
const router = express.Router();


const con=mysql.createConnection(
    {
        host:"localhost",
        user:"root",
        password:"dhanraj0304",
        database:"e_Localhood3"
    });

con.connect((err,result)=>{
    if(err)
    {
        console.log("Error to connect the database",err);
    }

    else{
        console.log("Connect to the database Successfully");
    }
});

    router.get('/get/product_details/:id',(req,res)=>{

    const productid=req.params.id;

   sql=`select od.ID as OrderDescriptionID,od.ProductID,od.Price as OrderDescriptionPrice,od.Time as 
   OrderDescriptionTime,od.Quantity,p.Name as ProductName,p.Price as ProductPrice,p.Size,p.Color,
   p.Weight from OrderDescription od inner join Product p on od.ProductID=p.ID where od.Order_1ID=${productid}`;

    console.log(sql);
   con.query(sql,(err,result)=>{

    if(err)
    {
        console.log("MySQL Query Error in the OrderDescription table or Product table to get the order details",err);
        res.status(500).json({
            Error:"MySQL Query Error in the OrderDescription table or Product table to get the order details"
        })
    }

    else{
        if(result.length===0)
        {
            console.log(result);
            console.log("ID not present in the orderdescription  table");
            return res.status(400).json({
                Error:"ID not Present in the orderdescription table"
            })
        }
        
     else
       {
        console.log(result);
        res.status(200).json({
            Message:"Product details fetched successfully",
            Message:result
        })
       }

    }

   })
})
 module.exports = router;
