import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CombinatoricsPartiallyOrderedSetsCanonicalLaneLean.PosetDefinitions

namespace HautevilleHouse
namespace CombinatoricsPartiallyOrderedSetsCanonicalLaneLean

structure ChainPackage (P : PartiallyOrderedSet) where
  chain : Set P.carrier
  total : ∀ a b, a ∈ chain → b ∈ chain → P.leq a b ∨ P.leq b a

structure AntichainPackage (P : PartiallyOrderedSet) where
  antichain : Set P.carrier
  incomparable : ∀ a b, a ∈ antichain → b ∈ antichain → a ≠ b → ¬ P.leq a b ∧ ¬ P.leq b a

structure ChainEvidence (P : PartiallyOrderedSet) (C : ChainPackage P) where
  totalClosed : ∀ a b, a ∈ C.chain → b ∈ C.chain → P.leq a b ∨ P.leq b a

structure AntichainEvidence (P : PartiallyOrderedSet) (A : AntichainPackage P) where
  incomparableClosed : ∀ a b, a ∈ A.antichain → b ∈ A.antichain → a ≠ b → ¬ P.leq a b ∧ ¬ P.leq b a

def ChainClosed (P : PartiallyOrderedSet) (C : ChainPackage P) : Prop :=
  ∀ a b, a ∈ C.chain → b ∈ C.chain → P.leq a b ∨ P.leq b a

def AntichainClosed (P : PartiallyOrderedSet) (A : AntichainPackage P) : Prop :=
  ∀ a b, a ∈ A.antichain → b ∈ A.antichain → a ≠ b → ¬ P.leq a b ∧ ¬ P.leq b a

theorem chain_closed_from_evidence (P : PartiallyOrderedSet) (C : ChainPackage P) (E : ChainEvidence P C) :
    ChainClosed P C := by
  exact E.totalClosed

theorem antichain_closed_from_evidence (P : PartiallyOrderedSet) (A : AntichainPackage P) (E : AntichainEvidence P A) :
    AntichainClosed P A := by
  exact E.incomparableClosed

end CombinatoricsPartiallyOrderedSetsCanonicalLaneLean
end HautevilleHouse