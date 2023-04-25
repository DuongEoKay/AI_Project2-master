class Fact:

    # * Ex: father(steve, leona)
    # * Then: 'father' is self.op
    # *       'steve' and 'leona' are people to be identified

    def __init__(self, factString: str):  
        _factString = factString.replace(' ', '').strip('.')
        self.negated = False
        self.op = _factString[:_factString.index('(')]
        _factString = _factString[_factString.index('(') + 1: -1]
        if (self.op.upper() == 'NOT'):
            self.negated = True
            self.op = _factString[:_factString.index('(')]
            _factString = _factString[_factString.index('(') + 1: -1]
        self.people = _factString.split(',')

    def __eq__(self, __other):
        if self.op != __other.op:
            return False
        if self.negated != __other.negated:
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
        self.result, self.conditions = zipping
        self.solved = False
    
    def __repr__(self):
        return '{} => {}'.format(' & '.join([str(i) for i in self.conditions]), str(self.result))

    def check_duplicate(self, fact: Fact):
        for i in range(len(self.premises)-1):
            if (self.premises[i] == fact):
                return True
        return False
    
    def getResult(self):
        return self.result
    
    def getConditions(self):
        return self.conditions
    
    def Solved(self):
        self.solved = True
    
    def parse_rule(self,rule_str):
        
        # Ex: daughter(Person, Parent) :- female(Person), parent(Parent, Person).
        rule_str = rule_str.strip().rstrip('.').replace(' ', '')
        sep_idx = rule_str.find(':-')
        
        # Get result and conditions seperated by ':-'
        result = Fact(rule_str[: sep_idx])
        conditions = []
        
        list_fact_str = rule_str[sep_idx + 2:].split('),')
        for idx, fact_str in enumerate(list_fact_str):
            if idx != len(list_fact_str) - 1:
                fact_str += ')'
            _fact = Fact(fact_str)
            conditions.append(_fact)
        return result,conditions        
        