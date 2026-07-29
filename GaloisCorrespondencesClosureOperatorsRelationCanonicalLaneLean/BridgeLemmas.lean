import GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  GaloisWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean
end HautevilleHouse