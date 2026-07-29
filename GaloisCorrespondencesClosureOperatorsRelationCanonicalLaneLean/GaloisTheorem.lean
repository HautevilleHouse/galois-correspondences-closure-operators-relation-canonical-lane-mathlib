import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean.GaloisConnectionClosure
import HautevilleHouse.GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean.ClosureOperatorBridge

namespace HautevilleHouse
namespace GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean

def ConstrainedGaloisClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_galois_endgame (A : AdmissibleClass) :
    ConstrainedGaloisClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean
end HautevilleHouse
