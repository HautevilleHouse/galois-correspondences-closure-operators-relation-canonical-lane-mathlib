import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean.GaloisConnectionClosure

namespace HautevilleHouse
namespace GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean

structure FixedPointPackage {G : GaloisClosurePackage} (H : G.closureOperatorOnP) where
  fixedPoints : Set (G.posetP)
  closureEquivalence : Prop
  closureIdempotent : Prop
  closureExtensive : Prop
  closureMonotone : Prop

structure FixedPointEvidence {G : GaloisClosurePackage} {H : G.closureOperatorOnP}
    (F : FixedPointPackage H) where
  closureEquivalenceClosed : F.closureEquivalence
  closureIdempotentClosed : F.closureIdempotent
  closureExtensiveClosed : F.closureExtensive
  closureMonotoneClosed : F.closureMonotone

def FixedPointClosed {G : GaloisClosurePackage} {H : G.closureOperatorOnP}
    (F : FixedPointPackage H) : Prop :=
  F.closureEquivalence ∧ F.closureIdempotent ∧ F.closureExtensive ∧ F.closureMonotone

theorem fixed_point_closed_from_evidence {G : GaloisClosurePackage} {H : G.closureOperatorOnP}
    (F : FixedPointPackage H) (E : FixedPointEvidence F) : FixedPointClosed F := by
  exact And.intro E.closureEquivalenceClosed
    (And.intro E.closureIdempotentClosed
      (And.intro E.closureExtensiveClosed E.closureMonotoneClosed))

end GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean
end HautevilleHouse
