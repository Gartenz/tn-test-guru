document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.timer')
  if (control) {
    var testTime = control.dataset.testTime * 60 * 1000
    alert(control.dataset.startTest)
    var dueTime = Date.parse(control.dataset.startTest) + testTime

    sec = setInterval(function() {
      var now = new Date().getTime()
      var diff = dueTime - now

      var minutes = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60))
      var secs = Math.floor((diff % (1000 * 60)) / 1000)
      control.innerHTML = minutes + 'm ' + secs + 's'

      if (diff <= 0) {
        window.location += '/result'
      }
    }, 1000)
  }
})
