// JavaScript共用區
//20160921 by kevin

	var winHeight    = $(window).height();          //螢幕高度
	var win_W		 = $(window).width();			//螢幕寬度
	var hederHeight  = $(".header").innerHeight();;	//版頭高度
	var footerHeight = $(".footer").innerHeight();;	//版腳高度

	//浮動式top鍵
	$(window).load(function(){
		$(window).bind('scroll resize', function(){
			var $this = $(this);
			var $this_Top=$this.scrollTop();
			
			//當高度小於100時，關閉區塊 
			if($this_Top < 100){
				$('.topBtn').stop().animate({bottom:"-70px"});
			}
			if($this_Top > 100){
				$('.topBtn').stop().animate({bottom:"196px"});
			}
		}).scroll();
	});
	
	//錨點平滑滾動效果
	$(function(){
		$('a[href*=#]').click(function() {
			if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
				var $target = $(this.hash);
				$target = $target.length && $target || $('[name=' + this.hash.slice(1) + ']');
				if ($target.length) {
					var targetOffset = $target.offset().top;
					$('html,body').animate({
						scrollTop: targetOffset
					},
					1000);
					return false;
				}
			}
		});
	});
	
	//----------------------------------將主體添加最小高度 讓footer置底----------------------------------
	function mainH() {
		winHeight    = $(window).height();
		hederHeight  = $(".header").innerHeight();
		footerHeight = $(".footer").innerHeight();
		
		$(".main").css({
			'min-height': winHeight-hederHeight-footerHeight+'px'		//"-30"這要隨每個案子不同調整
		})
	}
	
	mainH();
	
	setTimeout(function(){
		mainH();
	},300)
	
	$(window).resize(function(e) {
		setTimeout(function(){
			mainH();
		},300)
	});
	
	//----------------------------------logo用小閃光----------------------------------
	$(function(){
		$(".logo_flash").parent().css("position","relative");
							
		function logoFlash(){
			$(".logo_flash").addClass("logo_flash_hover");
			window.setTimeout(function(){
				$(".logo_flash").removeClass("logo_flash_hover");
			},500);
		}
		
		window.setTimeout(logoFlash,500);
		
		
		$(".logo img").mouseover(function(e) {
			logoFlash();
		});
	});
	
	//----------------------------------主按鍵收合----------------------------------
	$(function(){
		$(".nav").children("a").click(function(e) {
            $(this).siblings(".navOpen.mobile").slideToggle("fast");
			$(".nav").children("a").not(this).siblings(".navOpen.mobile").slideUp("fast");
			
			e.stopPropagation();
        });
		
		$(".navOpen.mobile").click(function(e) {
            e.stopPropagation();
        });
		
		$(window).click(function(e) {
            $(".navOpen.mobile").slideUp("fast");
        });
	});
	
	//----------------------------------手機版主按鍵收合----------------------------------
	$(function(){
		$(".menu_btn").click(function(e) {
            $(this).toggleClass("active");
			$(".headerRight").toggleClass("active");
			$("body").toggleClass("active");
			e.stopPropagation();
        });
		
		$(window).resize(function(e) {
			var win_W		 = $(window).width();			//螢幕寬度
            if ( win_W > 795 ) {
				$(".headerRight").removeClass("active");
				$("body").removeClass("active");
				$(".menu_btn").removeClass("active");
			}
        });
		
		$(".headerRight").click(function(e) {
            e.stopPropagation();
        });
		
		$(window).click(function(e) {
            $(".headerRight").removeClass("active");
			$("body").removeClass("active");
			$(".menu_btn").removeClass("active");
        });
	});

	//----------------------------------手機板左選單收合----------------------------------
	$(function(){
		$(".left_tit").click(function(e) {		
			if ( $(window).width() <= 768 ) { // Eric修改-手機版時才有收合效果 850隨每個案子修改
			$(this).toggleClass("active");
				
				$(".left_list_area").slideToggle("slow");
				$("body").toggleClass("active");
				e.stopPropagation();
            }
        });
	
	});
		

$(function(){
});