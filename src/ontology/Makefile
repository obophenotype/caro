USECAT= --catalog-xml catalog-v001.xml

all: release/caro.owl


release/caro.owl: caro.owl
	ontology-release-runner $(USECAT)  --ignoreLock  --reasoner hermit --outdir release $<
