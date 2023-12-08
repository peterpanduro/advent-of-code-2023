import Foundation

 public func resourceWithName(_ name: String) throws -> String {
   let currentFile = URL(fileURLWithPath: #file)
    let currentDirectory = currentFile.deletingLastPathComponent().deletingLastPathComponent()
    let fileURL = currentDirectory.appendingPathComponent("Resources/\(name)")
    return try String(contentsOf: fileURL)
}

public extension Optional {
   func expect(_ message: String) throws -> Wrapped {
       switch self {
       case .some(let value):
           return value
       case .none:
           throw NSError(domain: "Optional", code: 0, userInfo: [NSLocalizedDescriptionKey: message])
       }
   }
}
