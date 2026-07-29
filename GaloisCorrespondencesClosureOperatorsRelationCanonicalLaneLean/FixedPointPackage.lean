import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean.ClosureOperatorPackage

namespace HautevilleHouse
namespace GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean

structure FixedPointPackage {P : Type u} [PartialOrder P] (C : ClosureOperatorPackage P) where
  fixedSet : Set P
  fixedClosure : ∀ x : P, x ∈ fixedSet ↔ C.cl x = x
  closureImage : Set P
  closureImageDefined : closureImage = { x : P | C.cl x ∈ fixedSet }
  fixedSetClosed : fixedSet = { x : P | C.cl x = x }

def FixedPointClosed {P : Type u} [PartialOrder P] {C : ClosureOperatorPackage P}
    (F : FixedPointPackage C) : Prop :=
  (∀ x : P, x ∈ F.fixedSet ↔ C.cl x = x) ∧ F.fixedSet = { x : P | C.cl x = x }

structure FixedPointEvidence {P : Type u} [PartialOrder P] {C : ClosureOperatorPackage P}
    (F : FixedPointPackage C) where
  fixedClosureClosed : ∀ x : P, x ∈ F.fixedSet ↔ C.cl x = x
  fixedSetClosed : F.fixedSet = { x : P | C.cl x = x }

theorem fixed_point_closed_from_evidence
    {P : Type u} [PartialOrder P] {C : ClosureOperatorPackage P}
    (F : FixedPointPackage C) (E : FixedPointEvidence F) : FixedPointClosed F := by
  exact And.intro E.fixedClosureClosed E.fixedSetClosed

end GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean
end HautevilleHouse