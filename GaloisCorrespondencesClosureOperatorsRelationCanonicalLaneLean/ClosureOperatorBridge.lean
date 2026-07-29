import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean.GaloisConnectionClosure

namespace HautevilleHouse
namespace GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  GaloisClosureClosed (A.object : GaloisClosurePackage)

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean
end HautevilleHouse
