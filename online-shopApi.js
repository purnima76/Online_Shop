var express = require('express');
var bodyParser = require('body-parser');
var app = express();                     //function expression =use with equal to symble(=)
var mysql = require('mysql');

app.use(bodyParser.json());


var con = mysql.createConnection({
     host: 'online-shopping.cr79gqiqhitl.ap-south-1.rds.amazonaws.com', 
     user: 'aman',
     password: '12345',
     database: 'online_shopping'
  });
  
  con.connect((err)=> {
    if (err){
        console.log(err.message);
    }
    else{
        console.log("connected Successfully....");
    }
});


app.get('/api/owner/search-data/', function(req, res) {
   
    let sqlQuery = "SELECT * FROM owner ";
       let query    = con.query(sqlQuery, function(err, result){
         if (err) throw err;
         res.send(JSON.stringify({"status":200, "response" : result}));;
      });
 
  });

  
app.get('/api/shop/search-data/', function(req, res) {
   
    let sqlQuery = "SELECT * FROM shop ";
       let query    = con.query(sqlQuery, function(err, result){
         if (err) throw err;
         res.send(JSON.stringify({"status":200, "response" : result}));;
      });
 
  });

  
  app.get('/api/product/search-data/', function(req, res) {
   
    let sqlQuery = "SELECT * FROM product ";
       let query    = con.query(sqlQuery, function(err, result){
         if (err) throw err;
         res.send(JSON.stringify({"status":200, "response" : result}));;
      });
 
  });

  
  app.post('/api/product/create-new/', function(req, res){
    var pData = {
        p_id : req.body.p_id,                       //json format
        p_name : req.body.p_name,
        p_type : req.body.p_type,
        c_id : req.body.c_id,
                                         
};
let sqlQuery = "INSERT INTO product SET ?";
let query    = con.query(sqlQuery, pData, function(err, result){
    if (err) throw err;
    res.send(JSON.stringify({"status":200, "response" : result}));

});
});

  app.post('/api/owner/create-new/', function(req, res){
    var ownerData = {
        Owner_id : req.body.Owner_id,                       //json format
        Owner_name : req.body.Owner_name,
        Own_aadhar : req.body.Own_aadhar,
        Own_pan_no : req.body.Own_pan_no,
        Own_mobile_no : req.body.Own_mobile_no,
        Own_mail_id  : req.body.Own_mail_id
                                         
};
let sqlQuery = "INSERT INTO owner SET ?";
let query    = con.query(sqlQuery, ownerData, function(err, result){
    if (err) throw err;
    res.send(JSON.stringify({"status":200, "response" : result}));

});
});
 

app.post('/api/shop/create-new/', function(req, res){
 var shopData = {
       
    S_id : req.body.S_id,                                //json format
    S_name: req.body.S_name,
    owner_id:  req.body.owner_id, 
    city:       req.body.city,
    state:     req.body.state,
    pincode:        req.body.pincode,
    regis_no:       req.body.regis_no,
    gst:            req.body.gst,
    shop_cat_type:  req.body. shop_cat_type,
    shop_address:   req.body.shop_address,
    contract :       req.body.contract,
    company_name:       req.body. company_name,
     
                                         
};
let sqlQuery = "INSERT INTO shop SET ?";
let query    = con.query(sqlQuery, shopData, function(err, result){
    if (err) throw err;
    res.send(JSON.stringify({"status":200, "response" : result}));

});
});
 

  
 app.listen(5000,()=>{
    console.log("Server started..");

 });