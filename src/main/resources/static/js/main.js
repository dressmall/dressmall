 AOS.init({
 	duration: 800,
 	easing: 'slide',
 	once: true
 });

jQuery(document).ready(function($) {

	"use strict";

	var slider = function() {
		$('.nonloop-block-3').owlCarousel({
	    center: false,
	    items: 1,
	    loop: false,
			stagePadding: 15,
	    margin: 20,
	    nav: true,
			navText: ['<span class="icon-arrow_back">', '<span class="icon-arrow_forward">'],
	    responsive:{
        600:{
        	margin: 20,
          items: 2
        },
        1000:{
        	margin: 20,
          items: 3
        },
        1200:{
        	margin: 20,
          items: 4
        }
	    }
		});
	};
	slider();


	var siteMenuClone = function() {

		$('<div class="site-mobile-menu"></div>').prependTo('.site-wrap');

		$('<div class="site-mobile-menu-header"></div>').prependTo('.site-mobile-menu');
		$('<div class="site-mobile-menu-close "></div>').prependTo('.site-mobile-menu-header');
		$('<div class="site-mobile-menu-logo"></div>').prependTo('.site-mobile-menu-header');

		$('<div class="site-mobile-menu-body"></div>').appendTo('.site-mobile-menu');

		

		$('.js-logo-clone').clone().appendTo('.site-mobile-menu-logo');

		$('<span class="ion-ios-close js-menu-toggle"></div>').prependTo('.site-mobile-menu-close');
		

		$('.js-clone-nav').each(function() {
			var $this = $(this);
			$this.clone().attr('class', 'site-nav-wrap').appendTo('.site-mobile-menu-body');
		});


		setTimeout(function() {
			
			var counter = 0;
      $('.site-mobile-menu .has-children').each(function(){
        var $this = $(this);
        
        $this.prepend('<span class="arrow-collapse collapsed">');

        $this.find('.arrow-collapse').attr({
          'data-toggle' : 'collapse',
          'data-target' : '#collapseItem' + counter,
        });

        $this.find('> ul').attr({
          'class' : 'collapse',
          'id' : 'collapseItem' + counter,
        });

        counter++;

      });

    }, 1000);

		$('body').on('click', '.arrow-collapse', function(e) {
      var $this = $(this);
      if ( $this.closest('li').find('.collapse').hasClass('show') ) {
        $this.removeClass('active');
      } else {
        $this.addClass('active');
      }
      e.preventDefault();  
      
    });

		$(window).resize(function() {
			var $this = $(this),
				w = $this.width();

			if ( w > 768 ) {
				if ( $('body').hasClass('offcanvas-menu') ) {
					$('body').removeClass('offcanvas-menu');
				}
			}
		})

		$('body').on('click', '.js-menu-toggle', function(e) {
			var $this = $(this);
			e.preventDefault();

			if ( $('body').hasClass('offcanvas-menu') ) {
				$('body').removeClass('offcanvas-menu');
				$this.removeClass('active');
			} else {
				$('body').addClass('offcanvas-menu');
				$this.addClass('active');
			}
		}) 

		// click outisde offcanvas
		$(document).mouseup(function(e) {
	    var container = $(".site-mobile-menu");
	    if (!container.is(e.target) && container.has(e.target).length === 0) {
	      if ( $('body').hasClass('offcanvas-menu') ) {
					$('body').removeClass('offcanvas-menu');
				}
	    }
		});
	}; 
	siteMenuClone();


	var sitePlusMinus = function () {
	        // 수량 감소 버튼
	        $('.js-btn-minus').on('click', function () {
	            var $input = $(this).closest('.input-group').find('.form-control');
	            var currentValue = parseInt($input.val());
	            if (currentValue > 1) {
	                $input.val(currentValue - 1);
	            } else {
	                $input.val(1);
	            }
	            //updateCartAmount($input.val());
	        });

	        // 수량 증가 버튼
	        $('.js-btn-plus').on('click', function () {
	            var $input = $(this).closest('.input-group').find('.form-control');
	            var currentValue = parseInt($input.val());
	            $input.val(currentValue + 1);
	            //updateCartAmount($input.val());
	        });

	        // 각 폼 제출 시 숨겨진 필드 업데이트
	        $('#addCartForm').on('submit', function () {
	            var quantity = $(this).find('.form-control').val();
	            $(this).find('input[name="cartAmount"]').val(quantity); // 'cartAmount' 필드에 수량 설정
	            console.log("addCartForm submitted with cartAmount: " + quantity);
	        });

			$('#paymentForm').on('submit', function() {
			    // #addCartForm 폼에서 수량 값 가져오기
			    var quantity = $('#addCartForm').find('.form-control').val();   // 수량을 가져옴
				console.log("addCartForm submitted with cartAmount: " + quantity);
			    // 해당 수량을 paymentForm의 hidden 필드에 설정
			    $(this).find('input[name="cartAmount"]').val(quantity);  // cartAmountOne 값 설정
			});
	    };
		
		// cartAmount 필드를 업데이트하는 함수
		/*function updateCartAmount(quantity) {
			console.log("Updating cartAmount to: " + quantity); // 값이 제대로 출력되는지 확인
		    // 숨겨진 cartAmount 필드의 값을 변경
		    $('#addCartForm').find('input[name="cartAmount"]').val(quantity);
			$('#paymentForm').find('input[name="cartAmountOne"]').val(quantity);
		}*/

	    sitePlusMinus();


	var siteSliderRange = function() {
    $( "#slider-range" ).slider({
      range: true,
      min: 0,
      max: 500,
      values: [ 75, 300 ],
      slide: function( event, ui ) {
        $( "#amount" ).val( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
      }
    });
    $( "#amount" ).val( "$" + $( "#slider-range" ).slider( "values", 0 ) +
      " - $" + $( "#slider-range" ).slider( "values", 1 ) );
	};
	siteSliderRange();


	var siteMagnificPopup = function() {
		$('.image-popup').magnificPopup({
	    type: 'image',
	    closeOnContentClick: true,
	    closeBtnInside: false,
	    fixedContentPos: true,
	    mainClass: 'mfp-no-margins mfp-with-zoom', // class to remove default margin from left and right side
	     gallery: {
	      enabled: true,
	      navigateByImgClick: true,
	      preload: [0,1] // Will preload 0 - before current, and 1 after the current image
	    },
	    image: {
	      verticalFit: true
	    },
	    zoom: {
	      enabled: true,
	      duration: 300 // don't foget to change the duration also in CSS
	    }
	  });

	  $('.popup-youtube, .popup-vimeo, .popup-gmaps').magnificPopup({
	    disableOn: 700,
	    type: 'iframe',
	    mainClass: 'mfp-fade',
	    removalDelay: 160,
	    preloader: false,

	    fixedContentPos: false
	  });
	};
	siteMagnificPopup();


});