import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CombinatoricsPartiallyOrderedSetsCanonicalLaneLean.ChainDecompositionBridge

namespace HautevilleHouse
namespace CombinatoricsPartiallyOrderedSetsCanonicalLaneLean

def ConstrainedPosetClosure (A : PosetAdmittedClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_poset_endgame (A : PosetAdmittedClass) :
    ConstrainedPosetClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CombinatoricsPartiallyOrderedSetsCanonicalLaneLean
end HautevilleHouse