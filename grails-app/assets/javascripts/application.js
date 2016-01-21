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
//= require AdminLTE/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js

$( document ).ready(function() {
    /* Use WYSIHTML5 */
    $('.wysihtml5').wysihtml5();

    /* Use Select2 for tagging */
    $('.select2').select2({
        tags: true,
        tokenSeparators: [',', ' '],
    });
});