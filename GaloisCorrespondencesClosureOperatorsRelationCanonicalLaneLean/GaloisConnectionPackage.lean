import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean

structure GaloisConnectionPackage (U V : Type u) where
  left : U → V
  right : V → U
  monotoneLeft : ∀ x y : U, (x ≤ y) → left x ≤ left y
  monotoneRight : ∀ a b : V, (a ≤ b) → right a ≤ right b
  adjunction : ∀ x : U, ∀ a : V, left x ≤ a ↔ x ≤ right a

def GaloisConnectionClosed {U V : Type u} (G : GaloisConnectionPackage U V) : Prop :=
  G.monotoneLeft ∧ G.monotoneRight ∧ G.adjunction

structure GaloisConnectionEvidence {U V : Type u} (G : GaloisConnectionPackage U V) where
  monotoneLeftClosed : G.monotoneLeft
  monotoneRightClosed : G.monotoneRight
  adjunctionClosed : G.adjunction

theorem galois_connection_closed_from_evidence
    {U V : Type u} (G : GaloisConnectionPackage U V) (E : GaloisConnectionEvidence G) :
    GaloisConnectionClosed G := by
  exact And.intro E.monotoneLeftClosed (And.intro E.monotoneRightClosed E.adjunctionClosed)

end GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean
end HautevilleHouse