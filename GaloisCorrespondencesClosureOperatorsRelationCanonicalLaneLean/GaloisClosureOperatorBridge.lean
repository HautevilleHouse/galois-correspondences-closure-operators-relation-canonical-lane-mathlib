import GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean

structure GaloisClosureStructure where
  poset : Type u
  preorder : Preorder poset
  closureOperator : poset -> poset
  monotone : Monotone closureOperator
  extensive : forall (x : poset), x ≤ closureOperator x
  idempotent : forall (x : poset), closureOperator (closureOperator x) = closureOperator x

def GaloisClosureClosed (G : GaloisClosureStructure) : Prop :=
  G.monotone ∧ G.extensive ∧ (forall (x : G.poset), G.idempotent x)

structure GaloisCorrespondence where
  leftPoset : Type u
  rightPoset : Type v
  leftPreorder : Preorder leftPoset
  rightPreorder : Preorder rightPoset
  leftOperator : leftPoset -> rightPoset
  rightOperator : rightPoset -> leftPoset
  adjunction : forall (a : leftPoset) (b : rightPoset),
    leftOperator a ≤ b ↔ a ≤ rightOperator b
  closureLeft : leftOperator ∘ rightOperator ∘ leftOperator = leftOperator
  closureRight : rightOperator ∘ leftOperator ∘ rightOperator = rightOperator

structure GaloisCorrespondenceEvidence (G : GaloisCorrespondence) where
  adjunctionClosed : G.adjunction
  closureLeftClosed : G.closureLeft
  closureRightClosed : G.closureRight

def GaloisCorrespondenceClosed (G : GaloisCorrespondence) : Prop :=
  G.adjunction ∧ G.closureLeft ∧ G.closureRight

theorem galois_correspondence_closed_from_evidence (G : GaloisCorrespondence)
    (E : GaloisCorrespondenceEvidence G) : GaloisCorrespondenceClosed G := by
  exact And.intro E.adjunctionClosed (And.intro E.closureLeftClosed E.closureRightClosed)

end GaloisCorrespondenceClosureOperatorsRelationCanonicalLaneLean
end HautevilleHouse