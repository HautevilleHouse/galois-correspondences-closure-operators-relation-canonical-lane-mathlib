import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean

structure ClosureSystem (P : Type u) [Preorder P] where
  carrier : Set P
  closedUnderInf : ∀ (S : Set P), S ⊆ carrier → ∃ inf : P, (∀ x ∈ S, inf ≤ x) ∧ (∀ y : P, (∀ x ∈ S, y ≤ x) → y ≤ inf) ∧ inf ∈ carrier
  closedUnderSup : ∀ (S : Set P), S ⊆ carrier → ∃ sup : P, (∀ x ∈ S, x ≤ sup) ∧ (∀ y : P, (∀ x ∈ S, x ≤ y) → sup ≤ y) ∧ sup ∈ carrier

def ClosureSystemClosed {P : Type u} [Preorder P] (C : ClosureSystem P) : Prop :=
  (∀ (S : Set P), S ⊆ C.carrier → ∃ inf : P, (∀ x ∈ S, inf ≤ x) ∧ (∀ y : P, (∀ x ∈ S, y ≤ x) → y ≤ inf) ∧ inf ∈ C.carrier) ∧
  (∀ (S : Set P), S ⊆ C.carrier → ∃ sup : P, (∀ x ∈ S, x ≤ sup) ∧ (∀ y : P, (∀ x ∈ S, x ≤ y) → sup ≤ y) ∧ sup ∈ C.carrier)

end GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean
end HautevilleHouse