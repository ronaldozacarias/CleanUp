//$(function() {
//
//    $('#cpf').keypress(function(event) {
//        var tecla = (window.event) ? event.keyCode : event.which;
//        if ((tecla > 47 && tecla < 58)) return true;
//        else {
//            if (tecla != 8) return false;
//            else return true;
//        }
//    });
//    
//    $("#tel").mask("(00) 0000-00009");
//
//});



$(document).ready(function(){
	  $('.date').mask('00/00/0000');
	  $('.time').mask('00:00:00');
	  $('.date_time').mask('00/00/0000 00:00:00');
	  $('.cep').mask('00000-000');
	  $('.phone').mask('0000-0000');
	  $('#tel').mask('(00) 0000-0000');
	  $('.phone_us').mask('(000) 000-0000');
	  $('.mixed').mask('AAA 000-S0S');
	  $('#cpf').mask('000.000.000-00', {reverse: true});
	  $('.money').mask('000.000.000.000.000,00', {reverse: true});
	  $('.money2').mask("#.##0,00", {reverse: true, maxlength: false});
	  $('.ip_address').mask('0ZZ.0ZZ.0ZZ.0ZZ', {translation: {'Z': {pattern: /[0-9]/, optional: true}}});
	  $('.ip_address').mask('099.099.099.099');
	  $('.percent').mask('##0,00%', {reverse: true});
	  $('.clear-if-not-match').mask("00/00/0000", {clearIfNotMatch: true});
	  $('.placeholder').mask("00/00/0000", {placeholder: "__/__/____"});
});
