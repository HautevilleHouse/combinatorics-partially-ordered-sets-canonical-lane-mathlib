import canonicalLaneMathlib.AdmissibleClass
import CombinatoricsPartiallyOrderedSetsCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace CombinatoricsPartiallyOrderedSetsCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end CombinatoricsPartiallyOrderedSetsCanonicalLaneLean
end HautevilleHouse