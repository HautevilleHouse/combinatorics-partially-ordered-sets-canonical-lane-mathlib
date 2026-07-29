import canonicalLaneMathlib.AdmissibleClass
import CombinatoricsPartiallyOrderedSetsCanonicalLaneLean.BasicDefinitions

namespace HautevilleHouse
namespace CombinatoricsPartiallyOrderedSetsCanonicalLaneLean

structure SpernerPackage (P : Poset) where
  symmetricChainDecomposition : Prop
  largestAntichainSize : Prop
  symmetricChainDecompositionClosed : symmetricChainDecomposition
  largestAntichainSizeClosed : largestAntichainSize

structure SpernerEvidence (P : Poset) (S : SpernerPackage P) where
  symmetricChainDecompositionClosed : S.symmetricChainDecomposition
  largestAntichainSizeClosed : S.largestAntichainSize

def SpernerClosed (P : Poset) (S : SpernerPackage P) : Prop :=
  S.symmetricChainDecomposition ∧ S.largestAntichainSize

theorem sperner_closed_from_evidence (P : Poset) (S : SpernerPackage P) (E : SpernerEvidence P S) : SpernerClosed P S := by
  exact And.intro E.symmetricChainDecompositionClosed E.largestAntichainSizeClosed

end CombinatoricsPartiallyOrderedSetsCanonicalLaneLean
end HautevilleHouse