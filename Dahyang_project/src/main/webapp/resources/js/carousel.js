var $owl = $('.loop');
  
$owl.owlCarousel({
    autoplay: false,
    autoplayHoverPause: true,
    autoplayTimeout: 3000,
    autoplaySpeed: 800,
    center: true,
    items: 3, /*한번에 보여지는 아이템 갯수. html내의 script X, 여기서 조정*/
    stagePadding: 15,
    loop: true,
    margin: 15,
  animateOut: 'slide-up',
animateIn: 'slide-down',
});