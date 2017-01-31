/* global $, Stripe */

// Document ready
$(document).on('turbolinks:load', function(){
	var theForm = $('#dealer_form');
	var submitBtn = $('#form-signup-btn');
// Set Stripe public key
	Stripe.setPublishableKey( $('meta[name="stripe-key"]').attr('content') );
// When User clicks form submit button, prevent default submission behaviour
	submitBtn.click(function(event){
		event.preventDefault();
		submitBtn.val("Processing").prop('disabled', true);
// Collect credit card fields
		var ccNum = $('#card_number').val(), 
				cvcNum = $('#card_code').val(),
				expMonth = $('#card_month').val(),
				expYear = $('#card_year').val();	
// Use Stripe JS library to check for card errors
		var error = false;
// Validate card number
		if(!Stripe.card.validateCardNumber(ccNum)){
			error = true;
			alert('Invalid credit card number.');
		}
// Validate cvc number
		if(!Stripe.card.validateCVC(cvcNum)){
			error = true;
			alert('Invalid CVC number.');
		}
// Validate expiration date
		if(!Stripe.card.validateExpiry(expMonth, expYear)){
			error = true;
			alert('Invalid expiry date.');
		}
		if (error) {
// If card error(s), don't send to Stripe
		submitBtn.prop('disabled', false).val("Sign Up");
		}	else {
// Send card info to Stripe
				Stripe.createToken({
				number: ccNum,
				cvc: cvcNum,
				exp_month: expMonth,
				exp_year: expYear
			}, stripeResponseHandler);
		}		
		return false;
	});
// Stripe will send back a card token
	function stripeResponseHandler(status, response) {
// Token comes from response		
		var token = response.id;
// Inject card token as hidden field into form
		theForm.append( $('<input type="hidden" name="user[stripe_card_token]">').val(token) );
// Submit form to app
		theForm.get(0).submit();
	}
});