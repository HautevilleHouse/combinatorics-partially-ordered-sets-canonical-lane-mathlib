import canonicalLaneMathlib.AdmissibleClass
import CombinatoricsPartiallyOrderedSetsCanonicalLaneLean.BasicDefinitions

namespace HautevilleHouse
namespace CombinatoricsPartiallyOrderedSetsCanonicalLaneLean

structure LinearExtensionPackage (P : Poset) where
  totalOrderExtension : Prop
  numberOfExtensions : Prop
  totalOrderExtensionClosed : totalOrderExtension
  numberOfExtensionsClosed : numberOfExtensions

structure LinearExtensionEvidence (P : Poset) (L : LinearExtensionPackage P) where
  totalOrderExtensionClosed : L.totalOrderExtension
  numberOfExtensionsClosed : L.numberOfExtensions

def LinearExtensionClosed (P : Poset) (L : LinearExtensionPackage P) : Prop :=
  L.totalOrderExtension ∧ L.numberOfExtensions

theorem linear_extension_closed_from_evidence (P : Poset) (L : LinearExtensionPackage P) (E : LinearExtensionEvidence P L) : LinearExtensionClosed P L := by
  exact And.intro E.totalOrderExtensionClosed E.numberOfExtensionsClosed

end CombinatoricsPartiallyOrderedSetsCanonicalLaneLean
end HautevilleHouse