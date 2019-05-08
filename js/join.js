window.onload = init;

function init() {
    main();
}

function main() {
    if (document.getElementById('pwdcheckbtn'))
        document.getElementById('pwdcheckbtn').addEventListener('click', findPwd);

    if (document.getElementById('joinbtn'))
        document.getElementById('joinbtn').addEventListener('click', sign);
}

function findPwd() { // 비밀번호 같은지 확인 체크
    let pw = document.getElementById("pwdarea").value;
    let pwchk = document.getElementById("pwdcheck").value;

    if(pw !== pwchk){
        alert("비밀번호가 다릅니다! 다시 입력해주세요.");
    }else{
        alert("확인되었습니다.");
    }
}

function sign() {
    let id = document.getElementById("idarea").value;
    let pw = document.getElementById("pwdarea").value;

    // id 유효성 검사
    if (!/^[a-zA-Z0-9]{8,15}$/.test(id)) {
        alert('아이디를 숫자와 영문자 조합으로 8~15자리를 사용해야 합니다.');
        return false;
    }

    if (!/^[a-zA-Z0-9]{8,15}$/.test(pw)) {
        alert('비밀번호를 숫자와 영문자 조합으로 10~15자리를 사용해야 합니다.');
        return false;
    }
}