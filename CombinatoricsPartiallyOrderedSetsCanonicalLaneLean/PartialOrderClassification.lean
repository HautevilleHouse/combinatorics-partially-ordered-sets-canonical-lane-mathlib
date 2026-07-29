import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatoricsPartiallyOrderedSetsCanonicalLaneLean

structure PartialOrderPackage where
  carrier : Type u
  le : carrier → carrier → Prop
  refl : ∀ a : carrier, le a a
  antisymm : ∀ a b : carrier, le a b → le b a → a = b
  trans : ∀ a b c : carrier, le a b → le b c → le a c

structure FinitePoset extends PartialOrderPackage where
  finite : Fintype carrier

structure LinearExtension (P : FinitePoset) where
  totalOrder : PartialOrderPackage
  carrier := P.carrier
  le := totalOrder.le
  compatible : ∀ a b : P.carrier, P.le a b → le a b

def linearExtensionClosed (P : FinitePoset) : Prop :=
  Nonempty (LinearExtension P)

theorem finite_poset_linear_extension_exists (P : FinitePoset) : linearExtensionClosed P :=
  by
    apply Nonempty.intro
    refine {
      totalOrder := {
        carrier := P.carrier
        le := λ a b => P.le a b ∨ (a ≠ b ∧ ∃ (c : P.carrier), P.le a c ∧ P.le c b)
        refl := ?_
        antisymm := ?_
        trans := ?_
      }
      compatible := ?_
    }
    · intro a; exact Or.inl (P.refl a)
    · intro a b h1 h2
      sorry
    · intro a b c h1 h2
      sorry
    · intro a b h; exact h

end CombinatoricsPartiallyOrderedSetsCanonicalLaneLean
end HautevilleHouse