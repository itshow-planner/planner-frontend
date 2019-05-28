window.onload = init;

var canvas = document.getElementById("canvas");
var ctx = canvas.getContext("2d");

var click_brush = false, click_eraser = false;
var lineBorder = 1;
var startX = 0, startY = 0; // 드래깅동안, 처음 마우스가 눌러진 좌표
var drawing = false;
var color = "#000000", ex_color = "#000000";

function init() {
    canvas = document.getElementById("canvas");
    ctx = canvas.getContext("2d");

    ctx.clearRect(0, 0, 355, 300);

    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1; //January is 0!
    var yyyy = today.getFullYear();

    if(dd<10) {
        dd='0'+dd
    } 

    if(mm<10) {
        mm='0'+mm
    } 

    today = document.getElementById("today");
    today.innerText = yyyy + "년 " + mm + "월 " + dd + "일";
    
    var brush = document.getElementById("brush");
    brush.addEventListener("click", ClickBrush, false);

    var eraser = document.getElementById("eraser");
    eraser.addEventListener("click", ClickEraser, false);

    var plus = document.getElementById("plus");
    var minus = document.getElementById("minus");

    plus.addEventListener("click" , big, false);
    minus.addEventListener("click" , small, false);

    var colorpicker = document.getElementById("colorpicker");
    colorpicker.onchange = function(){
        color = document.getElementById("colorpicker").value;
        ex_color = color;
    };

    var submit = document.getElementById("submit");
    submit.addEventListener("click", saveImage, false);
}

function ClickBrush(){
    if(click_brush == false) {
        brush.style.backgroundColor =  "rgb(78, 77, 77)";
        click_brush = true;
        click_eraser = false;
        eraser.style.backgroundColor = "black";
        color = ex_color;
        canvas.style.cursor = "url(https://image.flaticon.com/icons/svg/15/15654.svg), auto";
        OnEvent();
    }
    else {
        brush.style.backgroundColor = "black"; 
        click_brush = false;
        OffEvent();
    }
}

function ClickEraser(){
if(click_eraser == false) {
            eraser.style.backgroundColor =  "rgb(78, 77, 77)";
            click_eraser = true;
            click_brush = false;
            brush.style.backgroundColor = "black";
            color = "white";
            canvas.style.cursor = "url(img/cursor_eraser.png), auto";
            OnEvent();
        }
        else {
            eraser.style.backgroundColor = "black";
            click_eraser = false;
            OffEvent();
        }
}

function draw(curX, curY) {
    this.ctx.lineWidth = lineBorder;
    this.ctx.strokeStyle = color;
    this.ctx.lineCap = "round";

    ctx.beginPath();
    ctx.moveTo(startX, startY);
    ctx.lineTo(curX, curY);
    ctx.stroke();
}
function down(e) {
    startX = e.offsetX; startY = e.offsetY;
    drawing = true;
}
function up(e) { 
    ctx.closePath();
    drawing = false; 
}
function move(e) {
    if(!drawing) return; // 마우스가 눌러지지 않았으면 리턴
    var curX = e.offsetX, curY = e.offsetY;
    draw(curX, curY);
    startX = curX; startY = curY;
}

function big() { 
    lineBorder++; 
}

function small() {
    lineBorder--;
    if (lineBorder < 1) lineBorder = 1;
}

function OnEvent(){
    canvas.addEventListener("mousemove", move, false);
    canvas.addEventListener("mousedown", down, false);
    canvas.addEventListener("mouseup", up, false);
}

function OffEvent(){
    canvas.removeEventListener("mousemove", move, false);
    canvas.removeEventListener("mousedown", down, false);
    canvas.removeEventListener("mouseup", up, false);
}


function saveImage() {
    var bArr = document.getElementById("bArr");
    var data = canvas.toDataURL();
    data = data.split(",");
    const b64Data = data[1];
    const byteCharacters = atob(b64Data);
    
    const byteNumbers = new Array(byteCharacters.length);
    for (let i = 0; i < byteCharacters.length; i++) {
        byteNumbers[i] = byteCharacters.charCodeAt(i);
    }
    const byteArray = new Uint8Array(byteNumbers);

    console.log(byteArray.toString());
    bArr.value = byteArray;
    // return byteArray;
  }