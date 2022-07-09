class CheckoutController < ApplicationController
  def create
    product = Product.find(params[:id])
    @session = Stripe::Checkout::Session.create({
                                                  payment_method_types: ['card'],
                                                  line_items: [{
                                                    name: product.name,
                                                    amount: product.price,
                                                    currency: 'usd',
                                                    quantity: 1
                                                  }],
                                                  allow_promotion_codes: true,
                                                  mode: 'payment',
                                                  success_url: "#{success_url}?session_id={CHECKOUT_SESSION_ID}",
                                                  cancel_url: cancel_url
                                                })
    redirect_to @session.url, status: 303, allow_other_host: true
  end
end
