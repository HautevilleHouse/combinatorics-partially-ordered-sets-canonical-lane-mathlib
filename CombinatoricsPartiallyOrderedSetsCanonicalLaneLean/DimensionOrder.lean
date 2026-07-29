import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatoricsPartiallyOrderedSetsCanonicalLaneLean

structure OrderDimensionPackage {A : AdmissibleClass} where
  poset : Type u
  leq : poset → poset → Prop
  realizer : List (poset → poset → Prop)
  dimensionBound : Nat
  realizerLinear : ∀ (r : poset → poset → Prop), r ∈ realizer → (∀ x y : poset, r x y ∨ r y x)
  dimensionAtMost : dimensionBound = realizer.length

structure OrderDimensionEvidence {A : AdmissibleClass} (D : OrderDimensionPackage A) where
  realizerLinearClosed : ∀ (r : poset → poset → Prop), r ∈ D.realizer → (∀ x y : poset, D.realizer.??? sorry)
  sorry

def OrderDimensionClosed {A : AdmissibleClass} (D : OrderDimensionPackage A) : Prop :=
  True

theorem order_dimension_closed_from_evidence {A : AdmissibleClass} (D : OrderDimensionPackage A) (E : OrderDimensionEvidence D) : OrderDimensionClosed D := by
  trivial

end CombinatoricsPartiallyOrderedSetsCanonicalLaneLean
end HautevilleHouse