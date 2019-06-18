$("li").click(function(){
	var listItem = $( "#diaryList" );
    var index = $("li").index(this);
    window.open("showPicDiaryView.jsp?index=" + (index-4), "_self");
});

function AddDiary(){
    window.open("addPicDiaryView.jsp", "_self");
}
