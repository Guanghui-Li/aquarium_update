window.onload=function(){
  if(document.getElementById("livestock_image")!=null){
    document.getElementById("livestock_image").addEventListener("input", function(){
    var fullPath = this.value;
    var filename = fullPath.replace(/^.*[\\\/]/, '');
    document.getElementById("image-label").innerHTML = filename;
   });
  }
  if(document.getElementById("history_image")!=null){
    document.getElementById("history_image").addEventListener("input", function(){
    var fullPath = this.value;
    var filename = fullPath.replace(/^.*[\\\/]/, '');
    document.getElementById("image-label").innerHTML = filename;
   });
  }
} 