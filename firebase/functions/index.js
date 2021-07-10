const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();
// const database = admin.firestore();

exports.changeWaterLevel = functions.https.onRequest((request, response) => {
  response.send("Hello from Firebase!");
});

exports.api = functions.https.onRequest((req, res)=>{
  switch (req.method) {
    case "GET":
      res.send("GET");
      break;
    case "POST": {
      const body = req.body;
      res.send(body);
      break;}
    case "DELETE":
      res.send("DELETE");
      break;
    default:
      res.send("default");
  }
});
