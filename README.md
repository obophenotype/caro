## CARO

The ontology is stored in src/ontology/

## Bridge Files

Bridge files to various AOs are here:

 * [bridges/](https://github.com/obophenotype/caro/tree/master/src/ontology/bridges)

## VALIDATION

We have a Jenkins job for each anatomy ontology, see the list below:

 * [check-caro-fbbt](http://build.berkeleybop.org/job/check-caro-fbbt)
 * [check-caro-po](http://build.berkeleybop.org/job/check-caro-po)
 * [check-caro-xao](http://build.berkeleybop.org/job/check-caro-xao)
 * [check-caro-zfa](http://build.berkeleybop.org/job/check-caro-zfa)

These are all grouped here: http://build.berkeleybop.org/view/Anatomy/

If an AO has a red ball it means the combination of CARO, the AO and
bridge axioms is formally incoherent (has unsatisfiable classes). The
list of unsatisfiable classes is visible by clicking on the job and
viewing the 'bridge check' artefact. Scroll to the bottom and look for
'UNSAT's.

To determine the reason:

1. open the relevant [bridge file](https://github.com/obophenotype/caro/tree/master/src/ontology/bridges) in the repository
2. Initiate the reasoner (HermiT recommended for most ontologies)
3. Open the 'Nothing' node in the inferred view
4. Select '?' to see the explanation where it says SubClassOf Nothing

Additional notes: the fbbt check may be less complete, as Elk is used (HermiT is too slow with fbbt)

