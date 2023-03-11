import Foundation


// This is a port of Python's shlex.quote
// https://github.com/python/cpython/blob/5ffdaf748d98da6065158534720f1996a45a0072/Lib/shlex.py#L323


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
