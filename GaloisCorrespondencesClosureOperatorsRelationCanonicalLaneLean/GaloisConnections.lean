import GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean.ClosureOperators

namespace HautevilleHouse
namespace GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean

structure GaloisConnection (P Q : Type u) [Preorder P] [Preorder Q] where
  lower : P → Q
  upper : Q → P
  adjunction : ∀ x y, lower x ≤ y ↔ x ≤ upper y

structure GaloisConnectionPackage (P Q : Type u) [Preorder P] [Preorder Q] where
  connection : GaloisConnection P Q
  closureFromLower : ClosureOperator P
  closureFromUpper : ClosureOperator Q
  fixedPointsCorrespondence : Prop

structure GaloisConnectionEvidence {P Q : Type u} [Preorder P] [Preorder Q] (G : GaloisConnectionPackage P Q) where
  fixedPointsCorrespondenceClosed : G.fixedPointsCorrespondence

def GaloisConnectionClosed {P Q : Type u} [Preorder P] [Preorder Q] (G : GaloisConnectionPackage P Q) : Prop :=
  G.fixedPointsCorrespondence

theorem galois_connection_closed_from_evidence {P Q : Type u} [Preorder P] [Preorder Q] (G : GaloisConnectionPackage P Q) (E : GaloisConnectionEvidence G) :
    GaloisConnectionClosed G :=
  E.fixedPointsCorrespondenceClosed

end GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean
end HautevilleHouse