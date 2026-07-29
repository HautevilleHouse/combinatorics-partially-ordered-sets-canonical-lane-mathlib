import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatoricsPartiallyOrderedSetsCanonicalLaneLean

structure SYMChainPackage {A : AdmissibleClass} where
  poset : Type u
  leq : poset → poset → Prop
  ranked : Prop
  rankFunction : poset → Nat
  chainDecomposition : List (List poset)
  symmetricChain : Prop
  symCondition : symmetricChain → ranked

structure SYMChainEvidence {A : AdmissibleClass} (S : SYMChainPackage A) where
  symmetricChainClosed : S.symmetricChain
  rankedClosed : S.ranked

def SYMChainClosed {A : AdmissibleClass} (S : SYMChainPackage A) : Prop :=
  S.symmetricChain ∧ S.ranked

theorem sym_chain_closed_from_evidence {A : AdmissibleClass}
    (S : SYMChainPackage A) (E : SYMChainEvidence S) :
    SYMChainClosed S := by
  exact And.intro E.symmetricChainClosed E.rankedClosed

end CombinatoricsPartiallyOrderedSetsCanonicalLaneLean
end HautevilleHouse