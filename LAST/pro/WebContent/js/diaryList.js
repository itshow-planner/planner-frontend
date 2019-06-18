$("li").click(function(){
	var listItem = $( "#diaryList" );
    var index = $("li").index(this);
    window.open("showDiaryView.jsp?index=" + (index-4), "_self");
});


function AddDiary(){
	var date = new Date();
	var dd = date.getDate();
	var mm = date.getMonth()+1;
	var yyyy = date.getFullYear();

	if(dd<10) {
	    dd='0'+dd
	} 

	if(mm<10) {
	    mm='0'+mm
	} 

	date = yyyy+'-'+mm+'-'+dd;
	
	window.open("addDiaryView.jsp", "_self");
}