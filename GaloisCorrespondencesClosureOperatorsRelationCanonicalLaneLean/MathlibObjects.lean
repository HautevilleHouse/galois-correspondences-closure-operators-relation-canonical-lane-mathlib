import GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure GaloisSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure GaloisAdmittedObject where
  space : GaloisSpace
  closureOperatorDefined : Prop
  galoisConnectionEstablished : Prop
  fixedPointsIdentified : Prop
  conclusion : closureOperatorDefined ∧ galoisConnectionEstablished ∧ fixedPointsIdentified

structure GaloisEndgameState where
  object : GaloisAdmittedObject

def GaloisWitnessClosed (O : GaloisAdmittedObject) : Prop :=
  O.closureOperatorDefined ∧ O.galoisConnectionEstablished ∧ O.fixedPointsIdentified

end GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean
end HautevilleHouse