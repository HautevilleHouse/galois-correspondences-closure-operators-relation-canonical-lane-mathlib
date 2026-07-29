import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean

structure FixedPointLattice (P : Type u) [Preorder P] (cl : ClosureOperator P) where
  carrier : Set P
  fixedPointProp : ∀ x : P, x ∈ carrier ↔ cl.cl x = x
  latticeStructure : ClosureSystem P
  carrierEqualsClosedSet : carrier = latticeStructure.carrier

def FixedPointLatticeClosed {P : Type u} [Preorder P] {cl : ClosureOperator P} (F : FixedPointLattice P cl) : Prop :=
  (∀ x : P, x ∈ F.carrier ↔ cl.cl x = x) ∧ F.carrier = F.latticeStructure.carrier

end GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean
end HautevilleHouse