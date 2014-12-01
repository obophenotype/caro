## THIS IS A TEMP MAKEFILE for syncing with old svn repo

OLDCAT= --catalog-xml caro2/catalog-v001.xml

all: caro.owl caro-with-annotations.owl all_imports release/caro.owl

caro.owl: caro2/caro_2.owl
	owltools $(OLDCAT) $< -o -f ofn $@ && fix.pl $@

caro-with-annotations.owl: caro2/caro_2-dev.owl
	owltools $(OLDCAT) $< -o -f ofn $@ && fix.pl $@

caro_bridge.owl: caro2/CARO_bridge.owl
	owltools $(OLDCAT) $< -o -f ofn $@ && fix.pl $@

all_imports: imports/cl_import.owl imports/chebi_import.owl imports/ncbitaxon_import.owl imports/pco_import.owl imports/pato_import.owl imports/ro_import.owl imports/go_import.owl


imports/cl_import.owl: caro2/imports/CL_import.owl
	owltools $(OLDCAT) $< -o -f ofn $@ && fix.pl $@
imports/chebi_import.owl: caro2/imports/CHEBI_import.owl
	owltools $(OLDCAT) $< -o -f ofn $@ && fix.pl $@
imports/ncbitaxon_import.owl: caro2/imports/NCBITaxon_imports.owl
	owltools $(OLDCAT) $< -o -f ofn $@ && fix.pl $@
imports/go_import.owl: caro2/imports/GO_imports.owl
	owltools $(OLDCAT) $< -o -f ofn $@ && fix.pl $@
imports/pco_import.owl: caro2/imports/PCO_imports.owl
	owltools $(OLDCAT) $< -o -f ofn $@ && fix.pl $@
imports/pato_import.owl: caro2/imports/PATO_import.owl
	owltools $(OLDCAT) $< -o -f ofn $@ && fix.pl $@
imports/ro_import.owl: caro2/imports/RO_imports.owl
	owltools $(OLDCAT) $< -o -f ofn $@ && fix.pl $@

release/caro.owl: caro.owl
	ontology-release-runner --catalog-xml catalog-v001.xml --reasoner hermit --outdir release $<
