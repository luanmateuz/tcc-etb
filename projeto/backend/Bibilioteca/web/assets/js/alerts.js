function showAlertSimple(icon, title, description) {
  Swal.fire({
    icon: icon,
    title: title,
    text: description,
    showCloseButton: true,
    showConfirmButton: false,
  });
}

function showAlert(icon, title, description, confirmButtonText,
  denyButtonText, redirect, redirectAlter) {
  Swal.fire({
    icon: icon,
    title: title,
    text: description,
    confirmButtonText: confirmButtonText,
    confirmButtonColor: '#3CDC8C',
    showDenyButton: true,
    denyButtonText: denyButtonText,
    denyButtonColor: '#DC3C3C'
  }).then((result) => {
    if (result.isConfirmed) {
      location.href = (redlirect);
    } else {
      location.href = (redirectAlter)
    }
  });
}

function showAlertSucessTimer(title) {
  Swal.fire({
    icon: 'success',
    title: title,
    text: 'Click para continuar',
    showConfirmButton: false,
    timer: 1500
  });
}

function showAlertSucess(title, redirect, redirectAlter = redirect) {
  Swal.fire({
    icon: 'success',
    title: title,
    text: 'Click para continuar',
    showConfirmButton: true,
    showButtonText: 'OK',
  }).then((result) => {
    if (result.isConfirmed) {
      location.href = (redirect);
    } else {
      location.href = (redirectAlter);
    }
  });
}

function showAlertError(title, description, redirect, redirectAlter = redirect) {
  Swal.fire({
    icon: 'error',
    title: title,
    text: description,
    showConfirmButton: true,
    showButtonText: 'OK',
  }).then((result) => {
    if (result.isConfirmed) {
      location.href = (redirect);
    } else {
      location.href = (redirectAlter);
    }
  });
}

function swalWithBootstrap(livro) {
  const swalWithBootstrapButtons = Swal.mixin({
    customClass: {
      confirmButton: 'btn btn-outline-success',
      cancelButton: 'btn btn-outline-danger mr-3'
    },
    buttonsStyling: false
  })

  swalWithBootstrapButtons.fire({
    title: 'Tem certeza? ',
    text: "Você não poderá reverter isso!",
    icon: 'warning',
    showCancelButton: true,
    confirmButtonText: 'Sim, exclua!',
    cancelButtonText: 'Não, cancele!',
    reverseButtons: true
  }).then((result) => {
    if (result.isConfirmed) {
      swalWithBootstrapButtons.fire(
        'Excluído!',
        `O livro ${livro} foi excluído.`,
        'success'
      )
    } else if (
      /* Read more about handling dismissals below */
      result.dismiss === Swal.DismissReason.cancel
    ) {
      swalWithBootstrapButtons.fire(
        'Cancelado',
        `O livro ${livro} está seguro :)`,
        'error'
      )
    }
  });
}


function swalWithBootstrap(funcao, link) {
  const swalWithBootstrapButtons = Swal.mixin({
    customClass: {
      confirmButton: 'btn btn-outline-success',
      cancelButton: 'btn btn-outline-danger mr-3'
    },
    buttonsStyling: false
  })

  swalWithBootstrapButtons.fire({
    title: 'Tem certeza? ',
    text: "Você não poderá reverter isso!",
    icon: 'warning',
    showCancelButton: true,
    confirmButtonText: 'Sim, exclua!',
    cancelButtonText: 'Não, cancele!',
    reverseButtons: true
  }).then((result) => {
    if (result.isConfirmed) {
      location.href = (link);
      swalWithBootstrapButtons.fire(
        'Excluído!',
        `O ${funcao} foi excluído.`,
        'success'
      )
    } else if (
      /* Read more about handling dismissals below */
      result.dismiss === Swal.DismissReason.cancel
    ) {
      swalWithBootstrapButtons.fire(
        'Cancelado',
        `O ${funcao} está seguro :)`,
        'error'
      )
    }
  });
}

function toast() {
  const Toast = Swal.mixin({
    toast: true,
    position: 'top-end',
    showConfirmButton: false,
    timer: 3500,
    timerProgressBar: true,
    didOpen: (toast) => {
      toast.addEventListener('mouseenter', Swal.stopTimer)
      toast.addEventListener('mouseleave', Swal.resumeTimer)
    }
  })

  Toast.fire({
    icon: 'success',
    title: 'Cadastrado com sucesso'
  })
}