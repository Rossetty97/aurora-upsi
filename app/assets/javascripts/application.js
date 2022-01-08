//= require jquery3
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

// Bootstrap Fancy Alert
$(document).ready(function (){
	setTimeout(function(){
		$('#notice_wrapper').fadeOut("fast",function(){
			$(this).remove();
		})
	},2500);
});