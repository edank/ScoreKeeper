# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$("document").ready ->
  
  #Add game
  $(".addGame").click ->
    gameNumber = parseInt($(".game").length) + 1
    newGame = $(".game").first().clone()
    newGame.find(".p1g").attr "id", "p1g" + gameNumber
    newGame.find(".p2g").attr "id", "p2g" + gameNumber
    newGame.find(".gameNum").text gameNumber
    $(".game").last().after newGame
    return

  $(".removeGame").click (e) ->
    if parseInt($(".game").length) > 1
      $(".game").last().remove()
      e.preventDefault()
    return

  $("#formMatch").submit (e) ->
    e.preventDefault()
    return

  $(".pName input[type=text]").keyup ->
    thisObj = $(this)
    pNumber = @id.replace(/^\D+/g, "")
    name = (if @value is "" then "Player " + pNumber else @value)
    $(".p" + pNumber + "name").text name
    return

return
