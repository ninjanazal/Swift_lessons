import UIKit

@IBDesignable class RatingControl: UIStackView {
    // MARK: properties
    @IBInspectable var starSize : CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            createButtons()
        }
    }
    @IBInspectable var starCount : Int = 5 {
        didSet {
            createButtons()
        }
    }
    
    private var ratingButtons = [UIButton]()
    var rating = 0 {
        didSet {
            updateButtons()
        }
    }
    
    
    // MARK: initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        createButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        createButtons()
    }
    
    // MARK: methods
    private func createButton()
    {
        // load the images
        let bundle = Bundle(for: type(of: self))
        let emptyStar = UIImage(named: "emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named: "highlightedStar", in: bundle, compatibleWith: self.traitCollection)
        
        let button = UIButton()
        //button.backgroundColor = .red // UIColor.red
        button.setImage(emptyStar, for: .normal)
        button.setImage(filledStar, for: .selected)
        button.setImage(highlightedStar, for: .highlighted)
        button.setImage(highlightedStar, for: [.highlighted, .selected])
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: starSize.width).isActive = true
        button.widthAnchor.constraint(equalToConstant: starSize.height).isActive = true
        button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
        ratingButtons.append(button)
        addArrangedSubview(button)
    }
    
    private func createButtons()
    {
        clearButtons()
        for _ in 0..<starCount
        {
            createButton()
        }
    }
    
    private func clearButtons()
    {
        for button in ratingButtons
        {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
    }
    
    @objc func ratingButtonTapped(button: UIButton)
    {
        guard let index = ratingButtons.firstIndex(of: button) else {
            fatalError("Button not found")
        }
        
        let selectedRating = index + 1
        if selectedRating == rating
        {
            rating = 0
        }
        else
        {
            rating = selectedRating
        }
    }
    
    private func updateButtons()
    {
        for (index, button) in ratingButtons.enumerated()
        {
            /*if index < rating
            { button.isSelected = true}
            else { button.isSelected = false}*/
            
            button.isSelected = index < rating
        }
    }
}
