CXX = g++
CFLAGS = -Ofast -flto -march=native
LDFLAG = -lm -pthread -lSDL2 -lSDL2_ttf

#Final binary
BIN = muonium

BUILD_DIR = ./build

CPP = $(shell find . -name *.cpp -type f)

OBJ = $(CPP:%.cpp=$(BUILD_DIR)/%.o)

# Gcc/Clang will create these .d files containing dependencies.
DEP = $(OBJ:%.o=%.d)

# Default target named after the binary.
$(BIN) : $(BUILD_DIR)/$(BIN)

#########################
#         BUILD         #
#########################

# Create build directories - same structure as sources.
# Just link all the object files.
$(BUILD_DIR)/$(BIN) : $(OBJ)
	mkdir -p $(@D)
	$(CXX) $(CFLAGS) $(LDFLAG) $^ -o $@

# Include all .d files
-include $(DEP)

# Build target for every single object file.
# The potential dependency on header files is covered
# by calling `-include $(DEP)`.
# The -MMD flags additionaly creates a .d file with
# the same name as the .o file.
$(BUILD_DIR)/%.o : %.cpp
	mkdir -p $(@D)
	$(CXX) $(CFLAGS) $(LDFLAG) -MMD -c $< -o $@

#########################
#         CLEAN         #
#########################

.PHONY: clean

# This should remove all generated files.
clean:
	-rm $(BUILD_DIR)/$(BIN) $(OBJ) $(DEP)