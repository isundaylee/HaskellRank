.PHONY: simple-array-sum-tests
simple-array-sum-tests:
	@echo "Building and testing problem: simple-array-sum"
	@echo
	@make -C simple-array-sum tests

.PHONY: staircase-tests
staircase-tests:
	@echo 'Building and testing problem: staircase'
	@echo
	@make -C staircase tests

.PHONY: divisible-sum-pairs-tests
divisible-sum-pairs-tests:
	@echo 'Building and testing problem: divisible-sum-pairs'
	@echo
	@make -C divisible-sum-pairs tests

.PHONY: picking-numbers-tests
picking-numbers-tests:
	@echo 'Building and testing problem: picking-numbers'
	@echo
	@make -C picking-numbers tests

.PHONY: apple-and-orange-tests
apple-and-orange-tests:
	@echo 'Building and testing problem: apple-and-orange'
	@echo
	@make -C apple-and-orange tests
