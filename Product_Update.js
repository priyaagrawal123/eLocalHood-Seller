const express=require("express");
const mysql=require("mysql2");
const bodyParser = require("body-parser");
const multer=require("multer");
const path=require("path");
const router = express.Router();
router.use(bodyParser.json()); // Parse application/json
router.use(bodyParser.urlencoded({ extended: true })); // Parse application/x-www-form-urlencoded

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

// storage engine
const storage = multer.diskStorage
({
    destination: './upload/images',
    filename: (req, file, cb) => {
        return cb(null, `${file.fieldname}_${Date.now()}${path.extname(file.originalname)}`);
    }
});

const upload=multer({
    storage:storage,
    limits:{fileSize:1000000}
})

//const baseURL='http://localhost:3000/Product/'

router.put('/Update_Product_Details/:id',upload.single('Product'),(req,res)=>{
    const upid=req.params.id;
    // const{name,price,category,size,color,weight,description}=req.params;
    const{name1,price,category,size,color,weight,description}=req.body;
    //const photoURL=`${req.file.filename}`;
    const photoURL = req.file ? `${req.file.filename}` : null;
    //console.log(req.file);

    console.log(`Name: ${name1}`); // Add this line for debugging
    if (!(name1 || price || category || size || color || weight || description || photoURL)) 
    {
        console.log("At least one of the product details must be updated")
        return res.status(400).json
        ({
            Error:"No Update Fields provided for the product update",
            Message:"At least one of the product details must be update"
        })
    }

    // Check if the ID exists in the database
    con.query(`select * from Product where ID=${upid}`, (err, rows) => 
    {
      if (err) 
      {
          console.log("MySQL Query error in the Product table", err);
          return res.status(500).json({
              Message: "Internal server Error"
          });
      }

      if (rows.length === 0) {
          console.log("ID not present in the database");
          return res.status(401).json({
              Error: "ID not present in the database"
          });
      }


    const updateProductFields=[];
    if(name1)updateProductFields.push(`Name='${name1}'`);
    if(price)updateProductFields.push(`Price='${price}'`);
    if(category)updateProductFields.push(`Category='${category}'`);
    if(size)updateProductFields.push(`Size='${size}'`);
    if(color)updateProductFields.push(`Color='${color}'`);
    if(weight)updateProductFields.push(`Weight='${weight}'`)
    if(description)updateProductFields.push(`Description='${description}'`)
    if(photoURL)updateProductFields.push(`PhotoURL='${photoURL}'`)


    const updateProductQuery=`update Product Set ${updateProductFields.join(',')} where ID=${upid}`;
    con.query(updateProductQuery,(err,result)=>{

        if(err)
        {
          console.log("MySQL Query error in the Product table",err);
          return res.status(500).json({
            Message:"Internal server Error"
          })
        }
        
        if (result.affectedRows === 0) {
          console.log("No rows updated. Either ID not present in the database or product details already updated.");
          return res.status(409).json({
              Error: "No rows updated. Either ID not present in the database or product details already updated."
          });
      }
                
                    
                    //Print all corresponding changes in the database
                    for (const field of updateProductFields) 
                    {
                      console.log(`Updated ${field.split('=')[0]} to ${field.split('=')[1]}`);
                    }

                    console.log("Product Details Updated Successfully");
                return res.status(200).json({
                Message: "Product Details Updated Successfully",
                Product_Photo_URL: photoURL
            });
        });
    });
});
              
                    

    function errHandler(err,req,res,next)
{
    if(err instanceof multer.MulterError)
    {
        res.json({

            
            Fail: 0,
            Message: err.message
        })
    }
}

router.use(errHandler);
router.use('/Product', express.static(path.join(__dirname, 'upload/images')));

module.exports = router;
