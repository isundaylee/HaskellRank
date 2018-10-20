#!/usr/local/bin/python3

import os
import sys 

from pyquery import PyQuery as pq

from urllib.request import urlopen

HACKERRANK_ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

problem = sys.argv[1]
num_cases = 1
if len(sys.argv) >= 3:
    num_cases = int(sys.argv[2])
    
def generate_makefile(problem, num_cases, out_path):
    lines = [
        "solution: solution.hs",
        "\tghc solution.hs",
    ]
    
    for i in range(num_cases):
        lines.extend([
            "",
            ".PHONY: test{}".format(i),
            "test{}: solution test{}.in test{}.ans".format(i, i, i),
	        "\t@ ./solution < test{}.in > test{}.out".format(i, i),
            "\t../checker/checker.py {} {}".format(problem, i),
        ])
        
    lines.append("")
    lines.append(".PHONY: tests")
    lines.append("tests: {}".format(' '.join(map(lambda i: "test{}".format(i), range(num_cases)))))
    
    lines.append("")
    lines.append(".PHONY: clean")
    lines.append("clean:")
    lines.append("\trm -f solution")
    lines.append("\trm -f solution.o")
    lines.append("\trm -f solution.hi")
    lines.append("\trm -f *.out")
    lines.append("")
        
    with open(out_path, 'w') as f:
        f.write("\n".join(lines))

def download_problem(problem, num_cases, out_path):
    if os.path.exists(out_path):
        print('{} already exists. Skipping...'.format(out_path))
        return
        
    # content = urlopen("https://www.hackerrank.com/challenges/{}/problem".format(problem)).read().decode('utf-8')
    # doc = pq(content)
    
    os.mkdir(out_path)
    generate_makefile(problem, num_cases, os.path.join(out_path, "makefile"))
    
    for i in range(num_cases):
        with open(os.path.join(out_path, "test{}.in".format(i)), 'w') as f:
            pass
        with open(os.path.join(out_path, "test{}.ans".format(i)), 'w') as f:
            pass
            
    with open(os.path.join(out_path, "solution.hs"), 'w') as f:
        pass
    
def append_to_makefile(problem, out_path):
    with open(out_path) as f:
        if "{}-tests".format(problem) in f.read():
            print('{} already exists in the master makefile. Skipping...'.format(problem))
            return
            
    with open(out_path, 'a') as f:
        f.write("\n")
        f.write(".PHONY: {}-tests\n".format(problem))
        f.write("{}-tests:\n".format(problem))
        f.write("\t@echo 'Building and testing problem: {}'\n".format(problem))
        f.write("\t@echo\n")
        f.write("\t@make -C {} tests\n".format(problem))
    
download_problem(problem, num_cases, os.path.join(HACKERRANK_ROOT, problem))
append_to_makefile(problem, os.path.join(HACKERRANK_ROOT, "makefile"))
