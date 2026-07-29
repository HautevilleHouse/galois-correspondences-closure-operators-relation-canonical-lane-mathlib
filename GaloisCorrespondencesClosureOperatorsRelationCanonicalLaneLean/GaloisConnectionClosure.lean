import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean

structure GaloisClosurePackage where
  posetP : Type u
  posetQ : Type v
  lowerAdjoint : posetP → posetQ
  upperAdjoint : posetQ → posetP
  adjunctionProperty : Prop
  closureOperatorOnP : posetP → posetP
  closureOperatorOnQ : posetQ → posetQ
  closureProperties : Prop

structure GaloisClosureEvidence (G : GaloisClosurePackage) where
  adjunctionPropertyClosed : G.adjunctionProperty
  closurePropertiesClosed : G.closureProperties

def GaloisClosureClosed (G : GaloisClosurePackage) : Prop :=
  G.adjunctionProperty ∧ G.closureProperties

theorem galois_closure_closed_from_evidence (G : GaloisClosurePackage)
    (E : GaloisClosureEvidence G) : GaloisClosureClosed G := by
  exact And.intro E.adjunctionPropertyClosed E.closurePropertiesClosed

end GaloisCorrespondencesClosureOperatorsRelationCanonicalLaneLean
end HautevilleHouse
