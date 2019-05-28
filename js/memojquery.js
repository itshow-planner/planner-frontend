$(function () {
    $('#addQuestion').click(function() {
        var list = document.getElementById('list');
        var newLI = document.createElement('li');
        newLI.innerHTML = 'A new item';
        list.appendChild(newLI);
      }
    );
});