<h3><?php echo $heading_title; ?></h3>
<div class="row contentFeature">
  <?php foreach ($products as $product) { ?>
  <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
    <div class="product-thumb transition product-id-<?php echo $product['product_id']; ?>">
      <div class="popper-color-content hide">
        
      <?php //var_dump($product['quantity_detail']); ?>
        <?php /*  $product_thumb = ""; ?>
        <?php if(count($product['quantity_detail'])>0) : ?>
          <?php foreach($product['quantity_detail'] as $key => $row):?>
             <?php  if($key == 0) $product_thumb = $row['images'][0]['url'];  ?>
             <div class="color-item" style="background-color:<?php echo $row['color'] ?>" data-url="<?php echo $row['images'][0]['url'] ?>" data-root="product-id-<?php echo $product['product_id']; ?>"></div>
          <?php endforeach; ?>
        <?php endif; */ ?>

        <?php  $product_thumb = ""; ?>
        <?php  if(count($product['quantity_detail'])>0) : ?>
          <?php $colorUsed = array(); ?>
          <?php foreach ($product['quantity_detail'] as $key => $groupColor) : ?>
            <?php if (!in_array($groupColor['color'], $colorUsed)) : ?>
              <?php array_push($colorUsed, $groupColor['color']); ?>
              <?php if(count($groupColor['images']) > 0) : ?>
                  <?php foreach ($groupColor['images'] as $key1 => $img) : ?>
                    <?php
                      if($key == 0 && $key1 == 0){
                        $product_thumb = $img['url'];
                      }
                    ?>
                    <?php  if($key1 == 0) : ?>
                        <div  class="color-item <?php echo ($key == 0 ? 'active' : ''); ?>" style="background-color:<?php echo $groupColor['color']; ?>" data-color="<?php echo $groupColor['color']; ?>" data-url="<?php echo $img['url']; ?>" data-root="product-id-<?php echo $product['product_id']; ?>"> </div>
                    <?php  endif; ?>                                   
                    
                  <?php endforeach; ?>
              <?php endif; ?>              
            <?php endif; ?>
          <?php endforeach; ?>
        <?php endif;  ?>
      </div> 
      <div class="image"><a href="<?php echo $product['href']; ?>">
        <img src="<?php echo $product_thumb; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>
      </div>
      <div class="caption">
        <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
        <p><?php echo $product['description']; ?></p>
        <?php if ($product['rating']) { ?>
        <div class="rating">
          <?php for ($i = 1; $i <= 5; $i++) { ?>
          <?php if ($product['rating'] < $i) { ?>
          <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } else { ?>
          <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } ?>
          <?php } ?>
        </div>
        <?php } ?>
        <?php if ($product['price']) { ?>
        <p class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
          <?php } ?>
          <?php if ($product['tax']) { ?>
          <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
          <?php } ?>
        </p>
        <?php } ?>
      </div>
      <div class="button-group">
        <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class=""><?php echo $button_cart; ?></span></button>
        <button class="popper_color product-id-<?php echo $product['product_id']; ?> " type="button" data-toggle="popover" title="More color"><i class="glyphicon glyphicon-leaf"></i><span class="hidden-xs hidden-lg"> MORE COLOR</span></button>              
        <?php /* <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button> */ ?>
      </div>      
    </div>
  </div>

  <?php } ?>
</div>
