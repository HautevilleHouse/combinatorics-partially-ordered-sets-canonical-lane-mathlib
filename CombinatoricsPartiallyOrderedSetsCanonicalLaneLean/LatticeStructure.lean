import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CombinatoricsPartiallyOrderedSetsCanonicalLaneLean.PosetDefinitions

namespace HautevilleHouse
namespace CombinatoricsPartiallyOrderedSetsCanonicalLaneLean

structure LatticePackage (P : PartiallyOrderedSet) where
  sup : P.carrier → P.carrier → P.carrier
  inf : P.carrier → P.carrier → P.carrier
  supUB : ∀ a b, P.leq a (sup a b) ∧ P.leq b (sup a b)
  infLB : ∀ a b, P.leq (inf a b) a ∧ P.leq (inf a b) b
  supLeast : ∀ a b c, (P.leq a c ∧ P.leq b c) → P.leq (sup a b) c
  infGreatest : ∀ a b c, (P.leq c a ∧ P.leq c b) → P.leq c (inf a b)

structure LatticeEvidence (P : PartiallyOrderedSet) (L : LatticePackage P) where
  supUBClosed : ∀ a b, P.leq a (L.sup a b) ∧ P.leq b (L.sup a b)
  infLBClosed : ∀ a b, P.leq (L.inf a b) a ∧ P.leq (L.inf a b) b
  supLeastClosed : ∀ a b c, (P.leq a c ∧ P.leq b c) → P.leq (L.sup a b) c
  infGreatestClosed : ∀ a b c, (P.leq c a ∧ P.leq c b) → P.leq c (L.inf a b)

def LatticeClosed (P : PartiallyOrderedSet) (L : LatticePackage P) : Prop :=
  (∀ a b, P.leq a (L.sup a b) ∧ P.leq b (L.sup a b)) ∧
  (∀ a b, P.leq (L.inf a b) a ∧ P.leq (L.inf a b) b) ∧
  (∀ a b c, (P.leq a c ∧ P.leq b c) → P.leq (L.sup a b) c) ∧
  (∀ a b c, (P.leq c a ∧ P.leq c b) → P.leq c (L.inf a b))

theorem lattice_closed_from_evidence (P : PartiallyOrderedSet) (L : LatticePackage P) (E : LatticeEvidence P L) :
    LatticeClosed P L := by
  exact And.intro E.supUBClosed (And.intro E.infLBClosed (And.intro E.supLeastClosed E.infGreatestClosed))

end CombinatoricsPartiallyOrderedSetsCanonicalLaneLean
end HautevilleHouse