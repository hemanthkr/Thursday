/**
 * 
 */
function validateForm(){
	var x = document.forms["add-form"]["add-name"].value;
	if(x==""){
		document.getElementById("error-name").style.display="block";
		return false;
	}
	else if(x>50){
		document.getElementById("error-name").style.display="none";
		document.getElementById("error-name1").style.display= "block";
		return false;
	}
//	var x = document.forms["add-form"]["add-name"].value;
//	if(x==""){
//		document.getElementById("error-name").style.display= "block";
//		document.getElementById("error-name1").style.display= "none";
//		return false;
//	}
//	
//	if(document.getElementById("field-name").value.length>50){
//		document.getElementById("error-name1").style.display= "block";
//		document.getElementById("error-name").style.display= "none";
//		return false;
//	}
//	
//	var y = document.getElementById("field-type").value;
//	if(y==""){
//		document.getElementById("error-type").style.display= "block";
//		document.getElementById("error-name1").style.display= "none";
//		document.getElementById("error-name").style.display= "none";
//		return false;
//	}
}