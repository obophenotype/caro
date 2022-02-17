## Customize Makefile settings for caro
## 
## If you need to customize your Makefile, make
## changes here rather than in the main Makefile

BFO_CLASSES_ONLY_URL = "https://raw.githubusercontent.com/BFO-ontology/BFO/master/bfo_classes_only.owl"
$(COMPONENTSDIR)/bfo_classes_only.owl: $(SRC)
	$(ROBOT) annotate -I $(BFO_CLASSES_ONLY_URL) --ontology-iri $(ONTBASE)/$@ -o $@