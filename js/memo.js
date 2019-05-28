window.onload = init;

var index = 0;

function init(){
    var add_memo = document.getElementById("addMemo");
    var question = document.getElementById("question");
    
    add_memo.addEventListener("click", AddMemo, false);
    question.addEventListener("mouseover", ShowExplain, false);

}

function AddMemo(){
    index = index % 4;

    var memo = document.getElementsByClassName("memo");
    var str = "<div>제목:&nbsp;</div>";
    str += "<textarea id=\"memo"+index+"_title\" placeholder=\"제목을 입력해 주세요.\"></textarea>";
    str += "<textarea id=\"memo"+index+"_content\" placeholder=\"내용을 입력해 주세요.\"></textarea>";

    memo[index].innerHTML = str;
    index++;

    console.log(index);
}

function ShowExplain(){
    var explain = document.getElementById("explain");
    //explain.style.visibility = visible;
    alert("explain!");
}