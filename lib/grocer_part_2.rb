require_relative './part_1_solution.rb'
require 'pry'

def apply_coupons(cart, coupons)
  apply_coupon_cart = []
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  coupons.each do |coupon_item|
    current_coupon_item = find_item_by_name_in_collection(coupon_item[:item], cart)
    cart.each do |cart_item|
      if current_coupon_item[:item] == cart_item[:item]
        if cart_item[:count] == coupon_item[:num]
          update_coupon_item = cart_item.clone
          update_coupon_item[:item] += " W/COUPON"
          update_coupon_item[:price] = coupon_item[:cost]/coupon_item[:num]
          cart << update_coupon_item
          cart_item[:count] -= coupon_item[:num]
        #elsif cart_item[:count] > coupon_item[:num]
        else
          update_coupon_item = cart_item.clone
          update_coupon_item[:item] += " W/COUPON"
          update_coupon_item[:count] = coupon_item[:num]
          update_coupon_item[:price] = coupon_item[:cost]/coupon_item[:num]
          cart << update_coupon_item
          cart_item[:count] -= coupon_item[:num]
        end
      end
    end
  end
  cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  cart.each do |item|
    if item[:clearance] == true
      original_price = item[:price]
      clearance_price = (original_price - (original_price * 0.20)).round(2)
      item[:price] = clearance_price
    end
  end
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
  cart = consolidate_cart(cart)
  cart = apply_coupons(cart, coupons)
  cart = apply_clearance(cart)
  binding.pry
end
