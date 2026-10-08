CXX := g++
CXXFLAGS := -std=c++17 -Wall -Wextra -pedantic -Iinclude -Itests
BUILD_DIR := build
TEST_TARGET := $(BUILD_DIR)/test_linked_lists

.PHONY: all test clean run

all: $(BUILD_DIR)/test_linked_lists

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)
	
	$(BUILD_DIR)/main: $(BUILD_DIR) $(SRC_DIR)/main.cpp $(SRCS)
	$(CXX) $(CXXFLAGS) $(SRC_DIR)/main.cpp $(SRCS) -o $@

$(TEST_TARGET): $(BUILD_DIR) tests/test_linked_lists.cpp
	$(CXX) $(CXXFLAGS) tests/test_linked_lists.cpp -o $@

	run: $(BUILD_DIR)/main
	./$(BUILD_DIR)/main

test: $(_TARGET)
	./$(TEST_TARGET)


clean: rm -rf $(BUILD_DIR)
