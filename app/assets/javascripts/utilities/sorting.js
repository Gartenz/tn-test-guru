document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.sort-by-title')
  if (control) { control.addEventListener('click', sortRowsByTitle) }
})

function sortRowsByTitle() {
  var table = document.querySelector('table')
  var rows = table.querySelectorAll('tr')
  var sortedRows = []

  for (var i = 1; i < rows.length; i++) {
    sortedRows.push(rows[i])
  }
  if (this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
    sortedRows.sort(sortRowsAsc)
    this.querySelector('.octicon-arrow-up').classList.remove('hide')
    this.querySelector('.octicon-arrow-down').classList.add('hide')
  } else {
    sortedRows.sort(sortRowsDesc)
    this.querySelector('.octicon-arrow-up').classList.add('hide')
    this.querySelector('.octicon-arrow-down').classList.remove('hide')
  }

  var sortedTable = document.createElement('table')
  sortedTable.appendChild(rows[0])
  sortedTable.classList.add("table", "table-striped", "table-hover")

  for (var i = 0; i < sortedRows.length; i++) {
    sortedTable.appendChild(sortedRows[i])
  }

  table.parentNode.replaceChild(sortedTable, table)
}

function sortRowsAsc(row1, row2) {
  row1Text = row1.querySelector('td').textContent
  row2Text = row2.querySelector('td').textContent
  if (row1Text < row2Text) { return -1}
  if (row1Text > row2Text) { return 1}
  return 0
}

function sortRowsDesc(row1, row2) {
  row1Text = row1.querySelector('td').textContent
  row2Text = row2.querySelector('td').textContent
  if (row1Text < row2Text) { return 1}
  if (row1Text > row2Text) { return -1}
  return 0
}
