import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatoricsPartiallyOrderedSetsCanonicalLaneLean

structure MobiusInversionPackage {A : AdmissibleClass} where
  poset : Type u
  leq : poset → poset → Prop
  locallyFinite : Prop
  zetaFunction : poset → poset → ℤ
  mobiusFunction : poset → poset → ℤ
  inversionFormula : ∀ (f g : poset → ℤ), (∀ y, g y = ∑_{x ≤ y} f x) → (∀ x, f x = ∑_{y ≤ x} g y * mobiusFunction y x)

structure MobiusInversionEvidence {A : AdmissibleClass} (M : MobiusInversionPackage A) where
  locallyFiniteClosed : M.locallyFinite
  inversionFormulaClosed : M.inversionFormula

def MobiusInversionClosed {A : AdmissibleClass} (M : MobiusInversionPackage A) : Prop :=
  M.locallyFinite ∧ M.inversionFormula

theorem mobius_inversion_closed_from_evidence {A : AdmissibleClass}
    (M : MobiusInversionPackage A) (E : MobiusInversionEvidence M) :
    MobiusInversionClosed M := by
  exact And.intro E.locallyFiniteClosed E.inversionFormulaClosed

end CombinatoricsPartiallyOrderedSetsCanonicalLaneLean
end HautevilleHouse