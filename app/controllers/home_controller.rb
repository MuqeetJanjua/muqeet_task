# frozen_string_literal: true

class HomeController < ApplicationController
  include ShopifyApp::EmbeddedApp
  include ShopifyApp::RequireKnownShop
  include ShopifyApp::ShopAccessScopesVerification

  def index
    if ShopifyAPI::Context.embedded? && (!params[:embedded].present? || params[:embedded] != "1")
      redirect_to(ShopifyAPI::Auth.embedded_app_url(params[:host]) + request.path, allow_other_host: true)
    else
      @shops = Shop.all
      @shop_origin = current_shopify_domain
      @host = params[:host]
      @count = Shop.count

    end
  end


  # def get_result
  #   flash = "SQLite Database"
  #   return flash
  # end
  # helper_method :get_result

end
