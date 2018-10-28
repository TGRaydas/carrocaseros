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

//= require jquery

//= require turbolinks
//= require_tree .
var yellowColor = "#ec971f";
var redColor = "#c9302c";
var blueColor = "#337ab7";
var greenColor = "#5bb75b";

function alert(messege, color, delay=2000) {
    $(".alert div").remove();
    $(".alert").append("<div style='font-weight: bold;float: right;margin-right:70%;'>" + messege + "</div>");
    $(".alert").css("background-color", color).fadeIn(200);
    setTimeout(function () {$(".alert").fadeOut(200);}, delay);
}

String.prototype.price = function () {
    var num = parseInt(this);
    return num.toLocaleString(["ban","id"]).toString();
};