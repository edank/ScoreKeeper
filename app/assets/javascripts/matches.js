$(document).ready(function () {
	
// hide/show games
$(document).on('change',"#content_match_new input[name=match_game_count]",function(){
	var games = parseInt($(this).val());
	$("#content_match_new .game").show().slice(games).hide();
});


//FORM

$.validator.addMethod("match_player1_id", function(value, element){
  debugger;
  return arg != value;
 }, "Value must not equal arg.");


$("#new_match").validate({
	rules: {
		
	},
	messages: {
	}
});


});