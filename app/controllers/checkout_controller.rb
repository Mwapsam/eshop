class CheckoutController < ApplicationController
  def create
    if @cart.pluck(:currency).uniq.length > 1
      redirect_to products_path, alert: 'You can not select products with different currencies in one checkout'
    else
      @session = Stripe::Checkout::Session.create({
                                                    customer: current_user.stripe_customer_id,
                                                    payment_method_types: ['card'],
                                                    line_items: @cart.collect { |item| item.to_builder.attributes! },
                                                    allow_promotion_codes: true,
                                                    mode: 'payment',
                                                    success_url: "#{success_url}?session_id={CHECKOUT_SESSION_ID}",
                                                    cancel_url: cancel_url
                                                  })
      redirect_to @session.url
    end
  end
end
