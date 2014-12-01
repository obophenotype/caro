USECAT= --catalog-xml catalog-v001.xml

all: release/caro.owl

all_ext: all bridge-checks

release/caro.owl: caro.owl
	ontology-release-runner $(USECAT) --skip-release-folder  --ignoreLock  --reasoner hermit --no-subsets --simple --asserted --outdir release $<

bridge-checks: bridge-check-zfa.txt

bridge-check-%.txt:
	owltools --use-catalog bridges/$*_bridge.owl --run-reasoner -r hermit -u > $@
