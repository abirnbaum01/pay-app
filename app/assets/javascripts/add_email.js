$(document).ready(function(){
	$('#add_email_field').attr('name',''); //by default, don't use value in add_email_field

	// Check if email selector in payment form changes
	$('#payment_email').change(function() {
	   if ($('#payment_email').val() == "new") {
	       $('#add_email_label').show();
	       $('#add_email_field').show();
	       $('#payment_email').attr('name',''); // don't use value in drop down list ...
	       $('#add_email_field').attr('name','payment[email]'); //instead, use value in new add email field
	   } else {
	       $('#add_email_label').hide();
	       $('#add_email_field').hide();
	       $('#payment_email').attr('name','payment[email]');
	       $('#add_email_field').attr('name','');
	   }
	});
});
//Add new email address...