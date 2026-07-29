import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatoricsPartiallyOrderedSetsCanonicalLaneLean

structure Poset where
  Carrier : Type u
  LE : Carrier → Carrier → Prop
  le_refl : ∀ x : Carrier, LE x x
  le_trans : ∀ x y z : Carrier, LE x y → LE y z → LE x z
  le_antisymm : ∀ x y : Carrier, LE x y → LE y x → x = y

structure AdmissiblePosetObject where
  poset : Poset
  finite : Prop
  conclusion : finite

end CombinatoricsPartiallyOrderedSetsCanonicalLaneLean
end HautevilleHouse