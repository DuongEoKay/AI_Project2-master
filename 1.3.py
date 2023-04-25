import re

class Fact:

    # * Ex: father(steve, leona)
    # * Then: 'father' is self.op
    # *       'steve' and 'leona' are people to be identified

    def __init__(self, factString):
        factString = factString.replace(' ', '').strip('.')
        self.op = factString[:factString.index('(')]
        self.people = factString[factString.index('(') + 1: -1].split(',')

    def __eq__(self, __other):
        if self.op != __other.op:
            return False
        return self.people == __other.people
    
    def __repr__(self):
        return '{}({})'.format(str(self.op),','.join([str(i) for i in self.people]))

    def _op(self):
        return self.op

    def _people(self):
        return self.people


class Rule:
    # * Ex: grandparent(X,Y) :- parent(X,Z), parent(Z,Y).
    
    def __init__(self, ruleString):
        zipping = self.parse_rule(ruleString)
        self.result = zipping.index(0)
        self.conditions = zipping.index(1)
    
    def __repr__(self):
        return '{} => {}'.format(' & '.join([str(i) for i in self.premises]), str(self.result))

    def check_duplicate(self, fact: Fact):
        for i in range(len(self.premises)-1):
            if (self.premises[i] == fact):
                return True
        return False
    
    def parse_rule(self,rule_str):
        # Example: daughter(Person, Parent) :- female(Person), parent(Parent, Person).
        rule_str = rule_str.strip().rstrip('.').replace(' ', '')
        sep_idx = rule_str.find(':-')

        # Get conclusion (lhs) and premises (rhs) seperated by ':-'
        conclusion = Fact(rule_str[: sep_idx])
        premises = []
        list_fact_str = rule_str[sep_idx + 2:].split('),')

        for idx, fact_str in enumerate(list_fact_str):
            if idx != len(list_fact_str) - 1:
                fact_str += ')'
            _fact = Fact(fact_str)
            premises.append(_fact)
        return conclusion,premises

    def TrueOrFalse(self):
        pass
        
class KB:
    def __init__(self):
        self.fact = []
        self.rule = []
    def addFact(self,fact: Fact):
        self.fact.append(fact)
    def getFact(self):
        return self.fact
    def getRule(self):
        return self.rule

knowlegde = KB()

def input(filename:str):
    with open(filename) as file:
        lines = file.readlines()
        for line in lines:
            line = line.strip()
            if not line.startswith('%') and len(line) > 0:
                if not ':-' in line:
                    fact = Fact(line)
                    knowlegde.addFact(fact)
                else:
                    continue


#! main:

input('./AI_Project2/KBEngland.pl')

table = knowlegde.getFact()
for i in table:
    print(i._people())