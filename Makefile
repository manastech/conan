SOURCES := $(shell find src -name '*.cr')

conan: $(SOURCES)
	@crystal src/conan.cr
