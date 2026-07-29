import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean

structure DualityPrincipal (A B : Type u) [Preorder A] [Preorder B] where
  forwardGalois : GaloisCorrespondence A B
  backwardGalois : GaloisCorrespondence B A
  dualClosed : ∀ a : A, forwardGalois.closureA.cl a = backwardGalois.lower (forwardGalois.lower a)

def DualityPrincipalClosed {A B : Type u} [Preorder A] [Preorder B] (D : DualityPrincipal A B) : Prop :=
  ∀ a : A, D.forwardGalois.closureA.cl a = D.backwardGalois.lower (D.forwardGalois.lower a)

end GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean
end HautevilleHouse