import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatoricsPartiallyOrderedSetsCanonicalLaneLean

structure MirskyChainPackage {A : AdmissibleClass} where
  poset : Type u
  leq : poset → poset → Prop
  finiteHeight : Prop
  antichainDecompositionSize : Nat
  maxChainSize : Nat
  mirskyEquality : maxChainSize = antichainDecompositionSize

structure MirskyChainEvidence {A : AdmissibleClass} (M : MirskyChainPackage A) where
  finiteHeightClosed : M.finiteHeight
  mirskyEqualityClosed : M.mirskyEquality

def MirskyChainClosed {A : AdmissibleClass} (M : MirskyChainPackage A) : Prop :=
  M.finiteHeight ∧ M.mirskyEquality

theorem mirsky_chain_closed_from_evidence {A : AdmissibleClass}
    (M : MirskyChainPackage A) (E : MirskyChainEvidence M) :
    MirskyChainClosed M := by
  exact And.intro E.finiteHeightClosed E.mirskyEqualityClosed

end CombinatoricsPartiallyOrderedSetsCanonicalLaneLean
end HautevilleHouse