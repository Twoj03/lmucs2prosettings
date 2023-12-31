function myFunction(id) {
    var text = document.getElementById(id).innerText;
    var textarea = document.createElement("textarea");
    textarea.textContent = text;
    textarea.style.position = "fixed";  // Prevent scrolling to bottom of page in MS Edge.
    document.body.appendChild(textarea);
    textarea.select();
    try {
      var successful = document.execCommand("copy");  // Security exception may be thrown by some browsers.
      if(successful) showToast();
      return successful;
    } catch (ex) {
      console.warn("复制到剪贴板失败.", ex);
      return false;
    } finally {
      document.body.removeChild(textarea);
    }
  }
  
  function showToast() {
    var toast = document.getElementById("toast");
    toast.className = "show";
    setTimeout(function(){ toast.className = toast.className.replace("show", ""); }, 2000);
  }