import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean

structure GaloisTukeyConnection (A B : Type u) where
  lower : A → B
  upper : B → A

def GaloisTukeyConnectionClosed {A B : Type u} (G : GaloisTukeyConnection A B) : Prop :=
  ∀ (X : Set A) (Y : Set B), (∀ a ∈ X, G.lower a ∈ Y) ↔ (∀ b ∈ Y, G.upper b ∈ X)

end GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean
end HautevilleHouse