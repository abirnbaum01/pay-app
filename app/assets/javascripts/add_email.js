$(document).ready(function(){
	$('#add_email_field').attr('name','');
	$('#payment_email').change(function() {
	   if ($('#payment_email').val() == "new") {
	       $('#add_email_label').show();
	       $('#add_email_field').show();
	       $('#payment_email').attr('name','');
	       $('#add_email_field').attr('name','payment[email]');
	   } else {
	       $('#add_email_label').hide();
	       $('#add_email_field').hide();
	       $('#payment_email').attr('name','payment[email]');
	       $('#add_email_field').attr('name','');
	   }
	});
});
//Add new email address...