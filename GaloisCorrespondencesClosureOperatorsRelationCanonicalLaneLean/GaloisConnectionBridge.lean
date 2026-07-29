import GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean.ClosureOperatorLattice

namespace HautevilleHouse
namespace GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean

structure GaloisConnection where
  A : Type u
  B : Type v
  preorderA : Preorder A
  preorderB : Preorder B
  f : A -> B
  g : B -> A
  galoisProperty : forall (a : A) (b : B), f a ≤ b ↔ a ≤ g b
  closureA : A -> A := g ∘ f
  closureB : B -> B := f ∘ g
  closureAIsClosure : forall a : A, closureA (closureA a) = closureA a
  closureBIsClosure : forall b : B, closureB (closureB b) = closureB b
  monotoneF : Monotone f
  monotoneG : Monotone g

structure GaloisConnectionEvidence (GC : GaloisConnection) where
  galoisPropertyClosed : GC.galoisProperty
  closureAIsClosureClosed : GC.closureAIsClosure
  closureBIsClosureClosed : GC.closureBIsClosure
  monotoneFClosed : GC.monotoneF
  monotoneGClosed : GC.monotoneG

def GaloisConnectionClosed (GC : GaloisConnection) : Prop :=
  GC.galoisProperty ∧ GC.closureAIsClosure ∧ GC.closureBIsClosure ∧
  GC.monotoneF ∧ GC.monotoneG

theorem galois_connection_closed_from_evidence (GC : GaloisConnection)
    (E : GaloisConnectionEvidence GC) : GaloisConnectionClosed GC := by
  exact And.intro E.galoisPropertyClosed
    (And.intro E.closureAIsClosureClosed
      (And.intro E.closureBIsClosureClosed
        (And.intro E.monotoneFClosed E.monotoneGClosed)))

end GaloisCorrespondenceClosureOperatorsRelationCanonicalLaneLean
end HautevilleHouse