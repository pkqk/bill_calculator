Bill Calculator
===============

At Cake, we like to have team dinners. After having lots of fun and wanting to go somewhere else
having even more, we hate having to calculate how much each one have to pay.

Having this as a background, we started implemented a mini-calculator.
A bill contains subtotal (the sum of the items' prices), and might or might not include service
charge and discount.

Because we are really bad at maths, from those amounts, we would like our calculator to tell us how much each of us has to pay.

We started something here, but we would like you to complete a few exercises:

1. Complete the writing of the `bill_spec.rb` tests. This includes the implementation of the
`Bill#split_by` method.

2. Complete the writing of the `bill_decorator_spec.rb` tests. This includes the implementation of
the `BillDecorator#split_by` and `BillDecorator#total` methods.

Dependencies
------------
* Ruby 2.2.3
* Bundler
