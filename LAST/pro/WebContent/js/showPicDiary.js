function showUpdate(){
	var index = document.getElementById("index").value;
	window.open("updatePicDiaryView.jsp?index=" + index, "_self");
}

function deleteFunc(){
	var index = document.getElementById("index").value;
	window.open("deletePicProc.jsp?index=" + index, "_self");
}