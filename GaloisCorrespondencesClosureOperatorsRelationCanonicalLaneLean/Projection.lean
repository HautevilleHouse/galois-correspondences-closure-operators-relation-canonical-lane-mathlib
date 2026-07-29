import GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

def galoisProjection : Projection GaloisEndgameState := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem galois_projection_idempotent (x : GaloisEndgameState) :
    galoisProjection.toFun (galoisProjection.toFun x) = galoisProjection.toFun x := by
  exact galoisProjection.idempotent x

end GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean
end HautevilleHouse