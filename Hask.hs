-- | a semigroup is a set with a closed, associative binary operator
class Semigroup a where
  (<>) :: a -> a -> a

-- | a monoid is a semigroup with an identity element such that
-- a <> mempty  ==  a
class Semigroup a => Monoid a where
  mempty :: a

-- | a group is a monoid with an inverse such that
-- x <> (inverse x) == mempty
class Monoid a => Group a where
  inverse :: a -> a
