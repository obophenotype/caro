OBO= http://purl.obolibrary.org/obo
USECAT= --catalog-xml catalog-v001.xml

all: release/caro.owl

all_ext: all bridge-checks

release/caro.owl: caro.owl
	ontology-release-runner $(USECAT) --skip-release-folder --force  --ignoreLock  --reasoner hermit --no-subsets --simple --asserted --outdir release $<

# ----------------------------------------
# Regenerate imports
# ----------------------------------------
# Uses OWLAPI Module Extraction code

# Type 'make imports/X_import.owl' whenever you wish to refresh the import for an ontology X. This is when:
#
#  1. X has changed and we want to include these changes
#  2. We have added onr or more new IRI from X into caro.owl
#  3. We have removed references to one or more IRIs in X from caro.owl
#
# You should NOT edit these files directly, changes will be overwritten.
#
# If you want to add something to these, edit caro.owl and add an axiom with a IRI from X. You don't need to add any information about X.

# Base URI for local subset imports
CARO_IMPORTS_BASE_URI = $(OBO)/caro

# Ontology dependencies
IMPORTS = caro uberon chebi pr go pco

# Make this target to regenerate ALL
all_imports: $(patsubst %, imports/%_import.owl,$(IMPORTS)) $(patsubst %, imports/%_import.obo,$(IMPORTS))

KEEPRELS = BFO:0000050 BFO:0000051 RO:0002202 immediate_transformation_of

# Create an import module using the OWLAPI module extraction code via OWLTools.
# We use the standard catalog, but rewrite the import to X to be a local mirror of ALL of X.
# After extraction, we further reduce the ontology by creating a "mingraph" (removes all annotations except label) and by 
imports/%_import.owl: caro.owl imports/%_seed.owl mirror/%.owl
	OWLTOOLS_MEMORY=12G owltools  $(USECAT) --map-ontology-iri $(CARO_IMPORTS_BASE_URI)/imports/$*_import.owl mirror/$*.owl $< imports/$*_seed.owl --merge-support-ontologies  --extract-module -s $(OBO)/$*.owl -c --remove-axiom-annotations --make-subset-by-properties $(KEEPRELS)  --remove-annotation-assertions -l -s --set-ontology-id $(CL_IMPORTS_BASE_URI)/$@ -o -f ofn $@

imports/%_import.obo: imports/%_import.owl
	owltools $(USECAT) $< -o -f obo $@

# clone remote ontology locally, perfoming some excision of relations and annotations
mirror/%.owl: 
	owltools $(OBO)/$*.owl --remove-annotation-assertions -l --remove-dangling-annotations  --make-subset-by-properties -f $(KEEPRELS)  -o $@

## ----------------------------------------
## BRIDGES TO OTHER AOS
## ----------------------------------------

REASONER= hermit

bridge-checks: bridge-check-zfa.txt

bridge-check-%.txt: caro.owl bridges/%_bridge.owl
	owltools $(USECAT) bridges/$*_bridge.owl --run-reasoner -r $(REASONER) -u > $@

classic-bridge-check-%.txt: caro.owl
	owltools --catalog-xml catalog-classic.xml bridges/$*_bridge.owl --run-reasoner -r elk -u > $@

classic-merge-bridge-%.owl: caro.owl
	owltools --catalog-xml catalog-classic.xml bridges/$*_bridge.owl --merge-imports-closure -o $@

## TODO: this is currently done in a hacky way via the uberon repo
#bridges/%_bridge.owl:
#	

bridges/uberon_bridge.owl:
	owltools $(OBO)/uberon/bridge/uberon-bridge-to-caro.owl  --add-imports-declarations $(OBO)/uberon.owl $(OBO)/caro.owl // --set-ontology-id $(OBO)/caro/$@ -o $@

