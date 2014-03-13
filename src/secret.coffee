$accountsLists = $('.accounts-list')

setInterval ->
  $accountsLists.each ->
    $accountsList = $(@)
    $balances = $accountsList.find('.balance')
    $totalBalance = $accountsList.closest('.moduleAccount').find('h3 .balance')

    $balances.each ->
      addDelta $(@)

    sum = 0
    $.each $balances, ->
      sum += accounting.unformat($(@).text()) || 0

    $totalBalance.text accounting.formatMoney(sum)

, 50

addDelta = ( $el ) ->
  return if $el.hasClass('skip')

  delta = Math.floor((Math.random()*1000)+250) # 250-1250

  txt = $el.text().replace /–/g, '-'
  amount = accounting.unformat(txt)
  newAmount = amount + delta

  if amount <= 0 && newAmount > 0
    newAmount = 0
    $el.addClass 'skip'

  $el.text accounting.formatMoney(newAmount)
