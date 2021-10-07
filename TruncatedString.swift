func truncated(length: Int = 100, trailing: String = "...") -> String {
    return (self.count > length) ? self.prefix(length) + trailing : self
}
