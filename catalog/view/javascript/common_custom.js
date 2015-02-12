$(document).ready(function() {
	moreColor.run();
});

var moreColor = {
	clickColor: function(){
		var that = this;
		//product item
		$('.popper_color').popover({
	      placement: 'top',
	      container: 'body',
	      html: true,
	      trigger: 'focus',
	      content: function () {
	          return $(this).closest('.product-thumb').find('.popper-color-content-lg').html();
	      }
		});

		$(document).on('click','.color-item',function(){
			var imageUrl = $(this).attr('data-url');
			var productId = $(this).attr('data-root');
			var imageLoaderHtml = $('#image_loader').html();
			var divImage = $('.product-thumb.'+productId).find('.image');
			divImage.find('img').hide();
			divImage.append(imageLoaderHtml);
			//check url
			that.imageExists(imageUrl, function(exists) {
			  if(exists){
			  	divImage.find('img').attr('src',imageUrl);
			  	divImage.find('img').show();
			  }
			});

		});

		//product detail
		$('.popper_color_detail').popover({
	      placement: 'bottom',
	      container: 'body',
	      html: true,
	      trigger: 'focus',
	      content: function () {
	          return $(this).parent().parent().find('.popper-color-content').html();
	      }
		});
		//product detail
		$('.popper_color_detail_lg').popover({
	      placement: 'bottom',
	      container: 'body',
	      html: true,
	      trigger: 'focus',
	      content: function () {
	          return $(this).parent().parent().find('.popper-color-content-lg').html();
	      }
		});
		$(document).on('click','.color-item-product-detail',function(){
			var groupColorImage = $(this).find('.group-color').html(),
				currColor = $(this).data('color');

			$('.popper_color_detail').data('color', currColor);
			$(this).closest('.popover-content').find('.color-item-product-detail').removeClass('active');
			$(this).addClass('active');

			var quantityDetail = $('#hid-quantity-detail').text(),
				productDetailSize = $('.product-detail-size'),
				panSizeSelect = productDetailSize.find('.pan-select-size'),
				sizeList = productDetailSize.find('ul'),
				keepCurrSize = false;

			quantityDetail = JSON.parse(quantityDetail);
			sizeList.html('');
			if (quantityDetail.length > 0) {
				for (var i = 0; i < quantityDetail.length; i++) {
					if (quantityDetail[i].color == currColor) {
						var itemActive = '';
						if (panSizeSelect.text() != '' && quantityDetail[i].size.label == panSizeSelect.text()) {
							keepCurrSize = true;
							itemActive = 'class="active"';
						}
						var li = $('<li ' + itemActive + '><a href="#" class="size-item">' + quantityDetail[i].size.label + '</a></li>');
						sizeList.append(li);
					}
				}
				if (!keepCurrSize) {
					panSizeSelect.text('');
				}
			}

			// append new image
			$('#box-product-image').html(groupColorImage);
		});

		$(document).on('click','.color-item-product-detail-lg',function(){
			var groupColorImage = $(this).find('.group-color').html(),
				currColor = $(this).data('color');

			$('.popper_color_detail_lg').data('color', currColor);
			$(this).closest('.popover-content').find('.color-item-product-detail-lg').removeClass('active');
			$(this).addClass('active');

			var quantityDetail = $('#hid-quantity-detail').text(),
				productDetailSize = $('.product-detail-size'),
				panSizeSelect = productDetailSize.find('.pan-select-size'),
				sizeList = productDetailSize.find('ul'),
				keepCurrSize = false;

			quantityDetail = JSON.parse(quantityDetail);
			sizeList.html('');
			if (quantityDetail.length > 0) {
				for (var i = 0; i < quantityDetail.length; i++) {
					if (quantityDetail[i].color == currColor) {
						var itemActive = '';
						if (panSizeSelect.text() != '' && quantityDetail[i].size.label == panSizeSelect.text()) {
							keepCurrSize = true;
							itemActive = 'class="active"';
						}
						var li = $('<li ' + itemActive + '><a href="#" class="size-item">' + quantityDetail[i].size.label + '</a></li>');
						sizeList.append(li);
					}
				}
				if (!keepCurrSize) {
					panSizeSelect.text('');
				}
			}

			// append new image
			$('#box-product-image-lg').html(groupColorImage);
			$('.img-first').magnificPopup({
		      type:'image',
		      delegate: 'a',
		      gallery: {
		        enabled:true
		      },
		        callbacks: {
		          open: function() {
		           $('.mfp-figure').zoom({
		              touch: true,
		              on: 'mouseover'
		              // url: 'https://nodogaboutit.files.wordpress.com/2012/10/j04310181.jpg'
		            });
		         }
		        }
		    });
		});

		$('.popper_color_detail').click(function() {
			var color = $(this).data('color'),
				allColor = $(document).find('.color-item-product-detail');

			if (color != undefined) {
				allColor.removeClass('active');	
			}
			
			allColor.each(function() {
				if ($(this).data('color') == color) {
					$(this).addClass('active');
				}
			});
		});
		
		$(document).on('click', '.size-item', function(e) {
			e.preventDefault();
			var a = $(this),
				panSizeSelect = a.closest('.product-detail-size'),			
				size = a.text(),
				sizeSelected = panSizeSelect.find('.pan-select-size');

			panSizeSelect.find('li').removeClass('active');
			a.closest('li').addClass('active');
			sizeSelected.text(size);
		});
		
	},
	imageExists: function(url, callback) {
	  var img = new Image();
	  img.onload = function() { callback(true); };
	  img.onerror = function() { callback(false); };
	  img.src = url;
	},
	zoomImage: function(){	 	
	 	$(document).on('click','.mfp-arrow.mfp-arrow-right.mfp-prevent-close',function(){
	 		$('.mfp-figure').zoom({
	 			touch: true,
              	on: 'mouseover'});
	 	});
	 	$(document).on('click','.mfp-arrow.mfp-arrow-left.mfp-prevent-close',function(){
	 		$('.mfp-figure').zoom({
	 			touch: true,
              	on: 'mouseover'});
	 	});
	},
	detectMenu: function(){
		var menuHide = $('#hide_menu_left').val();
		if(menuHide == "true"){
			$('.nav-menu-left').hide();
		}

		$(document).on('click','.img-lg-item',function(e){
			e.preventDefault();
			var url = $(this).find('img').attr('src');
			$('.img-lg-append').attr('src',url);
			$('.img-lg-append-a').attr('href',url);
			$('.mfp-figure').zoom({
	 			touch: true,
              	on: 'mouseover'});
		});	

	},
	run: function(){
		this.clickColor();
		this.zoomImage();
		this.detectMenu();
	}
}