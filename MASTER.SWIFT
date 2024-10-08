import Foundation

let compileCommand = "gcc" // Comando de compilação
let outputName = "output_program" // Nome do programa final
let terminalCommand = "abc" // Comando fictício para executar o programa

// Função para compilar todos os arquivos .c no diretório atual
func compileAllCFiles() {
    var compileCmd = "\(compileCommand) -o \(outputName) "
    
    // Obter o diretório atual
    let currentDir = FileManager.default.currentDirectoryPath
    
    do {
        // Listar todos os arquivos no diretório atual
        let files = try FileManager.default.contentsOfDirectory(atPath: currentDir)
        
        // Adicionar arquivos .c ao comando de compilação
        for file in files {
            if file.hasSuffix(".c") {
                compileCmd.append("\(file) ")
            }
        }
        
        // Executar o comando de compilação
        print("Compiling with command: \(compileCmd)")
        let compileProcess = Process()
        compileProcess.launchPath = "/bin/bash"
        compileProcess.arguments = ["-c", compileCmd]
        
        compileProcess.launch()
        compileProcess.waitUntilExit()
        
        if compileProcess.terminationStatus != 0 {
            print("Compilation failed.")
            exit(1)
        }
        
        print("Compilation successful!")
        
    } catch {
        print("Error accessing directory: \(error.localizedDescription)")
        exit(1)
    }
}

// Função para executar o programa compilado usando o terminal fictício "abc"
func runProgramWithABC() {
    let runCmd = "\(terminalCommand) ./\(outputName)"
    
    // Executar o programa
    print("Executing the program with terminal '\(terminalCommand)': \(runCmd)")
    let runProcess = Process()
    runProcess.launchPath = "/bin/bash"
    runProcess.arguments = ["-c", runCmd]
    
    runProcess.launch()
    runProcess.waitUntilExit()
    
    if runProcess.terminationStatus != 0 {
        print("Execution failed.")
        exit(1)
    }
}

func main() {
    compileAllCFiles()  // Compilar todos os arquivos .c
    runProgramWithABC() // Executar o programa com o comando fictício "abc"
}

// Chamar a função principal
main()
