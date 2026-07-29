import CombinatoricsPartiallyOrderedSetsCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace CombinatoricsPartiallyOrderedSetsCanonicalLaneLean

structure AdmissibleClass where
  object : PosetAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  PosetWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CombinatoricsPartiallyOrderedSetsCanonicalLaneLean
end HautevilleHouse