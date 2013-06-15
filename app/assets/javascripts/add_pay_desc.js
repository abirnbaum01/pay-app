$(document).ready(function() {

	$('#add_pay_desc_field').attr('name','');

	//load appropriate view, if user is updating entries that have already been entered
	if ($('#user_pay_method').val() == "paypal") {
   	   console.log("paypal")
       $('#add_pay_desc_label').show();
       $('#add_pay_desc_field').show();
       $('#user_pay_desc').attr('name','');
       $('#add_pay_desc_field').attr('name','user[pay_desc]');
       $('#add_pay_desc_label').text('Enter your paypal email address');
       $('#add_pay_desc_field').attr('cols', 40);
       $('#add_pay_desc_field').attr('rows', 1);
    } else if ($('#user_pay_method').val() == "mail_check") {
       $('#add_pay_desc_label').show();
       $('#add_pay_desc_field').show();
       $('#user_pay_desc').attr('name','');
       $('#add_pay_desc_field').attr('name','user[pay_desc]');
       $('#add_pay_desc_label').text('Enter mailing address');
       $('#add_pay_desc_field').attr('cols', 40);
       $('#add_pay_desc_field').attr('rows', 3);

    } else {
       $('#add_pay_desc_label').hide();
       $('#add_pay_desc_field').hide();
       $('#user_pay_desc').attr('name','user[pay_desc]');
       $('#add_pay_desc_field').attr('name','');
    }

	// change view when dropdown box changes
	$('#user_pay_method').change(function() {
	   if ($('#user_pay_method').val() == "paypal") {
	   	   console.log("paypal")
	       $('#add_pay_desc_label').show();
	       $('#add_pay_desc_field').show();
	       $('#user_pay_desc').attr('name','');
	       $('#add_pay_desc_field').attr('name','user[pay_desc]');
	       $('#add_pay_desc_label').text('Enter your paypal email address');
	       $('#add_pay_desc_field').attr('cols', 40);
	       $('#add_pay_desc_field').attr('rows', 1);
	   } else if ($('#user_pay_method').val() == "mail_check") {
	       $('#add_pay_desc_label').show();
	       $('#add_pay_desc_field').show();
	       $('#user_pay_desc').attr('name','');
	       $('#add_pay_desc_field').attr('name','user[pay_desc]');
	       $('#add_pay_desc_label').text('Enter mailing address');
	       $('#add_pay_desc_field').attr('cols', 40);
	       $('#add_pay_desc_field').attr('rows', 3);

	   } else {
	       $('#add_pay_desc_label').hide();
	       $('#add_pay_desc_field').hide();
	       $('#user_pay_desc').attr('name','user[pay_desc]');
	       $('#add_pay_desc_field').attr('name','');
	   }
	});
});
