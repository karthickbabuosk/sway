

jQuery(document).ready(function(){
	jQuery("#detor_form #form-configuration").submit(function(){
		var extend_trial_obj = {
			instructions : jQuery("#instructions").val(),
			max_trial : jQuery("#max_trial").val(),
			manager : jQuery("#email_id").val()
		};
		var data = { extend_trial : extend_trial_obj};
		console.log(data)
		event.preventDefault();
	});
});