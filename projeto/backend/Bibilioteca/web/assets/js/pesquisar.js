var filtro = document.getElementById('pesquisar');
var tabela = document.getElementById('tabela');
filtro.onkeyup = function() {
    var nomeFiltro = filtro.value;
    
    for (var i = 1; i < tabela.rows.length; i++) {
        var conteudoCelula = tabela.rows[i].cells[1].innerText;
        var corresponde = conteudoCelula.toLowerCase().indexOf(nomeFiltro.toLowerCase()) >= 0;
        tabela.rows[i].style.display = corresponde ? '' : 'none';
    }
};
