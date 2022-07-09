class Product < ApplicationRecord
  validates :name, :price, presence: true
  validates :price, numericality: { greater_than: 0, less_than: 10_000_000 }

  def to_s
    name
  end

  monetize :price, as: :price_cents

  # transform shopping cart products into an array of line items
  def to_builder
    Jbuilder.new do |product|
      product.price stripe_price_id
      product.quantity 1
    end
  end

  # create stripe product and assign to this product
  after_create do
    product = Stripe::Product.create(name: name)
    price = Stripe::Price.create(product: product, unit_amount: self.price, currency: currency)
    update(stripe_product_id: product.id, stripe_price_id: price.id)
  end
end
