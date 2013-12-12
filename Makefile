METRIC_SOURCES := $(shell find . -name '*.cr')

conan: conan.cr $(METRIC_SOURCES)
	@crystal conan.cr
