OBO= http://purl.obolibrary.org/obo/
USECAT= --catalog-xml catalog-v001.xml

all: release/caro.owl

all_ext: all bridge-checks

release/caro.owl: caro.owl
	ontology-release-runner $(USECAT) --skip-release-folder  --ignoreLock  --reasoner hermit --no-subsets --simple --asserted --outdir release $<

## ----------------------------------------
## BRIDGES TO OTHER AOS
## ----------------------------------------

bridge-checks: bridge-check-zfa.txt

bridge-check-%.txt: caro.owl
	owltools $(USECAT) bridges/$*_bridge.owl --run-reasoner -r hermit -u > $@
classic-bridge-check-%.txt: caro.owl
	owltools --catalog-xml catalog-classic.xml bridges/$*_bridge.owl --run-reasoner -r elk -u > $@

classic-merge-bridge-%.owl: caro.owl
	owltools --catalog-xml catalog-classic.xml bridges/$*_bridge.owl --merge-imports-closure -o $@

## TODO: this is currently done in a hacky way via the uberon repo
#bridges/%_bridge.owl:
#	

bridges/uberon_bridge.owl:
	owltools $(OBO)/uberon/bridge/uberon-bridge-to-caro.owl  --add-imports-declarations $(OBO)/uberon.owl $(OBO)/caro.owl // --set-ontology-id $(OBO)/caro/$@ -o $@

