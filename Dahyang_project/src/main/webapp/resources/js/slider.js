let slider = document.querySelector(".slider");
let innerSlider = document.querySelector(".inner-slider");

let pressed = false;
let startX;
let x;

slider.addEventListener("mousedown", (e) => {
    pressed = true;
    startX = e.clientX - innerSlider.offsetLeft;
    slider.style.cursor = "grabbing";
});

slider.addEventListener("mouseenter", () => {
    slider.style.cursor = "grab";
});

slider.addEventListener("mouseup", () => {
    slider.style.cursor = "grab";
    pressed = false;
});

slider.addEventListener("mousemove", (e) => {
    if (!pressed) return;
    e.preventDefault();

    x = e.clientX - startX;

    // 슬라이드 범위 설정
    let minX = 0;
    let maxX = slider.offsetWidth - innerSlider.offsetWidth;

    if (x < minX) {
        x = minX;
    }
    if (x > maxX) {
        x = maxX;
    }

    // innerSlider의 위치를 조정
    innerSlider.style.transition = 'none'; // transition 제거
    innerSlider.style.transform = `translateX(${x}px)`;
});

slider.addEventListener("mouseleave", () => {
    if (pressed) {
        slider.style.cursor = "grab";
        pressed = false;
    }
});

// 슬라이드 영역의 크기와 innerSlider의 위치를 초기화
function initSlider() {
    innerSlider.style.transition = 'transform 0.3s ease-in-out'; // transition 설정
    innerSlider.style.transform = `translateX(0px)`;
}

// 슬라이더의 크기가 변경될 때 초기화
window.addEventListener('resize', initSlider);

initSlider(); // 페이지 로드 시 초기화
