window.onload = init;

function init(){
    var list = document.getElementsByTagName("li");
    var addBtn =  document.getElementById("addDiary");

    list.addEventListener("click", ShowDiary, false);
    addBtn.addEventListener("click", AddDiary, false);
}

function ShowDiary(){
    window.open("showDiary.html", "_self");
}

function AddDiary(){
    window.open("addDiary.html", "_self");
}
