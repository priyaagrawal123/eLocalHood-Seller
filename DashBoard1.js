const express=require("express");
const mysql=require("mysql2");
const router = express.Router();

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


router.get('/Seller-Dashboard/:SellerID',(req,res)=>{

    const SellerID=req.params.SellerID;

    // Fetch total orders from the database of the particular seller
      const query1=`select count(*) as totalOrders from Order_1 where SellerID=?`;

    // Fetch total accepted orders from the database of the particular seller
      const query2=`select count(*) as acceptOrders from Order_1 where SellerID=? and Status='accepted'`;

    // Fetch total rejected orders from the database of the particular seller
      const query3=`select count(*) as rejectOrders from Order_1 where SellerID=? and Status='rejected'`;

    // Fetch total products sold
    const query4=`select sum(TypeOfProduct) as totalProductsSold from Order_1 where SellerID=? and Status='accepted'`;

    // Total Revenue
    const query5=`select sum(p.Price * od.Quantity) as totalRevenue from Product p join OrderDescription od on
     p.ID=od.ProductID join Order_1 o on od.Order_1ID=o.ID where o.SellerID=? and o.Status='accepted'`;

    con.query(query1,[SellerID],(err,results1)=>{
        if(err) throw err;

    con.query(query2,[SellerID],(err,results2)=>{
        if(err) throw err;

    con.query(query3,[SellerID],(err,results3)=>{
        if(err) throw err;

    con.query(query4,[SellerID],(err,results4)=>{
        if(err) throw err;

    con.query(query5,[SellerID],(err,results5)=>{
        if(err) throw err;

     const dashboardData={
        totalOrders:results1[0].totalOrders,
        acceptOrders:results2[0].acceptOrders,
        rejectOrders:results3[0].rejectOrders,
        totalProductsSold:results4[0].totalProductsSold,
        totalRevenue:results5[0].totalRevenue
     }

        res.json(dashboardData);
    })
    })
    })
    })
    })
})

module.exports = router;
