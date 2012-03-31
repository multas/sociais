$(document).ready(function() {
  $('#bt-upload-multa').click (function () {
    $('#form-multa').slideToggle();
  });
  $("a.bt-like").live("click", function() {
    $(this).parent().find(".num-votacao").html("<b>"+(parseInt($(this).parent().find(".num-votacao").first().html())+1)+"</b>");
    //$(this).parent().find(".votacao-multa").effect("bounce", 200);
    $(this).parent().find(".num-votacao").animate({fontSize: "2em"}, 1000);
    $(this).effect("blind");
    
    
  });
});
 
 
