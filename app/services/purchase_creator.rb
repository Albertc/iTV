# frozen_string_literal: true

# Purchase creator
# If can create the purchase
#   Returns { purchase: #Purchase_instance }
# If there are errors:
#   Returns { errors: "[error message]" }
class PurchaseCreator < ApplicationService
  attr_reader :user, :purchase_option_id, :purchase

  def initialize(user, purchase_option_id)
    @user = user
    @purchase_option_id = purchase_option_id
  end

  def call
    return purchase_option_error unless valid_purchase_option?
    return user_error unless valid_user?

    @purchase = user.purchases.create(purchase_option_id: purchase_option_id)

    return { purchase: purchase } if purchase.valid?

    { errors: purchase_errors }
  end

  private

  def purchase_errors
    purchase.errors.full_messages.to_sentence
  end

  def purchase_option_error
    { errors: 'Invalid purchase_option_id' }
  end

  def user_error
    { errors: 'Invalid user' }
  end

  def valid_purchase_option?
    PurchaseOption.exists?(purchase_option_id)
  end

  def valid_user?
    user&.instance_of? User
  end
end
