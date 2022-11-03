// alert('test');
// const btn1 = document.querySelector('button')
// btn1.addEventListener('click', btnClicked)

function btnClicked() {
    // alert('클릭됨')
    console.log(this)
    drumSound(event.key)
    this.style.color = 'white'
}



const btns = document.querySelectorAll('.drum')

for (let i = 0; i < btns.length; i++) {
    btns[i].addEventListener('click', btnClicked)
}
document.addEventListener('keydown', function (event) {
    console.log(event.key)



})
function newFunction(e) {
    drumSound(e);
}

function drumSound(e) {
    switch (drumSound.key) {
        case 'w':
            var audio = new Audio('sounds/tom-1.mp3');
            audio.play();
            break;
        case 'a':
            var audio = new Audio('sounds/tom-2.mp3');
            audio.play();
            break;
        case 's':
            var audio = new Audio('sounds/tom-3.mp3');
            audio.play();
            break;
        case 'd':
            var audio = new Audio('sounds/tom-4.mp3');
            audio.play();
            break;
        case 'j':
            var audio = new Audio('sounds/snare.mp3');
            audio.play();
            break;
        case 'k':
            var audio = new Audio('sounds/crash.mp3');
            audio.play();
            break;
        case 'l':
            var audio = new Audio('sounds/kick.mp3');
            audio.play();
            break;
    }
}

