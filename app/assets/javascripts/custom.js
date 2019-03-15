window.onload=function(){
  if(document.getElementById("livestock_image")!=null){
    document.getElementById("livestock_image").addEventListener("input", function(){
      console.log("Hello");
    var fullPath = this.value;
    var filename = fullPath.replace(/^.*[\\\/]/, '');
    document.getElementById("image-label").innerHTML = filename;
   });
  }
}