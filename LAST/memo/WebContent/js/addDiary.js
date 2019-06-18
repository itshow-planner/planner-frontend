window.onload = init;

function init(){

    var date = new Date();
    var dd = date.getDate();
    var mm = date.getMonth()+1; //January is 0!
    var yyyy = date.getFullYear();

    if(dd<10) {
        dd='0'+dd
    } 

    if(mm<10) {
        mm='0'+mm
    } 

    var today = document.getElementsByClassName("today");
    today[0].innerText = yyyy + "-" + mm + "-" + dd;
    today[1].innerText = yyyy + "- " + mm + "-" + dd;
}


function Check(i){
    var texts = document.getElementsByClassName("limit3");
    texts[i].onkeypress = function(){
        if(texts){
            TextCheck(texts[i].value);
        }
    }
}

function TextCheck(text){
    var lineSplit = text.split("\n");

    // 최대라인수 제어
    if(lineSplit.length > 2 && event.keyCode == 13) {
        // alert("warning");
        event.returnValue = false;
    }
}

function Check_basic(){
    var text = document.getElementById("diaryArea");
    text.onkeypress = function(){
        if(text){
            TextCheck_basic(text.value);
        }
    }
}

function TextCheck_basic(text){
    var lineSplit = text.split("\n");

    // 최대라인수 제어
    if(lineSplit.length > 16 && event.keyCode == 13) {
        // alert("warning");
        event.returnValue = false;
    }
}
