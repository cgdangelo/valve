getElementsByClassName = (elm, className) ->
  if elm.getElementsByClassName then elm.getElementsByClassName(className)
  else return elm.querySelectorAll(className)

addEventListener = (elm, event, callback) ->
  if elm.addEventListener then elm.addEventListener(event, callback)
  else elm.attachEvent(event, callback)

menus = ["games"]

showMenu = (menu) ->
  element = document.getElementById(menu)
  popoutElement = element.getElementsByClassName('popout')[0]
  popoutElement.style.display = 'block'
  element.getElementsByTagName('a')[0].style.background = '#a1251e'

hideMenu = (menu) ->
  element = document.getElementById(menu)
  popoutElement = element.getElementsByClassName('popout')[0]
  popoutElement.style.display = 'none'
  element.getElementsByTagName('a')[0].style.background = 'transparent'

bindHover = (menu) ->
  element = document.getElementById(menu)
  element.addEventListener 'mouseover', ->
    showMenu(menu)

  for childElement in element.getElementsByClassName('popout')[0].children
    do (childElement) ->
      childElement.addEventListener 'mouseover', ->
        showMenu(menu)

  element.addEventListener 'mouseout', ->
    hideMenu(menu)

bindHover node for node in menus
