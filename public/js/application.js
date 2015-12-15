// some simple and cool JS you can use for forms

$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them
  appendCoolForm();
  submitCoolForm();


});
//when write blog link is clicked
//hide write blog button and
//append blog form in its place
//You would click a "enter a new post button"
//the button will be replaced with a form partial
//the form partial when filled out will append a new partial containing the new element you created
//the "enter a new post button will return"
//the form partial will disappear

function appendCoolForm(){
  $(document).on('click', 'a.button', function(e){
    e.preventDefault();
    var route = $(this).attr('href')
    var request = $.ajax({
      url: route,
      method: 'get'
    })
    request.done(function(response){
      $('#form').prepend(response);
      $('a.button').hide();
    })
  })
}

var submitCoolForm = function(){
  $(document).on('submit', 'form#new-blog-form', function(e){
    e.preventDefault();
    var route = "/templates";
    var submitData = $(this).serialize();
    var request = $.ajax({
      url: route,
      method: 'post',
      data: submitData
    })
    request.done(function(response){
      $('div#new-form-page').hide();
      $('ul.entries-list').prepend(response);
      $('a.button').show();
    })
  })
}