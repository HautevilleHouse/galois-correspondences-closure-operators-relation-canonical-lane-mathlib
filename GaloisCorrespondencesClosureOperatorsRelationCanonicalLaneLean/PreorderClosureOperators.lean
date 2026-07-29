import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean

structure PreorderClosureOperator (P : Type u) [Preorder P] where
  cl : P → P
  monotone : ∀ x y : P, x ≤ y → cl x ≤ cl y
  extensive : ∀ x : P, x ≤ cl x
  idempotent : ∀ x : P, cl (cl x) = cl x

def PreorderClosureOperatorClosed {P : Type u} [Preorder P] (C : PreorderClosureOperator P) : Prop :=
  C.monotone ∧ C.extensive ∧ C.idempotent

structure PreorderClosureOperatorEvidence {P : Type u} [Preorder P] (C : PreorderClosureOperator P) where
  monotoneClosed : C.monotone
  extensiveClosed : C.extensive
  idempotentClosed : C.idempotent

theorem preorder_closure_operator_closed_from_evidence
  {P : Type u} [Preorder P] (C : PreorderClosureOperator P) (E : PreorderClosureOperatorEvidence C) :
  PreorderClosureOperatorClosed C := by
  exact And.intro E.monotoneClosed (And.intro E.extensiveClosed E.idempotentClosed)

end GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean
end HautevilleHouse
