<?php
class ControllerModuleFeatured extends Controller {
	public function index($setting) {
		$this->load->language('module/featured');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_tax'] = $this->language->get('text_tax');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		$data['products'] = array();

		if (!$setting['limit']) {
			$setting['limit'] = 4;
		}

		$products = array_slice($setting['product'], 0, (int)$setting['limit']);

		foreach ($products as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);

			if ($product_info) {
				if ($product_info['image']) {
					$image = $this->model_tool_image->resize($product_info['image'],300,400);//$setting['width'], $setting['height']);
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}

				if ((float)$product_info['special']) {
					$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = $product_info['rating'];
				} else {
					$rating = false;
				}

				//get quantity detail
				/*$quantity_detail = !empty($product_info['quantity_detail']) ? $product_info['quantity_detail'] : '[]' ;
				$quantityDetail = json_decode($quantity_detail, true);
				if (count($quantityDetail) > 0) {
					foreach ($quantityDetail as $key => $value) {
						if (count($value['images']) > 0) {
							foreach ($value['images'] as $imgKey => $img) {
								$quantityDetail[$key]['images'][$imgKey]['url'] = $this->model_tool_image->resize($img['name'], 300, 400);
							}
						}
					}
					$quantityDetail = $quantityDetail;
				} else {
					$quantityDetail = array();
				}*/
				//product detail
				$qty_detail = !empty($product_info['quantity_detail']) ? $product_info['quantity_detail'] : '[]' ;
				$quantityDetail = json_decode($qty_detail, true);
				if (count($quantityDetail) > 0) {
					foreach ($quantityDetail as $key => $value) {
						if (count($value['images']) > 0) {
							foreach ($value['images'] as $imgKey => $img) {
								$quantityDetail[$key]['images'][$imgKey]['url'] = $this->model_tool_image->resize($img['name'], 768, 1024);
							}
						}
					}
					$quantityDetail = $quantityDetail;
				} else {
					$quantityDetail = array();
				}

				// var_dump($quantityDetail);die();
				$data['products'][] = array(
					'product_id'  => $product_info['product_id'],
					'thumb'       => $image,
					'name'        => $product_info['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $product_info['product_id']),
					'quantity_detail' => $quantityDetail
				);
			}
		}

		if ($data['products']) {
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/featured.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/featured.tpl', $data);
			} else {
				return $this->load->view('default/template/module/featured.tpl', $data);
			}
		}
	}
}