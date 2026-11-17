#import "../../lib.typ": *
= Math Equations
#lorem(50).

Let #math.equation(alt: "a", $a$), #math.equation(alt: "b", $b$), and #math.equation(alt: "c", $c$) be the side lengths of right-angled triangle. Then, we know that:
#apa-figure(
  math.equation(alt: "a squared plus b squared equals c squared", $ a^2 + b^2 = c^2 $),
  placement: none,
  kind: math.equation,
  caption: "Right-angled triangle",
) <fig:right-angled-triangle>

Prove by induction:
#apa-figure(
  math.equation(alt: "The sum of k from k equals one to n equals n times n plus one, divided by two", $ sum_(k=1)^n k = (n(n+1)) / 2 $),
  placement: none,
  kind: math.equation,
  caption: "Sum of first n integers",
) <fig:sum-first-n-integers>

We define:
#apa-figure(
  math.equation(alt: "Phi is defined as one plus the square root of five, divided by two", $ phi.alt := (1 + sqrt(5)) / 2 $),
  placement: none,
  kind: math.equation,
  caption: "Golden ratio",
) <ratio>

With @ratio, we get:
#figure(
  math.equation(alt: "F sub n equals the floor of phi to the power n divided by the square root of five", $ F_n = floor(1 / sqrt(5) phi.alt^n) $),
  placement: none,
  kind: math.equation,
  caption: [Fibonacci number],
) <fibonacci-number>
