
$(document).ready(function(){
  start();
});

var start=function(){
  appendTime();
  setTimeout("start();",5000);
};

var appendTime = function() {
  $('.item[data-date]').each(function(i){
      var d = Date.parse(this.getAttribute('data-date'));
      var other = new Date();
      other.setTime(d);
      var dis = - other + Date.now();
      var str = msecToString(dis);

      var test = this.getElementsByClassName('time_tag')

      if (test.length == 0){
        var element = document.createElement("span");
        element.className = 'time_tag';
        var text=document.createTextNode(str);
        element.appendChild(text);
        this.appendChild(element);
      }else if(test.length == 1){
        var span = test.item(0).childNodes.item(0);
        span.data=str;
      }
  });
};

var msecToString = function(dis) {
  //var sec = (dis/1000)%60;
  //var min = (dis/(1000*60))%60;
  //var hour = (dis/(1000*60*60))%24;
  var days = (dis/(1000*60*60*24)).toFixed();
  if (days == 1){
    return days + " day ago";
  }else if (days == 0){
    return "less than a day ago";
  }else{
    return days + " days ago";
  }
};
