$(document).ready(function() {
	morColor.run();
});

var morColor = {
	clickColor: function(){
		var that = this;
		//product item
		$('.popper_color').popover({
	      placement: 'top',
	      container: 'body',
	      html: true,
	      trigger: 'focus',
	      content: function () {
	          return $(this).closest('.product-thumb').find('.popper-color-content').html();
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
	      //trigger: 'focus',
	      content: function () {
	          return $(this).parent().parent().find('.popper-color-content').html();
	      }
		});
		$(document).on('click','.color-item-product-detail',function(){
			var groupColorImage = $(this).find('.group-color').html();

			$('.popper_color_detail').data('color', $(this).css('backgroundColor'));
			$(this).closest('.popover-content').find('.color-item-product-detail').removeClass('active');
			$(this).addClass('active');
			$('#box-product-image').html(groupColorImage);
		});

		$('.popper_color_detail').click(function() {
			var color = $(this).data('color'),
				allColor = $(document).find('.color-item-product-detail');

			if (color != undefined) {
				allColor.removeClass('active');	
			}
			
			allColor.each(function() {
				if ($(this).css('backgroundColor') == color) {
					$(this).addClass('active');
				}
			});
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
	run: function(){
		this.clickColor();
		this.zoomImage();
	}
}