// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better
// to create separate JavaScript files as needed.
//
//= require jquery-2.1.3.js
//= require_tree .
//= require_self
//= require bootstrap/dist/js/bootstrap.min.js
//= require AdminLTE/dist/js/app.min.js
//= require AdminLTE/plugins/select2/select2.full.min.js
//= require summernote/dist/summernote.min.js

$( document ).ready(function() {
    /* Use Summernote */
    $('#summernote').summernote({
        height: 200,
        disableResizeEditor: true
    });

    /* Use Select2 for tagging */
    $('.select2').select2({
        tags: true,
        tokenSeparators: [',', ' '],
    });

    /* Hide the "add comment" button and display the form */
    $('.add-comment').click(function(event){
        $(event.target).hide(); //.add-comment concerned
        $(event.target).parent().find('.comment-form').show(); //.comment-form concerned
    });
});