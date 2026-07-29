import GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean.GaloisConnections

namespace HautevilleHouse
namespace GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean

structure ClosureOperator (P : Type u) [Preorder P] where
  cl : P → P
  monotone : ∀ x y, x ≤ y → cl x ≤ cl y
  extensive : ∀ x, x ≤ cl x
  idempotent : ∀ x, cl (cl x) = cl x

structure ClosureOperatorPackage (P : Type u) [Preorder P] where
  operator : ClosureOperator P
  fixedPointsFormSubposet : Prop
  kernelOperator : Prop
  galoisConnectionDerived : Prop

structure ClosureOperatorEvidence {P : Type u} [Preorder P] (C : ClosureOperatorPackage P) where
  fixedPointsFormSubposetClosed : C.fixedPointsFormSubposet
  kernelOperatorClosed : C.kernelOperator
  galoisConnectionDerivedClosed : C.galoisConnectionDerived

def ClosureOperatorClosed {P : Type u} [Preorder P] (C : ClosureOperatorPackage P) : Prop :=
  C.fixedPointsFormSubposet ∧ C.kernelOperator ∧ C.galoisConnectionDerived

theorem closure_operator_closed_from_evidence {P : Type u} [Preorder P] (C : ClosureOperatorPackage P) (E : ClosureOperatorEvidence C) :
    ClosureOperatorClosed C := by
  exact And.intro E.fixedPointsFormSubposetClosed (And.intro E.kernelOperatorClosed E.galoisConnectionDerivedClosed)

end GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean
end HautevilleHouse