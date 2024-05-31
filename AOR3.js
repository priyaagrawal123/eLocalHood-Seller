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

router.put('/accept_or_reject_order/',(req,res)=>
{
   const action=req.body.action;
   const orderid=req.body.id;

   // Log the received action for debugging
   console.log(`Received action: ${action}`);
   console.log(`Received order ID: ${orderid}`);

   const status=action=== 'accept' ? 'accepted' : 'rejected';
   // Log the status to be set for debugging
   console.log(`Setting status to: ${status}`);

   con.query('update Order_1 set Status=? where ID=?',[status,orderid],(err,result)=>{

    if(err)
    {
        console.log("MySQL Query Error in the Order_1 table to update the status of the order",err);
        res.status(500).json({
            Error:"MySQL Query Error in the Order_1 table to update the status of the order"
        })
    }

    else{
        if(result.affectedRows===0)
        {
            console.log(result);
            console.log("ID not present in the order table");
            return res.status(400).json({
                Error:"ID not Present in the order table"
            })
        }
        
     else
       {
        console.log(`Order ${action}`,result);
        res.status(200).json({
            Message:`Order ${action}`,
            
        })
       }

    }

   })
})

  module.exports = router;