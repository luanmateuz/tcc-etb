function ValidaCPF() {
  var cpf = document.getElementById("cpf").value;
  var cpfValido = /^(([0-9]{3}.[0-9]{3}.[0-9]{3}-[0-9]{2})|([0-9]{11}))$/;
  if (cpfValido.test(cpf) == true) {
    console.log("CPF Válido");
  } else {
    console.log("CPF Inválido");
  }
}

function fMasc(objeto, mascara) {
  obj = objeto
  masc = mascara
  setTimeout("fMascEx()", 1)
}

function fMascEx() {
  obj.value = masc(obj.value)
}

function mCPF(cpf) {
  cpf = cpf.replace(/\D/g, "")
  cpf = cpf.replace(/(\d{3})(\d)/, "$1.$2")
  cpf = cpf.replace(/(\d{3})(\d)/, "$1.$2")
  cpf = cpf.replace(/(\d{3})(\d{1,2})$/, "$1-$2")

  return cpf
}

function Rg(v) {
  v = v.replace(/\D/g, ""); //Substituí o que não é dígito por "", /g é [Global][1]
  v = v.replace(/(\d{1,2})(\d{3})(\d{3})(\d{1})$/, "$1.$2.$3-$4");
  // \d{1,2} = Separa 1 grupo de 1 ou 2 carac. (\d{3}) = Separa 1 grupo de 3 carac. (\d{1}) = Separa o grupo de 1 carac.
  // "$1.$2.$3-$4" = recupera os grupos e adiciona "." após cada.

  return v
}