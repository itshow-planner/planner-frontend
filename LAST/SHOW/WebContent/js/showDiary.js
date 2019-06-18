function showUpdate(){
	var index = document.getElementById("index").value;
	window.open("updateDiaryView.jsp?index=" + index, "_self");
}

function deleteFunc(){
	var index = document.getElementById("index").value;
	window.open("deleteProc.jsp?index=" + index, "_self");
}