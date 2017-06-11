# Category theory

I want to learn category theory. It describes patterns most general. Lately,
while learning Haskell, I have found these highly general patterns to be
surprisingly useful. I will find every pattern I can and express it in Haskell
terms. Unfortunately, the Haskell type system cannot express everything, so
laws are required in addition to the functions of the type class. Quickcheck
provides a way around this (partially) by testing properties.

It bothers me in Haskell that the laws (for example the monad laws) are present
in human language, rather than encoded in Haskell itself. Is there a way around
this? Would there be in a language with dependent types? Say, AST?

Alternatively, I could learn the mathematical syntax. But I can't type it on my
computer, at least not without resorting to some highly unpleasant measures,
like Tex.

All things start at Wikipedia. They have a table. I like tables; there is less
to read. This table involves 5 qualities and 10 permutations of them.

 thing        |  T  |  A  |  I  |  V  |  C
 ------------ | --- | --- | --- | --- | ---
Semicategory  |  .  |  X  |  .  |  .  |  .
Category      |  .  |  X  |  X  |  .  |  .
Groupoid      |  .  |  X  |  X  |  X  |  .
Magma         |  X  |  .  |  .  |  .  |  .
Quasigroup    |  X  |  .  |  .  |  X  |  .
Loop          |  X  |  .  |  X  |  X  |  .
Semigroup     |  X  |  X  |  .  |  .  |  .
Monoid        |  X  |  X  |  X  |  .  |  .
Group         |  X  |  X  |  X  |  X  |  .
Abelian group |  X  |  X  |  X  |  X  |  X

Where

 * T - Totality
 * A - Associativity
 * I - Identity
 * V - inVertability
 * C - Commutativity

Now I want to talk about each of these qualities.

## Totality

Totality can be expressed cleanly in Haskell

```haskell
class Closed a where
  a <> a = a 
```

Any pair of members maps to another member in the set. The set is closed under
the (<>) operator.

## Associativity

```haskell
(x <> y) <> z == x <> (y <> z)
```

## Identity

```haskell
x <> zero == x
```

## Invertability

```haskell
x <> (invert x) == zero
```

## Commutativity

```haskell
x <> y == y <> x
```
