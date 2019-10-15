extension UIView {
    /// Sets the given view's top, leading, trailing, bottom, centerX, centerY, width, and height constraints
    /// - parameter top: An NSLayoutYAxisAnchor to constrain the given view to (defaults to nil)
    /// - parameter leading: An NSLayoutXAxisAnchor to constrain the given view to (defaults to nil)
    /// - parameter trailing: An NSLayoutXAxisAnchor to constrain the given view to (defaults to nil)
    /// - parameter bottom: An NSLayoutYAxisAnchor to constrain the given view to (defaults to nil)
    /// - parameter centerX: An NSLayoutXAxisAnchor to constrain the given view to (defaults to nil)
    /// - parameter centerY: An NSLayoutYAxisAnchor to constrain the given view to (defaults to nil)
    /// - parameter padding: UIEdgeInsets representing the buffer between to top, leading, trailing, and
    /// bottom constraints (defaults to .zero)
    /// - parameter size: A CGSize value representing the desired size of the view (defaults to .zero)
    func anchor(
        to view: UIView? = nil,
        top: NSLayoutYAxisAnchor? = nil,
        leading: NSLayoutXAxisAnchor? = nil,
        trailing: NSLayoutXAxisAnchor? = nil,
        bottom: NSLayoutYAxisAnchor? = nil,
        centerX: NSLayoutXAxisAnchor? = nil,
        centerY: NSLayoutYAxisAnchor? = nil,
        padding: UIEdgeInsets = .zero,
        size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let view = view { view.addSubview(self) }
        
        if let top = top { topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true }
        if let leading = leading { leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true }
        if let trailing = trailing { trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true }
        if let bottom = bottom { bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true }
        
        if let centerX = centerX { centerXAnchor.constraint(equalTo: centerX).isActive = true }
        if let centerY = centerY { centerYAnchor.constraint(equalTo: centerY).isActive = true }
        
        if size.width != 0 { widthAnchor.constraint(equalToConstant: size.width).isActive = true }
        if size.height != 0 { heightAnchor.constraint(equalToConstant: size.height).isActive = true }
    }
    
    /// Constrains the given view to the top, leading, trailing, and bottom of the designated view with
    /// a designated amount of padding and size
    /// - parameter view: The view to constrain the given view to
    /// - parameter padding: UIEdgeInsets representing the buffer between the top, leading, trailing, and
    /// bottom edges of the given view and the edges of view constraining to (defaults to .zero)
    /// - parameter size: A CGSize value representing the desired size of the given view (defaults to .zero).
    /// If given a size, the view being constrained to should automatically adjust it's size
    func fillTo(
        _ view: UIView,
        withPadding padding: UIEdgeInsets = .zero,
        andSize size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(self)
        
        self.topAnchor.constraint(equalTo: view.topAnchor, constant: padding.top).isActive = true
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding.left).isActive = true
        self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding.right).isActive = true
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding.bottom).isActive = true
        
        if size.width != 0 { widthAnchor.constraint(equalToConstant: size.width).isActive = true }
        if size.height != 0 { heightAnchor.constraint(equalToConstant: size.height).isActive = true }
    }
