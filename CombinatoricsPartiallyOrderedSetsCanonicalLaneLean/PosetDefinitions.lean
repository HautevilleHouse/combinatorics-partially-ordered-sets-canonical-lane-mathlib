import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatoricsPartiallyOrderedSetsCanonicalLaneLean

structure PosetCarrier where
  carrier : Type u
  leq : carrier → carrier → Prop
  refl : ∀ x : carrier, leq x x
  antisymm : ∀ x y : carrier, leq x y → leq y x → x = y
  trans : ∀ x y z : carrier, leq x y → leq y z → leq x z

structure Chain (P : PosetCarrier) where
  elements : List P.carrier
  increasing : ∀ i j, i < j → P.leq (elements.get ⟨i, by
    have h : i < elements.length := by
      simpa using Nat.lt_of_lt_of_le (by omega) (by omega)
    exact h
  ⟩) (elements.get ⟨j, by
    have h : j < elements.length := by
      simpa using Nat.lt_of_lt_of_le (by omega) (by omega)
    exact h
  ⟩)

structure Antichain (P : PosetCarrier) where
  elements : List P.carrier
  incomparable : ∀ i j, i ≠ j → ¬ (P.leq (elements.get i) (elements.get j)) ∧ ¬ (P.leq (elements.get j) (elements.get i))

structure PosetAdmittedObject where
  poset : PosetCarrier
  finite : Fintype poset.carrier
  conclusion : Prop

structure PosetAdmittedClass where
  object : PosetAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def PosetWitnessClosed (O : PosetAdmittedObject) : Prop :=
  O.conclusion

end CombinatoricsPartiallyOrderedSetsCanonicalLaneLean
end HautevilleHouse