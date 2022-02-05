var express = require('express');
var bodyParser = require('body-parser');
var app = express();                     //function expression =use with equal to symble(=)
var mysql = require('mysql');

app.use(bodyParser.json());


var con = mysql.createConnection({
     host: 'apidatabase-1.cskgjmehugyr.ap-south-1.rds.amazonaws.com', 
     user: 'admin',
     password: 'admin12345',
     database: 'AmazonDB'
  });
  
  con.connect((err)=> {
    if (err){
        console.log(err.message);
    }
    else{
        console.log("connected Successfully....");
    }
});

 app.get('/api/employee/search-data/', function(req, res) {
   //const sqlQuery = "select * from employee where id = "+req.params.id;
   let sqlQuery = "SELECT * FROM employee ";
      let query    = con.query(sqlQuery, function(err, result){
        if (err) throw err;
        res.send(JSON.stringify({"status":200, "response" : result}));;
     });

 });

  app.post('/api/employee/create-new/', function(req, res){
        var empData = {
        id : req.body.id,                                //json format
        first_name: req.body.first_name,
        last_name:  req.body.last_name, 
        city:       req.body.city,
        salary:     req.body.salary
    };
    let sqlQuery = "INSERT INTO employee SET ?";
    let query    = con.query(sqlQuery, empData, function(err, result){
        if (err) throw err;
        res.send(JSON.stringify({"status":200, "response" : result}));

    });
  });

  app.put('/api/employee/update-data/:id', (req, res)=>{
    let sqlQuery = "UPDATE FROM employee WHERE id ="+req.params.id;
    let query    = con.query(sqlQuery,  function(err, result){
        if (err) throw err;
        res.send(JSON.stringify({"status":200, "response" : result}));

    });

  });
   
  app.delete('/api/employee/delete-data/:id', (req, res)=>{
    let sqlQuery = "DELETE FROM employee WHERE id ="+req.params.id;
    let query    = con.query(sqlQuery,  function(err, result){
        if (err) throw err;
        res.send(JSON.stringify({"status": 200, "response" : result}));
        
    });

});
 
 app.listen(5000,()=>{
    console.log("Server started..");

 });