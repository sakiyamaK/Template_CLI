import Foundation
import Template_CLICore
import Dispatch
import ArgumentParser

struct RuntimeError: Error, CustomStringConvertible {
  var description: String
  init(_ description: String) {
    self.description = description
  }
}

struct Template_CLI: ParsableCommand {
  static var configuration = CommandConfiguration(
    commandName: "template_CLI",
    abstract: "",
    discussion: """
        
        """,
    version: "1.0.0",
    shouldDisplay: true,
    helpNames: [.long, .short]
  )

  func run() throws {
    print("Hello World")
    // dispatchMain()
  }
}

Template_CLI.main()
