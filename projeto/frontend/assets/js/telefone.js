function mascaraDeTelefone(telefone) {
  const textoAtual = telefone.value;
  const isCelular = textoAtual.length === 9;
  let textoAjustado;
  if (isCelular) {
    const parte1 = textoAtual.slice(0, 5);
    const parte2 = textoAtual.slice(5, 9);
    textoAjustado = `${parte1}-${parte2}`
  } else {
    const parte1 = textoAtual.slice(0, 4);
    const parte2 = textoAtual.slice(4, 8);
    textoAjustado = `${parte1}-${parte2}`
  }
  telefone.value = textoAjustado;
}

function tiraHifen(telefone) {
  const textoAtual = telefone.value;
  const textoAjustado = textoAtual.replace(/\-/g, '');

  telefone.value = textoAjustado;
}