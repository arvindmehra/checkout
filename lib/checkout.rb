# frozen_string_literal: true

class Checkout
  attr_accessor :items, :pricing_rules, :total_price

  ITEMS = %w[A B C].freeze

  def initialize(pricing_rules = default_pricing_rules)
    @pricing_rules = pricing_rules
    @items = Hash.new(0)
  end

  def scan(item)
    return unless ITEMS.include?(item)

    @items[item] += 1
  end

  def total
    @total_price = 0
    @items.each do |item, quantity|
      calculate_price(item, quantity)
    end
    @total_price
  end

  private

  def calculate_price(item, quantity)
    if pricing_rules[item]['discount_qty']
      @total_price += discounted_price(item, quantity) if quantity >= pricing_rules[item]['discount_qty']
      @total_price += regular_price(item, quantity)
    else
      @total_price += pricing_rules[item]['price'] * quantity
    end
  end

  def discounted_price(item, quantity)
    pricing_rules[item]['discounted_price'] * (quantity / pricing_rules[item]['discount_qty'])
  end

  def regular_price(item, quantity)
    pricing_rules[item]['price'] * (quantity % pricing_rules[item]['discount_qty'])
  end

  def default_pricing_rules
    {
      'A' => { 'price' => 50, 'discounted_price' => 90, 'discount_qty' => 2 },
      'B' => { 'price' => 30, 'discounted_price' => 75, 'discount_qty' => 3 },
      'C' => { 'price' => 20 }
    }
  end
end
