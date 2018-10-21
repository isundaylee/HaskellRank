solution: solution.hs
	ghc solution.hs

.PHONY: test0
test0: solution test0.in test0.ans
	@ ./solution <test0.in >test0.out 2>test0.err
	@../checker/checker.py picking-numbers 0

.PHONY: test1
test1: solution test1.in test1.ans
	@ ./solution <test1.in >test1.out 2>test1.err
	@../checker/checker.py picking-numbers 1

.PHONY: tests
tests: test0 test1

.PHONY: clean
clean:
	rm -f solution
	rm -f solution.o
	rm -f solution.hi
	rm -f *.out
	rm -f *.err
