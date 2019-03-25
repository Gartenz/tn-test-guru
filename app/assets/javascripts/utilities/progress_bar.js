document.addEventListener('turbolinks:load', function() {
  var progressBar = document.querySelector('.progress-bar')

  if(progressBar) {
    updateProgressBar(progressBar)
  }
})

function updateProgressBar(pb) {
  var percentage = Math.round(pb.getAttribute('aria_valuenow') * 100 / pb.getAttribute('aria_valuemax'))

  pb.setAttribute('style', 'width: ' + percentage + '%;')
}
