# frozen_string_literal: true

class ProductsController < AuthenticatedController

  skip_before_action :verify_authenticity_token

  def index
    # product = ShopifyAPI::Product.new
    # product.product_type = "Accessories"
    # product.title = "Watches For Men"
    # product.body_html  = "<strong>Good Watches and Suitable for Mens</strong>"
    # product.vendor = "MG Test Store 2"
    # product.price = "10.0"
    # # product.variants = []
    # product.save


    @products = ShopifyAPI::Product.all
    @ss = ShopifyAPI::Product.count
    # @ss1 = ShopifyAPI::Shop.current

    render(json: { products: @products, ss: @ss, ss1: @ss1 })
  end

  def products
    #  pyload = JSON.parse(string)
    response = RestClient.get("https://mg-test-store-1.myshopify.com/admin/api/2020-10/products.json",
                              { 'X-Shopify-Access-Token': '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' })

    res = JSON.parse(response.body)
    @products_list = res['products']
    render json: {products_list: @products_list}
  end

  def create_products
    url = "https://mg-test-store-2.myshopify.com/admin/api/2022-10/products.json"
    response = RestClient.post(url , {
    "product": {
        "title": "Shirts MG Test",
        "body_html": "\u003cstrong\u003eGood Yahooo!\u003c/strong\u003e",
        "vendor": "MG Test Store 1",
        "product_type": "Accessories",
        "variants":[
            {
                "option1":"Small",
                "title":"Small",
                "price":10,
                "weight":10
            },
            {
                "option1":"Large",
                "title":"Large",
                "price":20
            }
        ]
    }
    },
                               { 'X-Shopify-Access-Token': "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" }
    )

    res = JSON.parse(response.body)
    render json: {products_list: res}
  end


end
