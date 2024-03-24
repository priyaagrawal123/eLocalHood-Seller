const express=require("express");
const mysql=require("mysql2");
const Joi = require('joi');
const app=express();
const cors=require("cors");

app.use(express.json());
app.use(cors());
app.options("*",cors());

var allowCrossDomain =function(req,res,next){
   res.header("Access-Control-Allow-Origin","*");
   res.header("Access-Control-Allow-Methods","GET,PUT,POST,DELETE");
   res.header("Access-Control-Allow-Headers","Content-Type");
   next();

};
app.use(allowCrossDomain);

const con=mysql.createConnection(
    {
        host:'localhost',
        user:'root',
        database:'e_Localhood3',
        password:'dhanraj0304'
 });

 con.connect(function(error){

    if(error)
    {
       console.log("Error to connect the database",error);
    }

    else
    {
        console.log('Database is Connected Successfully');
    }
 });
    
 const validationLogin=(req,res,next)=>{
   const schema=Joi.object().keys({

Email:Joi.string().email().required().label('Email Address').messages(
           {
               'string.email': '{#label} must be a valid email address',
                'any.required':'{{#label}}is required',
               'string.base':'"{{#label}}"must be a string'
           }),

Pass:Joi.string().min(8).max(15).required().label('Password').regex(/^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]+$/).messages(
              { 
               'string.min':'"{{#label}}" minimum 8 chracters',
               'string.max':'"{{#label}}" maximum 15 characters',
               'any.required':'"{{#label}}" is required',
               'string.pattern.base':'"{{#label}}" must start with the letter and includes at least one letter,one number and one special character'
               }),
   
            })
         
         const{error}=schema.validate(req.body);

         if(error)
         {
             console.log("Input not Correct",error);
            return res.status(400).json({
             Error: error.details[0].message,
            })
         }

         next();
      }
      

 app.get('/api/Login',validationLogin,(req,res)=>{

   const {Email,Pass}=req.body;

   con.query('select * from User where EmailID=? and Password=?'
    ,[Email,Pass],(err,results)=>{

        if(err)
        {
            console.log('MySQL query error:',err);
            return res.status(500).json({
            Error:"Internal Server Error"
        });
        }
        
         if(results.length > 0){
             console.log("Login Successfully",results);
             res.status(200).json({
                Message:"Login Successful"});
         }

         else
         {
            console.log("Invalid Password or Email ID");
             res.status(401).json({
                Error:"Invalid Password or Email ID"});
         } 

   });
 });

app.listen(4000,function() 
{
    console.log("Listening on the port 4000");
});