const express = require("express");
const mysql = require("mysql2");
const Joi = require("@hapi/joi");
const multer = require("multer");
const path = require("path");
const app = express();
app.use(express.json());
//app.use(errHandler);
//import multer from 'multer';

const con = mysql.createConnection
({
    host: "localhost",
    user: "root",
    password: "dhanraj0304",
    database: "e_Localhood3"
});

con.connect((err, result) => {
    if (err) 
    {
        console.log("Error connecting to the database", err);
    } 
    else 
    {
        console.log("Connected to the database Successfully");
    }
});

// Joi Schema for input validation

    const productValidation = (req, res, next) => {
    const schema = Joi.object().keys({
        Name: Joi.string().required().messages({
            'string.base': 'Name of the product must be a string.',
            'string.empty': 'Name of the product cannot be empty.',
            'any.required': 'Name of the product is required.',
        }),

        Price: Joi.number().integer().required().messages({
            'number.base': 'Price of the product must be number.',
            'number.integer': 'Price of the product must be integer.',
            'any.required': 'Price of the product required.',
        }),

        Category: Joi.string().allow('').messages({
            'string.base': 'Category of the product must be a string.',
            'string.empty': 'Category of the product cannot be empty.',
           
        }),

        Color: Joi.string().allow('').messages({
            'string.base': 'Color of the product must be a string.',
            'string.empty': 'Color of the product cannot be empty.',
        }),

        Size: Joi.string().allow('').messages({
            'string.base': 'Size of the product must be a string.',
            'string.empty': 'Size of the product cannot be empty.',
        }),

        Weight: Joi.string().allow('').messages({
            'string.base': 'Weight of the product must be a string.',
            'string.empty': 'Weight of the product cannot be empty.',
        }),

        Description: Joi.string().allow().messages({
            'string.base': 'Description of the product must be a string.',
            'string.empty': 'Description of the product cannot be empty.',
        }),
    });

    const { error } = schema.validate(req.body);

    if (error) 
    {
        console.log("Input Incorrect", error);
        return res.status(400).json
        ({
            Error: error.details[0].message,
        });
    }

    next();
};

//storage engine
const storage = multer.diskStorage({
    destination: './upload/images',
    filename: (req, file, cb) => {
        return cb(null, `${file.fieldname}_${Date.now()}${path.extname(file.originalname)}`);
    }
});

const upload = multer({
    storage: storage,
    limits: { fileSize: 100000000000000000000000000000000000}
});

app.post('/api/Product_Details', upload.single('Product'), productValidation, async (req, res) => {
    const { BIID, Name, Price, Category, Color, Size, Weight, Description } = req.body;
    const photoURL = `${req.file.filename}`;
    console.log(req.file);

    // Inserts Product Details into product table
    const ProductQuery = 'insert into Product(Name,Price,Category,Size,Color,Weight,Description,PhotoURL,BusinessInformationID)values(?,?,?,?,?,?,?,?,1)';
    con.query(ProductQuery, [Name,Price, Category, Size, Color, Weight, Description, photoURL, BIID], (productErr, productResult) => {

        if (productErr) 
        {
            console.log("MySQL error in the Product table", productErr);
            return res.status(500).json
            ({
                Error: "Internal Server Error",
            });
        }
         else 
         {
            console.log(productResult);
            res.status(200).json
            ({
                Message: "Product Details Added Successfully",
                photo_url: photoURL,
            });
        }

    });
});

 function errHandler(err, req, res, next) 
{
    if (err instanceof multer.MulterError) 
    {
        res.json({
            Fail: 0,
            Message: err.message,
        });
    }
}

app.use(errHandler);
app.use('/Product', express.static(path.join(__dirname, 'upload/images')));

const port = process.env.PORT || 3000;
app.listen(port, function () {
    console.log(`Listening on the port ${port}`);
});
