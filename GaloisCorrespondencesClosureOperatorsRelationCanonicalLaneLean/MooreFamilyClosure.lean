import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean.FixedPointClosure

namespace HautevilleHouse
namespace GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean

structure MooreFamilyPackage {P : Type u} (c : P → P) where
  family : Set P
  closureOnFamily : P → P
  familyClosedUnderClosure : Prop
  familyContainsClosureOfAny : Prop
  familyIsClosedUnderInfima : Prop

structure MooreFamilyEvidence {P : Type u} {c : P → P} (M : MooreFamilyPackage c) where
  familyClosedUnderClosureClosed : M.familyClosedUnderClosure
  familyContainsClosureOfAnyClosed : M.familyContainsClosureOfAny
  familyIsClosedUnderInfimaClosed : M.familyIsClosedUnderInfima

def MooreFamilyClosed {P : Type u} {c : P → P} (M : MooreFamilyPackage c) : Prop :=
  M.familyClosedUnderClosure ∧ M.familyContainsClosureOfAny ∧ M.familyIsClosedUnderInfima

theorem moore_family_closed_from_evidence {P : Type u} {c : P → P}
    (M : MooreFamilyPackage c) (E : MooreFamilyEvidence M) : MooreFamilyClosed M := by
  exact And.intro E.familyClosedUnderClosureClosed
    (And.intro E.familyContainsClosureOfAnyClosed E.familyIsClosedUnderInfimaClosed)

end GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean
end HautevilleHouse
