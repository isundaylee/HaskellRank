solution: solution.hs
	ghc solution.hs

.PHONY: test0
test0: solution test0.in test0.ans
	@ ./solution < test0.in > test0.out
	../checker/checker.py staircase 0

.PHONY: tests
tests: test0

.PHONY: clean
clean:
	rm -f solution
	rm -f solution.o
	rm -f solution.hi
	rm -f *.out
