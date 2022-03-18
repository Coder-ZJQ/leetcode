
class Bank {
    var balance: [Int]
    init(_ balance: [Int]) {
        self.balance = balance
    }
    
    func transfer(_ account1: Int, _ account2: Int, _ money: Int) -> Bool {
        if account2 <= balance.count && withdraw(account1, money) {
            deposit(account2, money)
            return true
        }
        return false
    }
    
    func deposit(_ account: Int, _ money: Int) -> Bool {
        guard account <= balance.count else { return false }
        balance[account - 1] += money
        return true
    }
    
    func withdraw(_ account: Int, _ money: Int) -> Bool {
        guard account <= balance.count && balance[account - 1] >= money else { return false }
        balance[account - 1] -= money
        return true
    }
}

/**
 * Your Bank object will be instantiated and called as such:
 * let obj = Bank(balance)
 * let ret_1: Bool = obj.transfer(account1, account2, money)
 * let ret_2: Bool = obj.deposit(account, money)
 * let ret_3: Bool = obj.withdraw(account, money)
 */