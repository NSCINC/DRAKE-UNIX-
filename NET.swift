import Foundation
import Web3
import Dispatch

dependencies: [
    .package(url: "https://github.com/matter-labs/web3swift.git", from: "2.3.0")
]

let infuraMainnetURL = "https://mainnet.infura.io/v3/YOUR_INFURA_PROJECT_ID" // Insira seu Infura Project ID

// Function to check the current block number for a given Web3 instance
func checkBlockNumber(coreID: Int, rpcURL: String) {
    // Create a Web3 instance
    guard let url = URL(string: rpcURL) else {
        print("Invalid URL for Core \(coreID).")
        return
    }
    
    let web3 = try! Web3(rpcURL: url.absoluteString)
    
    // Fetch the current block number
    web3.eth.getBlockNumber { (result) in
        switch result {
        case .success(let blockNumber):
            print("Core \(coreID) - Current block number: \(blockNumber)")
        case .failure(let error):
            print("Core \(coreID) - Error fetching block number: \(error.localizedDescription)")
        }
    }
}

// Function to start all cores (3 HoloSea cores for Mainnet)
func startHoloSeaCores() {
    let dispatchGroup = DispatchGroup()
    
    let rpcURLs = [
        infuraMainnetURL, // Core 1
        infuraMainnetURL, // Core 2
        infuraMainnetURL  // Core 3
    ]
    
    for (index, rpcURL) in rpcURLs.enumerated() {
        dispatchGroup.enter()
        DispatchQueue.global(qos: .userInitiated).async {
            checkBlockNumber(coreID: index + 1, rpcURL: rpcURL)
            dispatchGroup.leave()
        }
    }
    
    dispatchGroup.notify(queue: .main) {
        print("All cores finished checking block numbers.")
    }
}

// Start the HoloSea cores for Mainnet
startHoloSeaCores()

// Keep the program running to wait for the async responses
RunLoop.main.run()
