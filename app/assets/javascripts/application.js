// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery
//= require datatables


$(function() {
  $("#dataTable").dataTable();
});




// filter subjects by course
$(function(){
  $(".filter #course_id").on('change',function(){
    const defaultSelect = "<option>" + "select subject" + "</option>";
    Rails.ajax({
      type: "GET",
      dataType: "json", 
      url: "/admins_backoffice/subjects/by_course/" + this.value,
      data: "",
      success: function(data){
        var htmlOptions = defaultSelect

        for(var i = 0; i < data.length; i++){
          htmlOptions += "<option value='"+ data[i].id +"'>" + data[i].name +"</option>"
        }
        if (data.length <= 0){
          htmlOptions = "<option value='null'>Empty</option>"
          $(".filter #subject_id").html(htmlOptions)
        }else {
          $(".filter #subject_id").html(htmlOptions)
        } 
      },
      error: function(data){
        htmlOptions = "<option value='null'>Erro</option>"
        $(".filter #subject_id").html(htmlOptions)
      }
    })
  })
})

// filter topics by subjects
$(function(){
  $(".filter #subject_id").on('change',function(){
    
    Rails.ajax({
      type: "GET",
      dataType: "json", 
      url: "/admins_backoffice/topics/by_subject/" + this.value,
      data: "",
      success: function(data){
        var htmlOptions = ""
        for(var i = 0; i < data.length; i++){
          htmlOptions += "<option value='"+ data[i].id +"'>" + data[i].name +"</option>"
        }
        if (data.length <= 0){
          htmlOptions = "<option value='null'>Empty</option>"
          $(".filter #topic_id").html(htmlOptions)
        }else {
          $(".filter #topic_id").html(htmlOptions)
        }
        
        
      },
      error: function(data){
        htmlOptions = "<option value='null'>Erro</option>"
        $(".filter #topic_id").html(htmlOptions)
      }
    })
  })
})