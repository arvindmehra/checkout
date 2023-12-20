## Supermarket checkout

A supermarket sells the following items:

| Item | Price |
| --- | --- |
| A | £50 |
| B | £30 |
| C | £20 |

In addition, the supermarket offers some discounts:

- 2 items A for £90
- 3 items B for £75
- 10% off total basket cost for baskets worth over £200 (after previous discounts)

You must write a solution using Ruby which is used like this:

```ruby
checkout = Checkout.new(pricing_rules)
checkout.scan(item)
checkout.scan(item)
price = checkout.total
```

Here are some examples:

| Items | Basket total |
| --- | --- |
| A, B, C | £100 |
|  B, A, B, B, A | £165 |
| C, B, A, A, C, B, C | £189 |

When designing your solution keep in mind that a supermarket might want to add new discounts in the future.  What programming principle(s) should you follow to make the process of adding new discounts as straightforward as possible?  Say a new developer takes over from where you left off, and the supermarket needs to make some changes to the system, what (in terms of code design) would best set this new developer up to succeed?  Your design should reflect how you would answer these sorts of questions.





