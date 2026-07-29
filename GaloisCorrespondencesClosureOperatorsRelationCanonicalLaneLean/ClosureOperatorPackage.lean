import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean

structure ClosureOperatorPackage (P : Type u) [PartialOrder P] where
  cl : P → P
  monotone : ∀ x y : P, x ≤ y → cl x ≤ cl y
  extensive : ∀ x : P, x ≤ cl x
  idempotent : ∀ x : P, cl (cl x) = cl x

def ClosureOperatorClosed {P : Type u} [PartialOrder P] (C : ClosureOperatorPackage P) : Prop :=
  C.monotone ∧ C.extensive ∧ C.idempotent

structure ClosureOperatorEvidence {P : Type u} [PartialOrder P] (C : ClosureOperatorPackage P) where
  monotoneClosed : C.monotone
  extensiveClosed : C.extensive
  idempotentClosed : C.idempotent

theorem closure_operator_closed_from_evidence
    {P : Type u} [PartialOrder P] (C : ClosureOperatorPackage P) (E : ClosureOperatorEvidence C) :
    ClosureOperatorClosed C := by
  exact And.intro E.monotoneClosed (And.intro E.extensiveClosed E.idempotentClosed)

end GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean
end HautevilleHouse