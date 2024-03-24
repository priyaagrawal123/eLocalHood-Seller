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

app.delete('/Product_Details_Delete',(req,res)=>{

    const delid=req.body.id;

    con.query('delete from Product where ID=?',delid,(err,result)=>{
        if(err)
        {
            console.log("MySQL Query Error in the Product Table",err);
            return res.status(500).json({
               Error:"Internal Server Error"
            })
        }

        else{
            if(result.affectedRows==0)
            {
                console.log(result);
                console.log("ID not present in the database....");
                return res.status(400).json({
                    Error:"ID not Present in the database"
                })
            }
            else{
            console.log(result);
            return res.status(200).json({
                Message:"Product Details Deleted Successfully"
            })
        }
    }
    })
})

const port=process.env.PORT || 4000;
app.listen(port,function() 
{
    console.log(`Listening on port ${port}.....`);
});

