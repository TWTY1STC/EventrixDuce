Replica of Eventrix

##Eventrix is a Rails application analytics tool

Register your application in Eventrix and receive actionable event analytics services and reports that help you understand how users are employing your services.

Use this information to improve your offerings and user experience.

Eventrix is designed to associate events with each application allowing you to register multiple applications and receive app specific analytics. Use these reports to compare which applications are yielding the best results.

Add the following JavaScript snippet to your application.js file once you register your application: 

var EventrixDuce = {};
  EventrixDuce.report = function(eventName){
    var event = {event: {name: eventName}};
    var request = new XMLHttpRequest();
    request.open("POST", "https://rails-projects-twty1stc.c9users.io/api/events", true);
    request.setRequestHeader('Content-Type', 'application/json');
    request.send(JSON.stringify(event));
};