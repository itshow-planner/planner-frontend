window.onload = init;

var index = 0;
var title;
var title_arr = new Array();

$(function () {
    $('#addQuestion').click(function() {
        var list = document.getElementById('list');
        var newLI = document.createElement('li');
        newLI.innerHTML = "A new item";
        list.appendChild(newLI);

      }
    );

    $("#list li").click(function() {
        title = $(this).text();
        AddMemo();
        //alert($(this).text());
    });

});


function init(){
    var add_memo = document.getElementById("addMemo");
    var question = document.getElementById("question");
    
    add_memo.addEventListener("click", AddMemo, false);
    question.addEventListener("mouseover", ShowExplain, false);

}

function ta_set(in1,title,in2) {
    var memo = document.getElementsByClassName("memo");
    var str = "<div>제목:&nbsp;</div>";
    str += "<textarea id=\"memo"+(in1+1)+"_title\" >"+title+"</textarea>";
    str += "<textarea id=\"memo"+(in1+1)+"_content\" placeholder=\"내용을 입력해 주세요.\"></textarea>";
    memo[in2].innerHTML = str;
}

function AddMemo(){
    index = index % 4;


    MemoArr();
    ta_set(index,title,0);
    title_arr[0] = title;
    index++;
    Memo();

    console.log(index);
}

function MemoArr() {
    for(var i=2;i>=0;i--)
        title_arr[i+1] = title_arr[i];
}
function Memo() {

        for(var i=0;i<4;i++)
              ta_set(i,title_arr[i],i);
    
    
}

function ShowExplain(){
    var explain = document.getElementById("explain");
    //explain.style.visibility = visible;
    alert("explain!");
}
