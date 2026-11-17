= Math Equations

Use inline math for short expressions. Display equations on their own line when they need a number for reference. Displayed equations are numbered consecutively in parentheses at the right margin, without figure captions. Include punctuation as part of the surrounding sentence and provide an alternative description for accessibility.

Let #math.equation(alt: "a", $a$), #math.equation(alt: "b", $b$), and #math.equation(alt: "c", $c$) be the side lengths of a right-angled triangle, where #math.equation(alt: "c", $c$) is the hypotenuse. Then
#math.equation(
  block: true,
  alt: "a squared plus b squared equals c squared",
  $ a^2 + b^2 = c^2. $,
) <eq:pythagoras>

@eq:pythagoras expresses the Pythagorean theorem.

The sum of the first #math.equation(alt: "n", $n$) positive integers is
#math.equation(
  block: true,
  alt: "The sum of k from k equals one to n equals n times n plus one, divided by two",
  $ sum_(k=1)^n k = (n(n+1)) / 2. $,
) <eq:integer-sum>

Define the golden ratio as
#math.equation(
  block: true,
  alt: "Phi is defined as one plus the square root of five, divided by two",
  $ phi.alt := (1 + sqrt(5)) / 2. $,
) <eq:golden-ratio>

Using the golden ratio defined in @eq:golden-ratio, the Fibonacci number for a nonnegative integer index is
#math.equation(
  block: true,
  alt: "F sub n equals the floor of phi to the power n divided by the square root of five, plus one half",
  $ F_n = floor(phi.alt^n / sqrt(5) + 1/2). $,
) <eq:fibonacci>
