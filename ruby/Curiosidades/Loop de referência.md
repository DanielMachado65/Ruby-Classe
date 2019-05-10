# ./app/models/alpha_product
class AlphaProduct < BaseProduct
end

# ./app/models/base_product.rb
class BaseProduct
  PRODUCTS = [AlphaProduct, Product]
  # this works
  # PRODUCTS = [Product]
end

# ./app/models/product.rb
class Product < BaseProduct
end

# test file:
require 'spec_helper'
it 'does something' do
  AlphaProduct.do_things # RuntimeError: Circular dependency detected while autoloading constant AlphaProduct
end