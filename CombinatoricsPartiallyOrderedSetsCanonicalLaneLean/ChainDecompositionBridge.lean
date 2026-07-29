import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CombinatoricsPartiallyOrderedSetsCanonicalLaneLean.PosetDefinitions

namespace HautevilleHouse
namespace CombinatoricsPartiallyOrderedSetsCanonicalLaneLean

def bridgeClosed (A : PosetAdmittedClass) : Prop :=
  PosetWitnessClosed A.object

theorem bridge_from_admissible_class (A : PosetAdmittedClass) :
    bridgeClosed A := by
  exact A.object.conclusion

def gateClosed (A : PosetAdmittedClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : PosetAdmittedClass) :
    gateClosed A := by
  exact A.gateWitness

end CombinatoricsPartiallyOrderedSetsCanonicalLaneLean
end HautevilleHouse