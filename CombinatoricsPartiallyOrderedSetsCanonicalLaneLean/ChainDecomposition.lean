import canonicalLaneMathlib.AdmissibleClass
import CombinatoricsPartiallyOrderedSetsCanonicalLaneLean.PosetAdmissibleClass

namespace HautevilleHouse
namespace CombinatoricsPartiallyOrderedSetsCanonicalLaneLean

structure ChainDecompositionPackage where
  height : ℕ
  chainDecomposition : List (List (AdmissibleClass.object.underlyingSet))
  chainDecompositionProperties : Prop
  heightDefined : height = Finset.card (Finset.filter (λ x => True) (Finset.univ : Finset (AdmissibleClass.object.underlyingSet)))
  chainDecompositionPropertiesProof : chainDecompositionProperties

structure ChainDecompositionEvidence (D : ChainDecompositionPackage) where
  chainDecompositionPropertiesClosed : D.chainDecompositionProperties

def ChainDecompositionClosed (D : ChainDecompositionPackage) : Prop :=
  D.chainDecompositionProperties

theorem chain_decomposition_closed_from_evidence (D : ChainDecompositionPackage) (E : ChainDecompositionEvidence D) :
    ChainDecompositionClosed D := by
  exact E.chainDecompositionPropertiesClosed

end CombinatoricsPartiallyOrderedSetsCanonicalLaneLean
end HautevilleHouse