// alert(1)
const h3 = document.querySelector('h3')
const color1 = document.querySelector('.color1')
const color2 = document.querySelector('.color2')
const body = document.querySelector('body')

color1.addEventListener('input', setGradient)
color2.addEventListener('input', setGradient)

function setGradient() {
    color1.addEventListener('input', function () {
        body.style.background = `linear-gradient(to right, ${color1.value}, ${color2.value})`
        h3.textContent = body.style.background + ";"
    })
    color2.addEventListener('input', function () {
        body.style.background = `linear-gradient(to right, ${color1.value}, ${color2.value})`
        h3.textContent = body.style.background + ";"
    })
}