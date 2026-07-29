import GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean

structure AdmissibleClass where
  object : GaloisAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  GaloisWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean
end HautevilleHouse