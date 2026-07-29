import GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean.GaloisClosureOperatorBridge

namespace HautevilleHouse
namespace GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean

structure ClosureOperatorsLattice (G : GaloisClosureStructure) where
  closureOperators : Set (G.poset -> G.poset)
  partialOrder : PartialOrder closureOperators
  meetOperator : (G.poset -> G.poset) -> (G.poset -> G.poset) -> (G.poset -> G.poset)
  joinOperator : (G.poset -> G.poset) -> (G.poset -> G.poset) -> (G.poset -> G.poset)
  meetIsClosure : forall f g, f ∈ closureOperators -> g ∈ closureOperators ->
    meetOperator f g ∈ closureOperators
  joinIsClosure : forall f g, f ∈ closureOperators -> g ∈ closureOperators ->
    joinOperator f g ∈ closureOperators

structure ClosureOperatorsLatticeEvidence (L : ClosureOperatorsLattice G) where
  meetIsClosureClosed : forall f g, f ∈ L.closureOperators -> g ∈ L.closureOperators ->
    L.meetOperator f g ∈ L.closureOperators
  joinIsClosureClosed : forall f g, f ∈ L.closureOperators -> g ∈ L.closureOperators ->
    L.joinOperator f g ∈ L.closureOperators

def ClosureOperatorsLatticeClosed (G : GaloisClosureStructure) (L : ClosureOperatorsLattice G) : Prop :=
  L.meetIsClosure ∧ L.joinIsClosure

theorem closure_operators_lattice_closed_from_evidence (G : GaloisClosureStructure)
    (L : ClosureOperatorsLattice G) (E : ClosureOperatorsLatticeEvidence L) :
    ClosureOperatorsLatticeClosed G L := by
  exact And.intro E.meetIsClosureClosed E.joinIsClosureClosed

end GaloisCorrespondenceClosureOperatorsRelationCanonicalLaneLean
end HautevilleHouse