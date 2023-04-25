from ruleNfact import* 
from knowledgebase import*

global knowlegde

knowlegde = Knowlegde_Base()

def load_Knowlegde_Base(filename:str):
      with open(filename) as file:
        lines = file.readlines()
        for line in lines:
            line = line.strip()
            if  not line.startswith('%') and len(line) > 0 \
            and not line.startswith('not') \
            and not line.startswith('different'):
                if not ':-' in line:
                    fact = Fact(line)
                    knowlegde.addFact(fact)
                else:
                    rule = Rule(line)
                    knowlegde.addRule(rule)




#! main function:

load_Knowlegde_Base('test.pl')

knowlegde.SolveAllRules()

print(knowlegde.getFact())