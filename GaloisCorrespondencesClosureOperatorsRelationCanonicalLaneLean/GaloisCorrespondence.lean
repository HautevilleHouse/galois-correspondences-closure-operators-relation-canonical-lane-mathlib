import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean

structure GaloisCorrespondence (A B : Type u) [Preorder A] [Preorder B] where
  lower : A → B
  upper : B → A
  closureA : ClosureOperator A
  closureB : ClosureOperator B
  galoisConnection : GaloisConnection A B
  closedElementsA : Set A
  closedElementsB : Set B
  closedA_eq : closedElementsA = {x : A | closureA.cl x = x}
  closedB_eq : closedElementsB = {y : B | closureB.cl y = y}
  correspondence : ∀ a : A, closureA.cl a = upper (lower a) ∧ closureB.cl (lower a) = lower (closureA.cl a)

def GaloisCorrespondenceClosed {A B : Type u} [Preorder A] [Preorder B] (G : GaloisCorrespondence A B) : Prop :=
  (∀ a : A, G.closureA.cl a = G.upper (G.lower a)) ∧
  (∀ a : A, G.closureB.cl (G.lower a) = G.lower (G.closureA.cl a))

end GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean
end HautevilleHouse