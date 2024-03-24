const express=require("express");
const mysql=require("mysql2");
const Joi=require("joi");
const router=express.Router();
const cors=require("cors");
const app=express();
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
        password:'dhanraj0304',
        database:'e_Localhood3'
    }
);
con.connect((err)=>{
    if(err)
    {
        console.log("Not Connected to the Database",err);
    }
    else
    {
        console.log("Connected Database");
    }
});

//Middleware for input validation using joi

const validationSignup=(req,res,next)=>{
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
     
    ConfirmPass: Joi.string().valid(Joi.ref('Pass')).required().label('Confirm Password').messages(
                {
                    'any.only': 'Password and {#label} not match',
                    'any.required':'{#label} is required'
                }),
    
    Phoneno:Joi.number().integer().min(6000000000).max(9999999999).required().label('Phone Number').messages(
    {
    'number.base':'{#label} must ba a number',
    'number.integer.base':'{#label} must be a integer',
    'number.min':'{#label} first digit start with 6 to 9 and must contains 10 digits',
    'number.max':'{#label} must be 10 digits',
    'any.required': '{#label} is required'
    })
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

app.post('/api/Sign_Up',validationSignup,async(req,res)=>
{
    const {Email,Phoneno,Pass,OTP,Role,ConfirmPass}=req.body;
    con.query('insert into User(EmailID,PhoneNo,Password,OTP,RoleID) values(?,?,?,1111,2)'
    ,[Email,Phoneno,Pass,OTP,Role],(err,result)=>{

        if(err)
    {
      console.log("MySQL Query Error",err);
      return res.status(500).json({
        Error:"Internal Server Error"
      })
    }

    else
    {
       console.log(result);
       return res.status(200).json({
        Message:"SignUp Successful"
    });
    }

})
})

const port = process.env.PORT || 3000;
app.listen(port, function () {
    console.log(`Listening on the port ${port}`);
});



  
