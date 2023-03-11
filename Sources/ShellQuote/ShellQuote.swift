import Foundation

struct ShellQuote {
    private static let unsafe = #"[^\w@%+=:,./-]"#

    static func hasUnsafeContent(_ input: String) -> Bool {
        input.range(of: unsafe, options: .regularExpression) != nil
    }

    /// Return a shell-escaped version of the input string.
    ///
    /// The input string will be wrapped in single quotes (') and all existing single quotes within the string
    /// will be escaped via double quotes: "'".
    ///
    /// For example, $'b will be quoted as '$'"'"'b'.
    /// - Parameter input: input string
    /// - Returns: shell-escaped output string
    static func quote(_ input: String) -> String {
        if !hasUnsafeContent(input) { return input }
        return "'" + input.replacingOccurrences(of: "'", with: #"'"'"'"#) + "'"
    }
}
