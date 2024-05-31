const express=require("express");
const mysql=require("mysql2");
const router=express.Router();


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

router.get('/get/order_details/:id',(req,res)=>{

    const orderid=req.params.id;
   //con.query('select * from Order_1 where SellerID= 65',[orderid],(err,result)=>{

   con.query('select * from Order_1 where SellerID= ?',[orderid],(err,result)=>{
    if(err)
    {
        console.log("MySQL Query Error in the Order_1 table to get the order details",err);
        res.status(500).json({
            Error:"MySQL Query Error in the Order_1 table to get the order details"
        })
    }

    else{
        if(result.length===0)
        {
            console.log(result);
            console.log("ID not present in the order table");
            return res.status(400).json({
                Error:"ID not Present in the order table"
            })
        }
        
     else
       {
        console.log(result);
        res.status(200).json({
            Message:"Order details fetched successfully",
            Message:result
        })
       }

    }

   })
})

module.exports = router;