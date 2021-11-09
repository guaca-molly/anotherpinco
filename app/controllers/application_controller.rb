class ApplicationController < ActionController::Base
  
  before_action :current_cart
  helper_method :current_cart

  def current_cart
    #if the customer has just landed on the site give them a brand new cart
    #if they already have one keep it
    if session[:cart_id].present?
      #they already have a cart
      @current_cart = Cart.find(session[:cart_id])
    else
      #if they dont have a cart
      @current_cart = Cart.create
      session[:cart_id] = @current_cart.id
    end

  end
end
