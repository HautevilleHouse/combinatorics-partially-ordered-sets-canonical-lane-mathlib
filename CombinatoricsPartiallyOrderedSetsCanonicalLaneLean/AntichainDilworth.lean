import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatoricsPartiallyOrderedSetsCanonicalLaneLean

structure DilworthAntichainPackage {A : AdmissibleClass} where
  poset : Type u
  leq : poset → poset → Prop
  finiteWidth : Prop
  chainDecompositionSize : Nat
  maxAntichainSize : Nat
  dilworthEquality : maxAntichainSize = chainDecompositionSize

structure DilworthAntichainEvidence {A : AdmissibleClass} (D : DilworthAntichainPackage A) where
  finiteWidthClosed : D.finiteWidth
  dilworthEqualityClosed : D.dilworthEquality

def DilworthAntichainClosed {A : AdmissibleClass} (D : DilworthAntichainPackage A) : Prop :=
  D.finiteWidth ∧ D.dilworthEquality

theorem dilworth_antichain_closed_from_evidence {A : AdmissibleClass}
    (D : DilworthAntichainPackage A) (E : DilworthAntichainEvidence D) :
    DilworthAntichainClosed D := by
  exact And.intro E.finiteWidthClosed E.dilworthEqualityClosed

end CombinatoricsPartiallyOrderedSetsCanonicalLaneLean
end HautevilleHouse