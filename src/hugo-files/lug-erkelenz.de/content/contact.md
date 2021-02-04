---
title: "Contact"
---

<div id="contact-container">
  <input id="email" type="text" placeholder="Your email" />
  <textarea id="textfield" placeholder="Your message"></textarea>
  <button id="send-button" onclick="sendMail();">Send mail</button>
<script>
  const socket = new WebSocket("ws://192.168.178.37:4253");
    function sendMail() {
        var userEmail = document.querySelector("#email").value;
        var userText = document.querySelector("#textfield").value;

        var sendMailData = {
        email: email,
        text: userText,
        };

        socket.send(JSON.stringify(sendMailData));
        document.getElementById("send-button").innerHTML = "Sent mail";
    }
</script>

 </div>
