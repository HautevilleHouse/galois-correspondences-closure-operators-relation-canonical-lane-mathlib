import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean

structure GaloisConnection (A B : Type u) [Preorder A] [Preorder B] where
  left : A → B
  right : B → A
  adjunction : ∀ a b, left a ≤ b ↔ a ≤ right b

def GaloisConnectionClosed {A B : Type u} [Preorder A] [Preorder B] (G : GaloisConnection A B) : Prop :=
  G.adjunction

structure GaloisConnectionEvidence {A B : Type u} [Preorder A] [Preorder B] (G : GaloisConnection A B) where
  adjunctionClosed : G.adjunction

theorem galois_connection_closed_from_evidence
  {A B : Type u} [Preorder A] [Preorder B] (G : GaloisConnection A B) (E : GaloisConnectionEvidence G) :
  GaloisConnectionClosed G := by
  exact E.adjunctionClosed

theorem galois_connection_induces_closure_operators
  {A B : Type u} [Preorder A] [Preorder B] (G : GaloisConnection A B) :
  PreorderClosureOperator A × PreorderClosureOperator B := by
  sorry

end GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean
end HautevilleHouse
