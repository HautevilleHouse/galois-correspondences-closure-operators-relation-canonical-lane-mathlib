import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean

structure ClosureOperator (P : Type u) [Preorder P] where
  cl : P → P
  monotone : ∀ x y : P, x ≤ y → cl x ≤ cl y
  extensive : ∀ x : P, x ≤ cl x
  idempotent : ∀ x : P, cl (cl x) = cl x

def ClosureOperatorClosed {P : Type u} [Preorder P] (C : ClosureOperator P) : Prop :=
  (∀ x y : P, x ≤ y → C.cl x ≤ C.cl y) ∧
  (∀ x : P, x ≤ C.cl x) ∧
  (∀ x : P, C.cl (C.cl x) = C.cl x)

structure GaloisConnection (A B : Type u) [Preorder A] [Preorder B] where
  lower : A → B
  upper : B → A
  adjunction : ∀ a : A, ∀ b : B, lower a ≤ b ↔ a ≤ upper b

def GaloisConnectionClosed {A B : Type u} [Preorder A] [Preorder B] (G : GaloisConnection A B) : Prop :=
  ∀ a : A, ∀ b : B, G.lower a ≤ b ↔ a ≤ G.upper b

end GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean
end HautevilleHouse