import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatoricsPartiallyOrderedSetsCanonicalLaneLean

structure PosetAdmittedObject where
  underlyingSet : Type u
  partialOrder : underlyingSet → underlyingSet → Prop
  reflexivity : ∀ x, partialOrder x x
  antisymmetry : ∀ x y, partialOrder x y → partialOrder y x → x = y
  transitivity : ∀ x y z, partialOrder x y → partialOrder y z → partialOrder x z
  conclusion : Prop

structure AdmissibleClass where
  object : PosetAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.conclusion ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CombinatoricsPartiallyOrderedSetsCanonicalLaneLean
end HautevilleHouse