document.addEventListener('turbolinks:load', function() {
  var pswd_confirm = document.querySelector('#user_password_confirmation')
  if (pswd_confirm) { pswd_confirm.oninput = checkValues }
})

function checkValues() {
  var pswd_confirm = document.querySelector('#user_password_confirmation')
  var pswd = document.querySelector('#user_password')

  if (pswd.value == pswd_confirm.value) {
    hideOcticons(document.querySelectorAll('.octicon-x'))
    showOcticons(document.querySelectorAll('.octicon-check'))
  }
  if (pswd.value != pswd_confirm.value) {
    hideOcticons(document.querySelectorAll('.octicon-check'))
    showOcticons(document.querySelectorAll('.octicon-x'))
  }
  if (pswd_confirm.value == "") {
    hideOcticons(document.querySelectorAll('.octicon-check'))
    hideOcticons(document.querySelectorAll('.octicon-x'))
  }
}

function hideOcticons(octicons) {
  for (var i = 0; i < octicons.length; i++) {
    octicons[i].classList.add('hide')
  }
}

function showOcticons(octicons) {
  for (var i = 0; i < octicons.length; i++) {
    octicons[i].classList.remove('hide')
  }
}
