#!/usr/local/bin/python3

import os
import sys

from pathlib import Path

HACKERRANK_ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

problem = sys.argv[1]
case = int(sys.argv[2])

expected = Path(os.path.join(HACKERRANK_ROOT, problem, "test{}.ans".format(case))).read_text()
actual = Path(os.path.join(HACKERRANK_ROOT, problem, "test{}.out".format(case))).read_text()
err = Path(os.path.join(HACKERRANK_ROOT, problem, "test{}.err".format(case))).read_text()

def indent(text, spaces):
    return '\n'.join(map(lambda line: (" " * spaces) + line, text.split("\n")))

if expected.strip() == actual.strip():
    print('Test {}: PASSED'.format(case))
    exit(0)
else:
    print('Test {}: FAILED'.format(case))
    print()
    print('  Expected: ')
    print()
    print(indent(expected, 4))
    print('  Actual: ')
    print()
    print(indent(actual, 4))
    print()
    print('  Debug: ')
    print()
    print(indent(err, 4))
    exit(1)
