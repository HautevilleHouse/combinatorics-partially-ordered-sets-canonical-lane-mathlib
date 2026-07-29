import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CombinatoricsPartiallyOrderedSetsCanonicalLaneLean.PartialOrderClassification

namespace HautevilleHouse
namespace CombinatoricsPartiallyOrderedSetsCanonicalLaneLean

structure Realizer (P : FinitePoset) (k : ℕ) where
  linearExtensions : Vector (LinearExtension P) k
  intersectionIsP : ∀ a b : P.carrier, P.le a b ↔ ∀ i, (linearExtensions.get i).le a b

def orderDimension (P : FinitePoset) : ℕ :=
  min {k | Nonempty (Realizer P k)}

theorem order_dimension_well_defined (P : FinitePoset) : Nonempty (Realizer P (orderDimension P)) :=
  by
    sorry

end CombinatoricsPartiallyOrderedSetsCanonicalLaneLean
end HautevilleHouse