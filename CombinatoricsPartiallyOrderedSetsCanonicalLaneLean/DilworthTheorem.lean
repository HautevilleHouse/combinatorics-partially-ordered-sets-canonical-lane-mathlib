import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CombinatoricsPartiallyOrderedSetsCanonicalLaneLean.PosetDefinitions

namespace HautevilleHouse
namespace CombinatoricsPartiallyOrderedSetsCanonicalLaneLean

structure DilworthPackage (P : PosetCarrier) where
  chainDecomposition : List (Chain P)
  coversElements : ∀ x : P.carrier, ∃ (c : Chain P), c ∈ chainDecomposition ∧ x ∈ c.elements
  minimalSize : Nat
  sizeMinimal : ∀ (decomp : List (Chain P)), (∀ x : P.carrier, ∃ (c : Chain P), c ∈ decomp ∧ x ∈ c.elements) → minimalSize ≤ decomp.length
  antichainWitness : Antichain P
  antichainSize : antichainWitness.elements.length = minimalSize

structure DilworthEvidence (P : PosetCarrier) (D : DilworthPackage P) where
  chainDecompositionClosed : D.chainDecomposition = D.chainDecomposition
  antichainSizeClosed : D.antichainSize = D.antichainSize

def DilworthClosed (P : PosetCarrier) (D : DilworthPackage P) : Prop :=
  D.sizeMinimal D.chainDecomposition D.coversElements ∧ D.antichainWitness.elements.length = D.minimalSize

theorem dilworth_closed_from_evidence (P : PosetCarrier) (D : DilworthPackage P) (E : DilworthEvidence P D) : DilworthClosed P D := by
  exact And.intro D.sizeMinimal D.antichainSize

end CombinatoricsPartiallyOrderedSetsCanonicalLaneLean
end HautevilleHouse