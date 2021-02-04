const WebSocket = require("ws");
const nodemailer = require("nodemailer");

const wss = new WebSocket.Server({ port: 4253 }); //create websocket server; port: 4253
console.log("started websocket server bind to port 4253");

wss.on("connection", (ws) => {
  ws.on("message", (message) => {
    var objectmessage = JSON.parse(message);
    console.log(objectmessage);
    console.log("send mail");

    var transporter = nodemailer.createTransport({
        host: '',
        port: ,
        auth: {
            type: 'custom',
            user: '',
            pass: ''
        },
    });

    var mailOptions = {
        from: objectmessage.email,
        to: '',
        subject: "Anfrage LUG Website",
        text: objectmessage.text
    };

    transporter.sendMail(mailOptions, function (error, info) {
      if (error) {
        console.log(error);
      } else {
        console.log("Email sent: " + info.response);
      }
    });
  });
});
