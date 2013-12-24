SOURCES := $(shell find src -name '*.cr')
SPECS := $(shell find spec -name '*.cr')

conan: $(SOURCES)
	@crystal src/conan.cr

spec: all_metrics_spec
	@./all_metrics_spec

all_metrics_spec: $(SOURCES) $(SPECS)
	@crystal spec/all_metrics_spec.cr

