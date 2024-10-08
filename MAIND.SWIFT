import Foundation

// Capacidade inicial
let INITIAL_CAPACITY = 10

// Estrutura para o plano de investimento
struct InvestmentPlan {
    var planName: String
    var initialInvestment: Int
    var monthlyReturn: Int
    var annualReturn: Int
    var netAnnualReturn: Int
    var slots: Int
}

// Gerenciador de planos de investimento
class InvestmentPlanManager {
    var plans: [InvestmentPlan]
    var count: Int
    var capacity: Int

    init() {
        self.count = 0
        self.capacity = INITIAL_CAPACITY
        self.plans = Array(repeating: InvestmentPlan(planName: "", initialInvestment: 0, monthlyReturn: 0, annualReturn: 0, netAnnualReturn: 0, slots: 0), count: capacity)
    }

    // Função para adicionar um plano de investimento
    func addInvestmentPlan(planName: String, initialInvestment: Int, monthlyReturn: Int, annualReturn: Int, netAnnualReturn: Int, slots: Int) {
        // Verifica se é necessário aumentar a capacidade
        if count >= capacity {
            capacity *= 2 // Dobra a capacidade
            plans += Array(repeating: InvestmentPlan(planName: "", initialInvestment: 0, monthlyReturn: 0, annualReturn: 0, netAnnualReturn: 0, slots: 0), count: capacity - plans.count)
        }

        // Adiciona o novo plano
        plans[count] = InvestmentPlan(planName: planName, initialInvestment: initialInvestment, monthlyReturn: monthlyReturn, annualReturn: annualReturn, netAnnualReturn: netAnnualReturn, slots: slots)
        count += 1 // Incrementa a contagem de planos
    }
}

// Função principal
func main() {
    let manager = InvestmentPlanManager()

    // Adicionando alguns planos de investimento como exemplo
    manager.addInvestmentPlan(planName: "Plano A", initialInvestment: 1000, monthlyReturn: 100, annualReturn: 1200, netAnnualReturn: 1000, slots: 5)
    manager.addInvestmentPlan(planName: "Plano B", initialInvestment: 2000, monthlyReturn: 200, annualReturn: 2400, netAnnualReturn: 2000, slots: 10)

    // Exibir os planos de investimento
    for i in 0..<manager.count {
        let plan = manager.plans[i]
        print("Plano: \(plan.planName)")
        print("Investimento Inicial: \(plan.initialInvestment)")
        print("Retorno Mensal: \(plan.monthlyReturn)")
        print("Retorno Anual: \(plan.annualReturn)")
        print("Retorno Anual Líquido: \(plan.netAnnualReturn)")
        print("Slots: \(plan.slots)")
        print("--------------") // Separador para melhor legibilidade
    }
}

// Chamada da função principal
main()
