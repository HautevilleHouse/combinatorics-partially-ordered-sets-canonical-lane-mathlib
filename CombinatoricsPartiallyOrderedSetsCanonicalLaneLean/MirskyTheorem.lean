import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CombinatoricsPartiallyOrderedSetsCanonicalLaneLean.PosetDefinitions
import HautevilleHouse.CombinatoricsPartiallyOrderedSetsCanonicalLaneLean.ChainAntichain

namespace HautevilleHouse
namespace CombinatoricsPartiallyOrderedSetsCanonicalLaneLean

structure MirskyPackage (P : PartiallyOrderedSet) where
  minAntichainCover : ℕ
  maxChainSize : ℕ
  equalityCond : minAntichainCover = maxChainSize

structure MirskyEvidence (P : PartiallyOrderedSet) (M : MirskyPackage P) where
  equalityClosed : M.minAntichainCover = M.maxChainSize

def MirskyClosed (P : PartiallyOrderedSet) (M : MirskyPackage P) : Prop :=
  M.minAntichainCover = M.maxChainSize

theorem mirsky_closed_from_evidence (P : PartiallyOrderedSet) (M : MirskyPackage P) (E : MirskyEvidence P M) :
    MirskyClosed P M := by
  exact E.equalityClosed

end CombinatoricsPartiallyOrderedSetsCanonicalLaneLean
end HautevilleHouse