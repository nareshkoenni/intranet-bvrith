var app = require('express')()
var config = require('./bvrithConfig.json');
var ms = require('mysql');

var result = {};
var data = [];
/*var Twitter = require('node-tweet-stream')
  , t = new Twitter({
    consumer_key: 'dQAprEroz6WXLlSfTgo4gI95i',
    consumer_secret: 'MWgscsKdcxnpRQmclJAr4iAi1I7xuAXGF4obD4Nmd7vZ5ArxDp',
    token: '3403773612-ELIiVWbExzFjufMTK6NX7YO5vv4g4B0w03AE9FX',
    token_secret: '2PiNBR03yQpu7ykuOhHBa3BbvSuwJum91FwwzrgqZG3Jo'
  })*/

var conn = ms.createConnection({
  host: "localhost",
  user: "root",
  password: "root",
  database: "twitter"
});

conn.connect(function(err){
    if(err){
      console.log('Unable to connect to the database! - ' + err);
      res.send('Unable to connect to the database!')
      return;
    }
});

var Twitter = require('node-tweet-stream')
  , t = new Twitter({
    consumer_key: config.consumer_key,
    consumer_secret: config.consumer_secret,
    token: config.token,
    token_secret: config.token_secret
  })

t.on('tweet', function (tweet) {
  //console.log('tweet received', tweet)
  console.log('tweet received', tweet.user)
  console.log('tweet received', tweet.text)
  console.log("\n");  
  var x = {
    "name" : tweet.user.name,
    "screen_name" : tweet.user.screen_name,
    "text" : tweet.text,
    "description" : tweet.user.description,
    "location" : tweet.user.location
  }
  data.push(x);

  var sql = "insert into tweets values('"+ tweet.user.name +"','"+ tweet.user.screen_name +"','" + tweet.text +"','" + tweet.user.description +"','" + tweet.user.location +"')";
  console.log('SQL : ' , sql);

      conn.query(sql, (err, result)=>{
        if(err) {
          console.log('Unable to insert data into Table - ' + err);          
        } else {
          console.log('Tweet Saved!');
        }
      //endIt();        
  })
})

t.on('error', function (err) {
  console.log('Oh no')
})

t.track('bvrith')

app.get('/getTweets', (req, res)=>{
      result.tweets = data;
      console.log('Result : ', result);

      res.send(result);
  })

//Retrieve tweets from Database
app.get('/retrieveTweets', (req, res)=>{
  var sql = "select * from tweets";
  conn.query(sql, (err, rows)=>{
  if(err) {
    res.send('Unable to query data from Table - ' + err);
    return;
  } else {
    var finalResponse = {};
    var response = new Array();
    
    for(var i = 0; i<rows.length; i++) {
      var data ={
        'name' : rows[i].tname,
        'screen_name' : rows[i].screen_name,
        'text' : rows[i].tweet,
        'description' : rows[i].description,
        'location' : rows[i].location
      } 
      response.push(data);    
    }
    finalResponse.tweets = response;    
    res.send(finalResponse);
    }
  })
})

app.listen(3000, ()=>{
  console.log('Server is running on port 3000');
})