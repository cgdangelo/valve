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
  controlContainer = document.getElementById('slider-controls')
  for element in controlContainer.children
    do (element) ->
      element.addEventListener 'click', ->
        switchSlide(element.attributes['data-target'].nodeValue, element)
        window.clearInterval(slider)
        slider = window.setInterval(cycleSlide, 3000)
 
bindResetters()
