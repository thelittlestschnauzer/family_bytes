$(function(){
  $("a.btn-review").on("click", function(e){
      // alert("you clicked this link!")
    // you just clicked on the description link
    // I want the description to show in the page
    // I want to use the HREF value as the value of the URL
     $.ajax({
      method: "GET",
      url: this.href,
    })
    // .done(function(response){
    //   //get the response 

    //   // $("div#reviews").html(response)

    //   // we want to load the data in the DOM
    // });
    
    // load the response into the HTML of the page
    e.preventDefault();
  })
})

$(document).ready(function(){
  $('#reviews-section').hide();
    $('#review-form').click(function(){
      $('#reviews-section').show();
    })
});
