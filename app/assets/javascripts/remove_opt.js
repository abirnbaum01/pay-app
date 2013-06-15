//remove empty options in drop down list
//http://stackoverflow.com/questions/6253347/jquery-1-3-2-remove-empty-values

$(document).ready(function(){
	$('select option:empty').remove(); 
});

