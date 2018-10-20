solution: solution.hs
	ghc solution.hs
	
.PHONY: test1
test1: solution test1.in test1.ans
	@ ./solution < test1.in > test1.out
	@diff -w test1.out test1.ans || (echo "Test 1: FAILED") && (echo "Test 1: PASSED")
	
.PHONY: tests
tests: test1
	
.PHONY: clean
clean: 
	rm -f solution
	rm -f solution.o
	rm -f solution.hi
