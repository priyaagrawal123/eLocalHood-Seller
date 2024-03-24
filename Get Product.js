const express=require("express");
const mysql=require("mysql2");
const Joi=require("@hapi/joi");
const multer=require("multer");
const path=require("path");
const app=express();
app.use(express.json());

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

app.get('/get/product_details',(req,res)=>{

   con.query("select * from Product",(err,result,fields)=>{

    if(err)
    {
        console.log("MySQL Query Error in the Product table to get the product details",err);
        res.status(500).json({
            Error:"MySQL Query Error in the Product table to get the product details"
        })
    }

    else{
        console.log(result);
        res.status(200).json({
            Message:"Product details fetched successfully"
        })
       }

   })
})

   const port=process.env.PORT || 3000
   app.listen(port,function(){
   console.log(`Listening on the port ${port}`);
   })
