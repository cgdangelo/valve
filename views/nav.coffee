menus = ["games"]

showMenu = (menu) ->
  element = document.getElementById(menu)
  popoutElement = element.getElementsByClassName('popout')[0]
  popoutElement.style.display = 'block'
  popoutElement.style.opacity = '0.8'
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
