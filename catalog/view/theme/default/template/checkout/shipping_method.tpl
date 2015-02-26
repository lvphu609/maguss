<?php if ($error_warning) { ?>
<div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
<?php } ?>
<?php if ($shipping_methods) { ?>
<p><?php echo $text_shipping_method; ?></p>
<?php foreach ($shipping_methods as $shipping_method) { ?>
<p><strong><?php echo $shipping_method['title']; ?></strong></p>
<?php if (!$shipping_method['error']) { ?>
<?php foreach ($shipping_method['quote'] as $quote) { ?>
<div class="radio">
  <label>
    <?php if ($quote['code'] == $code || !$code) { ?>
    <?php $code = $quote['code']; ?>
    <input type="radio" name="shipping_method" id="rdo-shipping-method" value="<?php echo $quote['code']; ?>" checked="checked" />
    <?php } else { ?>
    <input type="radio" name="shipping_method" id="rdo-shipping-method" value="<?php echo $quote['code']; ?>" />
    <?php } ?>
    <?php echo $quote['title']; ?> </label>
    <?php  if ($code == 'maguss.maguss') : ?>
      <select name="shipping_value" id="cbo-shipping-location" data-numitem="<?php echo $quote['num_item'] ?>">
        <?php if (count($quote['locations']) > 0) : ?>
          <?php foreach ($quote['locations']['name'] as $key => $location) : ?>
            <option data-cost="<?php echo $quote['locations']['cost_format'][$key] ?>" value="<?php echo $quote['locations']['cost'][$key] ?>"><?php echo $location; ?></option>
          <?php endforeach; ?>
        <?php endif; ?>
      </select>
      <input type="hidden" name="shipping_location" id="hid-shipping-location" value="<?php echo (count($quote['locations']) > 0 ? $quote['locations']['name'][0] : ''); ?>">
    <?php endif; ?>
    <span class="label label-success" id="lbl-shipping-cost"><?php echo $quote['text']; ?></span>
</div>
<?php } ?>
<?php } else { ?>
<div class="alert alert-danger"><?php echo $shipping_method['error']; ?></div>
<?php } ?>
<?php } ?>
<?php } ?>
<p><strong><?php echo $text_comments; ?></strong></p>
<p>
  <textarea name="comment" rows="8" class="form-control"><?php echo $comment; ?></textarea>
</p>
<div class="buttons">
  <div class="pull-right">
    <input type="button" value="<?php echo $button_continue; ?>" id="button-shipping-method" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary" />
  </div>
</div>
