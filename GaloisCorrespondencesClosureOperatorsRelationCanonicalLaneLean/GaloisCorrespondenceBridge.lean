import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean.GaloisConnectionPackage
import HautevilleHouse.GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean.ClosureOperatorPackage

namespace HautevilleHouse
namespace GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean

structure GaloisCorrespondenceBridge {U V : Type u} (G : GaloisConnectionPackage U V) where
  leftClosure : ClosureOperatorPackage U
  rightClosure : ClosureOperatorPackage V
  leftFromConnection : ∀ x : U, leftClosure.cl x = G.right (G.left x)
  rightFromConnection : ∀ a : V, rightClosure.cl a = G.left (G.right a)

def GaloisCorrespondenceBridgeClosed {U V : Type u} {G : GaloisConnectionPackage U V}
    (B : GaloisCorrespondenceBridge G) : Prop :=
  ClosureOperatorClosed (B.leftClosure) ∧ ClosureOperatorClosed (B.rightClosure) ∧
  (∀ x : U, B.leftClosure.cl x = G.right (G.left x)) ∧ (∀ a : V, B.rightClosure.cl a = G.left (G.right a))

structure GaloisCorrespondenceBridgeEvidence {U V : Type u} {G : GaloisConnectionPackage U V}
    (B : GaloisCorrespondenceBridge G) where
  leftClosureClosed : ClosureOperatorClosed (B.leftClosure)
  rightClosureClosed : ClosureOperatorClosed (B.rightClosure)
  leftFromConnectionClosed : ∀ x : U, B.leftClosure.cl x = G.right (G.left x)
  rightFromConnectionClosed : ∀ a : V, B.rightClosure.cl a = G.left (G.right a)

theorem galois_correspondence_bridge_closed_from_evidence
    {U V : Type u} {G : GaloisConnectionPackage U V}
    (B : GaloisCorrespondenceBridge G) (E : GaloisCorrespondenceBridgeEvidence B) :
    GaloisCorrespondenceBridgeClosed B := by
  exact And.intro E.leftClosureClosed (And.intro E.rightClosureClosed
    (And.intro E.leftFromConnectionClosed E.rightFromConnectionClosed))

end GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean
end HautevilleHouse