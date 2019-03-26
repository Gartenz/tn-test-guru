document.addEventListener('turbolinks:load', function() {
  var progressBar = document.querySelector('.progress-bar')

  if(progressBar) {
    updateProgressBar(progressBar)
  }
})

function updateProgressBar(pb) {
  var percentage = Math.round(pb.dataset.currentValue * 100 / pb.dataset.maxValue)

  pb.setAttribute('style', 'width: ' + percentage + '%;')
}
