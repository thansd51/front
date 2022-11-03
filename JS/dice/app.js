'use strict'

const img1 = document.querySelector('.img1')
const img2 = document.querySelector('.img2')

// img1.setAttribute('src', 'images/dice6.png')
// img2.setAttribute('src', 'images/dice6.png')

let randomNumber1 = Math.floor(Math.random() * 6) + 1
let randomNumber2 = Math.floor(Math.random() * 6) + 1

img1.setAttribute('src', 'images/dice' + randomNumber1 + '.png')
img2.setAttribute('src', 'images/dice' + randomNumber2 + '.png')

const h1 = document.querySelector('h1')

if (randomNumber1 > randomNumber2) {
    h1.textContent = "🚩\u00A0Player 1 Win!"
}
else if (randomNumber1 < randomNumber2) {
    h1.textContent = "Player 2 Win!\u00A0🚩"
}
else {
    h1.textContent = "Draw!"
}