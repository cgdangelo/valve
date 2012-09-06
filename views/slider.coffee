getElementsByClassName = (elm, className) ->
  if elm.getElementsByClassName then elm.getElementsByClassName(className)
  else return elm.querySelectorAll(className)

addEventListener = (elm, event, callback) ->
  if elm.addEventListener then elm.addEventListener(event, callback)
  else elm.attachEvent(event, callback)

cycleSlide = ->
  slidesContainer = document.getElementById('slides')
  currentSlide = slidesContainer.getElementsByClassName('active')[0]
  nextSlide = currentSlide.nextElementSibling or slidesContainer.children[0]
  currentSlide.className = 'slide'
  nextSlide.className = 'slide active'

  controlContainer = document.getElementById('slider-controls')
  currentControl = controlContainer.getElementsByClassName('active')[0]
  nextControl = currentControl.nextElementSibling or controlContainer.children[0]
  currentControl.className = ''
  nextControl.className = 'active'

switchSlide = (elementId, element) ->
  slidesContainer = document.getElementById('slides')
  currentSlide = slidesContainer.getElementsByClassName('active')[0]
  nextSlide = document.getElementById(elementId)
  currentSlide.className = 'slide'
  nextSlide.className = 'slide active'

  controlContainer = document.getElementById('slider-controls')
  currentControl = controlContainer.getElementsByClassName('active')[0]
  nextControl = element
  currentControl.className = ''
  nextControl.className = 'active'

slider = window.setInterval(cycleSlide, 3000)

bindResetters = ->
  slidesContainer = document.getElementById('slides')
  controlContainer = document.getElementById('slider-controls')

  for element in controlContainer.children
    do (element) ->
      eventListener = element.addEventListener or element.attachEvent
      eventListener.apply element, ['click', ->
        switchSlide(element.attributes['data-target'].nodeValue, element)
        window.clearInterval(slider)
        slider = window.setInterval(cycleSlide, 3000)]

  for element in slidesContainer.children
    do (element) ->
      eventListener = element.addEventListener or element.attachEvent
      eventListener.apply element, ['mouseover', ->
        window.clearInterval(slider)]
      eventListener.apply element, ['mouseout', ->
        slider = window.setInterval(cycleSlide, 3000)]
 
bindResetters()
