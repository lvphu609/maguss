<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">
<!-- <link href="catalog/view/theme/default/stylesheet/normalize.min.css" rel="stylesheet"> -->
<!-- <link href="catalog/view/theme/default/stylesheet/ion.zoom.css" rel="stylesheet"> -->
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<script src="catalog/view/javascript/common_custom.js" type="text/javascript"></script>
<script src="catalog/view/javascript/mustache.min.js" type="text/javascript"></script>
<script src="catalog/view/javascript/jquery.zoom.js" type="text/javascript"></script>

<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php echo $google_analytics; ?>
</head>
<body class="<?php echo $class; ?>">
  <nav class="navbar navbar-default navbar-fixed-top nav-logo-maguss" role="navigation">
    <div class="container-fluid">
      <div class="text-center logoCss">
            <a href="#">
              <img class="logo-maguss" src="<?php echo $logo; ?>">
            </a>
      </div>
    </div>
  </nav>
  <nav class="navbar navbar-default navbar-fixed-top main-menu-magus" role="navigation">
    <div class="container-fluid">
      <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header">
        <button type="button" class="navbar-toggle toggle-menu menu-left push-body" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
      </div>

      <!-- Collect the nav links, forms, and other content for toggling -->
      <!-- Push Menu Left -->
      <div class="collapse navbar-collapse cbp-spmenu cbp-spmenu-vertical cbp-spmenu-left menu-top-search" id="bs-example-navbar-collapse-1">
        <header>
              <?php echo $search; ?>
        </header>          
      <!-- fetch menu data  -->
          <ul class="nav navbar-nav event-menu-hidden-mobile">
            <?php foreach ($categories as $category) { ?>
            <?php if ($category['children']) { ?>
            <li class="dropdown">
              <a class="dropdown-toggle" data-toggle="dropdown" href="#"><?php echo $category['name']; ?></a>
              <ul class="dropdown-menu" role="menu">
                  <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                    <?php foreach ($children as $child) { ?>
                    <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                    <?php } ?>
                  <?php } ?>
                  <li><a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a> 
                  </li>
              </ul>
            </li>
            <?php } else { ?>
            <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
            <?php } ?>
            <?php } ?>
          </ul>

          <ul class="nav navbar-nav navbar-right">
            <li><a href="<?php echo $contact; ?>"><i class="fa fa-phone"></i> <?php echo $telephone; ?></a></li>            
            <li><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><i class="fa fa-heart"></i> <?php echo $text_wishlist; ?></a></li>
            <li><a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"><i class="fa fa-shopping-cart"></i> <?php echo $text_shopping_cart; ?></a></li>
            <li><a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><i class="fa fa-share"></i> <?php echo $text_checkout; ?></a></li>
            <li class="dropdown"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <?php echo $text_account; ?><span class="caret"></span></a>
              <ul class="dropdown-menu dropdown-menu-right">
                <?php if ($logged) { ?>
                <li><a href="<?php echo $account; ?>"> <?php echo $text_account; ?></a></li>
                <li><a href="<?php echo $order; ?>"> <?php echo $text_order; ?></a></li>
                <li><a href="<?php echo $transaction; ?>"> <?php echo $text_transaction; ?></a></li>
                <li><a href="<?php echo $download; ?>"> <?php echo $text_download; ?></a></li>
                <li><a href="<?php echo $logout; ?>"> <?php echo $text_logout; ?></a></li>
                <?php } else { ?>
                <li><a href="<?php echo $register; ?>"> <?php echo $text_register; ?></a></li>
                <li><a href="<?php echo $login; ?>"> <?php echo $text_login; ?></a></li>
                <?php } ?>
              </ul>
            </li>
          </ul>

      </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
  </nav>

   

  <script src="catalog/view/javascript/jPushMenu.js"></script>
  <script src="catalog/view/javascript/v2p.js"></script>
  <script type="text/javascript">
    //<![CDATA[
    $(document).ready(function(){
      $('.toggle-menu').jPushMenu({closeOnClickLink: false});
      $('.dropdown-toggle').dropdown();
    });
    //]]>
  </script>
  <script type="text/javascript">
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
    ga('create', 'UA-2053418-2', 'stampede-design.com');
    ga('send', 'pageview');
  </script>


<!-- menu left -->
<div class="col-sm-2 nav-menu-left">
    <!-- featch menu data  -->
    <ul class="nav navbar-nav">
      <?php foreach ($categories as $key => $category) { ?>
      <?php if ($category['children']) { ?>
      <li class="dropdown">
        <a data-toggle="collapse" href="javascript:;" data-target="#menu-collapse-item-<?php echo $key; ?>"><?php echo $category['name']; ?></a>
        <ul id="menu-collapse-item-<?php echo $key; ?>" class="collapse">
            <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
              <?php foreach ($children as $child) { ?>
                <li>
                  <a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
                </li>
              <?php } ?>
            <?php } ?>
            <li>
              <a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?>
              </a> 
            </li>
        </ul>
      </li>
      <?php } else { ?>
      <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
      <?php } ?>
      <?php } ?>
    </ul>
</div>

<script id="image_loader" type="x-tmpl-mustache">
  <img src="/maguss/image/ajax-loader.gif" class="img-loading-product"  />
</script>
