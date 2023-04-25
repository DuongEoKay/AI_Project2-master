from ruleNfact import*
import itertools

#! Utils
def inputQuery(Qfilename: str):
    queries = []
    with open(Qfilename) as q:
        lines = q.readlines()
        for line in lines:
            if line.startswith('?-'):
                queries.append(line[line.find('?-')+2:-1])
    return queries

def isVariable(string: str):
    return string == string.capitalize() or string == string.upper()


def isMatched(var_fact: str, fact: Fact):
    temp_fact = Fact(var_fact)
    if fact.negated == temp_fact.negated \
            and fact.op == temp_fact.op:
        for i in range(len(temp_fact._people())):
            if not isVariable(temp_fact._people()[i]) \
               and temp_fact._people()[i] != fact._people()[i]:
                return False
    else:
        return False
    return True

def getFactVariable(fact: Fact):
    variables = []
    for i in fact.getResult()._people():
            if isVariable(i) and not i in variables:
                variables.append(i)

def getRuleVariable(rule: Rule):
    variables = []
    for i in rule.getResult()._people():
            if isVariable(i) and not i in variables:
                variables.append(i)
            for i in rule.getConditions():
                for j in i._people():
                    if isVariable(j) and j not in variables:
                        variables.append(j)
    return variables

def replaceViaDict(string: str, _dict: dict):
    temp = string
    for key in _dict.keys():
                temp = temp.replace(key,_dict.get(key))
    return temp

#*==================================================*#

#! Knowlegde_Base
class Knowlegde_Base:
    def __init__(self):
        self.Facts = []
        self.Rules = []
        self.People = []
        self.Ops = []
        
    def addFact(self,fact: Fact):
        self.Facts.append(fact)
        if (not fact.op in self.Ops):
            self.Ops.append(fact.op)
        for i in fact.people:
            if not i in self.People:
                self.People.append(i)
                
    def addRule(self,rule: Rule):
        self.Rules.append(rule)
                               
    def getFact(self):
        return self.Facts
    
    def getRule(self):
        return self.Rules
                
    def isUnsolvedRule(self, rule: str):
        for i in self.Rules:
            if  isMatched(rule,i.getResult()) and \
            i.solved == False:
                return True
        return False
                                                
    def LookUp(self,query: str):
        result = []
        for i in self.Facts:
            if isMatched(query,i):
                result.append(i)
        return result
       
    def TrueFalse(self,query : str):
        temp_fact = Fact(query)
        if temp_fact._op() == "different" and \
        (temp_fact._people()[0] != temp_fact._people()[1]):
                return True
        return temp_fact in self.Facts
        
    def Try(self,rule: Rule, _dict: dict):
        for fact in rule.getConditions():
            temp_str = str(fact)
            temp_str = replaceViaDict(temp_str,_dict)
            if self.TrueFalse(temp_str):
                return False
        return True
                    
    def SolveRule(self, rule: Rule):
        #* This function use Backward Reasoning to sovle all rules
        #* then add their solutions to self.Facts
        if rule.solved == True: #! pass if rule is solved
            pass 
            
        for i in rule.getConditions():
            if self.isUnsolvedRule(str(i)): #! if a condition of this rule is also a rule and it is unsolved => SOLVE IT!
                self.SolveRule(i) 
            #! solve the rule with backward reasoning
            variables = getRuleVariable(rule)
            for permu in itertools.permutations(self.People,len(variables)):
                new_dict = {}
                
                for i in range(len(variables)):
                    new_dict[variables[i]] = permu[i]
                
                if self.Try(rule,new_dict):
                    temp_str = str(rule.getResult())
                    temp_str = replaceViaDict(temp_str,new_dict)
                    new_fact = Fact(temp_str)
                    if not self.TrueFalse(str(new_fact)):
                        self.addFact(new_fact)
                        #print(str(new_fact))
        rule.Solved()
    
    def SolveAllRules(self):
        print(f"Total rules: {len(self.Rules)}")
        for i in self.Rules:
            print(f"solving rule: {str(i)}")
            self.SolveRule(i)

            
    