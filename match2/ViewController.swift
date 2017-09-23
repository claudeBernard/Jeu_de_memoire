//=======================================
import UIKit
//=======================================
class ViewController: UIViewController {
    //-------------------
    @IBOutlet weak var back_1:   UIView!
    @IBOutlet weak var front_1:  UIView!
    @IBOutlet weak var back_2:   UIView!
    @IBOutlet weak var front_2:  UIView!
    @IBOutlet weak var back_3:   UIView!
    @IBOutlet weak var front_3:  UIView!
    @IBOutlet weak var back_4:   UIView!
    @IBOutlet weak var front_4:  UIView!
    @IBOutlet weak var back_5:   UIView!
    @IBOutlet weak var front_5:  UIView!
    @IBOutlet weak var back_6:   UIView!
    @IBOutlet weak var front_6:  UIView!
    @IBOutlet weak var back_7:   UIView!
    @IBOutlet weak var front_7:  UIView!
    @IBOutlet weak var back_8:   UIView!
    @IBOutlet weak var front_8:  UIView!
    @IBOutlet weak var back_9:   UIView!
    @IBOutlet weak var front_9:  UIView!
    @IBOutlet weak var back_10:  UIView!
    @IBOutlet weak var front_10: UIView!
    @IBOutlet weak var back_11:  UIView!
    @IBOutlet weak var front_11: UIView!
    @IBOutlet weak var back_12:  UIView!
    @IBOutlet weak var front_12: UIView!
    @IBOutlet weak var back_13:  UIView!
    @IBOutlet weak var front_13: UIView!
    @IBOutlet weak var back_14:  UIView!
    @IBOutlet weak var front_14: UIView!
    @IBOutlet weak var back_15:  UIView!
    @IBOutlet weak var front_15: UIView!
    @IBOutlet weak var back_16:  UIView!
    @IBOutlet weak var front_16: UIView!
    @IBOutlet weak var back_17:  UIView!
    @IBOutlet weak var front_17: UIView!
    @IBOutlet weak var back_18:  UIView!
    @IBOutlet weak var front_18: UIView!
    @IBOutlet weak var back_19:  UIView!
    @IBOutlet weak var front_19: UIView!
    @IBOutlet weak var back_20:  UIView!
    @IBOutlet weak var front_20: UIView!
    @IBOutlet weak var ImageView_1:  UIImageView!
    @IBOutlet weak var ImageView_2:  UIImageView!
    @IBOutlet weak var ImageView_3:  UIImageView!
    @IBOutlet weak var ImageView_4:  UIImageView!
    @IBOutlet weak var ImageView_5:  UIImageView!
    @IBOutlet weak var ImageView_6:  UIImageView!
    @IBOutlet weak var ImageView_7:  UIImageView!
    @IBOutlet weak var ImageView_8:  UIImageView!
    @IBOutlet weak var ImageView_9:  UIImageView!
    @IBOutlet weak var ImageView_10: UIImageView!
    @IBOutlet weak var ImageView_11: UIImageView!
    @IBOutlet weak var ImageView_12: UIImageView!
    @IBOutlet weak var ImageView_13: UIImageView!
    @IBOutlet weak var ImageView_14: UIImageView!
    @IBOutlet weak var ImageView_15: UIImageView!
    @IBOutlet weak var ImageView_16: UIImageView!
    @IBOutlet weak var ImageView_17: UIImageView!
    @IBOutlet weak var ImageView_18: UIImageView!
    @IBOutlet weak var ImageView_19: UIImageView!
    @IBOutlet weak var ImageView_20: UIImageView!
    @IBOutlet weak var card_1:  UIView!
    @IBOutlet weak var card_2:  UIView!
    @IBOutlet weak var card_3:  UIView!
    @IBOutlet weak var card_4:  UIView!
    @IBOutlet weak var card_5:  UIView!
    @IBOutlet weak var card_6:  UIView!
    @IBOutlet weak var card_7:  UIView!
    @IBOutlet weak var card_8:  UIView!
    @IBOutlet weak var card_9:  UIView!
    @IBOutlet weak var card_10: UIView!
    @IBOutlet weak var card_11: UIView!
    @IBOutlet weak var card_12: UIView!
    @IBOutlet weak var card_13: UIView!
    @IBOutlet weak var card_14: UIView!
    @IBOutlet weak var card_15: UIView!
    @IBOutlet weak var card_16: UIView!
    @IBOutlet weak var card_17: UIView!
    @IBOutlet weak var card_18: UIView!
    @IBOutlet weak var card_19: UIView!
    @IBOutlet weak var card_20: UIView!
    
    var arrayOfImageViews:     [UIImageView]!
    var arrayOfAnimalsNames  = ["panda.png","panda.png","penguin.png","penguin.png"]
    var arrayOfRandomAnimals = [String]()
    var arrayOfChosenCards   = [String]()
    var arrayOfChosenViews   = [UIView]()
    var arrayOfShowInBacks   = [UIView]()
    var arrayOfHidingFronts  = [UIView]()
    var arrayOfCards         = [UIView]()
    
    //-------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayOfCards = [card_1, card_2, card_3, card_4]
        arrayOfImageViews = [ImageView_1, ImageView_2, ImageView_3, ImageView_4]
        randomAnimalNames ()
        setImageToCard ()
    }
    //-------------------
    @IBAction func showCard(_ sender: UIButton) {
        
        switch sender.tag {
            case 0:
                cardClicked(front: front_1, back: back_1, indexChosenCards: sender.tag, cardView: card_1)
            case 1:
                cardClicked(front: front_2, back: back_2, indexChosenCards: sender.tag, cardView: card_2)
            case 2:
                cardClicked(front: front_3, back: back_3, indexChosenCards: sender.tag, cardView: card_3)
            case 3:
                cardClicked(front: front_4, back: back_4, indexChosenCards: sender.tag, cardView: card_4)
            default:
                break
        }
        verification()
    }
    //-------------------
    func cardClicked (front: UIView, back: UIView, indexChosenCards: Int, cardView: UIView) {
        flipCard(from: front, to: back)
        arrayOfChosenCards.append(arrayOfRandomAnimals[indexChosenCards])
        arrayOfChosenViews.append(cardView)
        arrayOfShowInBacks.append(back)
        arrayOfHidingFronts.append(front)
    }
    //-------------------
    func flipCard (from: UIView, to: UIView) {
        let transitionOption: UIViewAnimationOptions = [.transitionFlipFromRight,.showHideTransitionViews]
        UIView.transition(with: from, duration: 1.0, options: transitionOption, animations: {from.isHidden = true})
        UIView.transition(with: to, duration: 1.0, options: transitionOption, animations: {to.isHidden = false})
    }
    //-------------------
    func resetCards() {
        if arrayOfShowInBacks.count == 2 {
            Timer.scheduledTimer(timeInterval: 2, target: self, selector: (#selector(reflip)), userInfo: nil, repeats: false)
        }
    }
    //-------------------
    @objc func reflip () {
        for index in 0..<arrayOfShowInBacks.count {
        flipCard(from: arrayOfShowInBacks[index], to: arrayOfHidingFronts[index])
        }
        arrayOfShowInBacks  = []
        arrayOfHidingFronts = []
    }
    //-------------------
    func setImageToCard () {
        var number = 0
        for imageView in arrayOfImageViews {
            imageView.image = UIImage(named: arrayOfRandomAnimals[number])
            number = number + 1
        }
    }
    //-------------------
    func randomAnimalNames () {
        let numberOfAnimals = arrayOfAnimalsNames.count
        
        for _ in 1...numberOfAnimals {
            let randomNumber = Int(arc4random_uniform(UInt32(arrayOfAnimalsNames.count)))
            arrayOfRandomAnimals.append(arrayOfAnimalsNames[randomNumber])
            arrayOfAnimalsNames.remove(at: randomNumber)
        }
    }
    //-------------------
    func verification () {
        if arrayOfChosenCards.count == 2 {
            if arrayOfChosenCards[0] == arrayOfChosenCards[1]{
                Timer.scheduledTimer(timeInterval: 2, target: self, selector: (#selector(hideCard)), userInfo: nil, repeats: false)
            } else {
            arrayOfChosenViews = []
            }
            arrayOfChosenCards = []
        }
        resetCards()
    }
    //-------------------
    @objc func hideCard () {
        arrayOfChosenViews[0].isHidden = true
        arrayOfChosenViews[1].isHidden = true
        arrayOfChosenViews = []
    }
    //-------------------
    @IBAction func reset(_ sender: UIButton) {
        for card in 0..<arrayOfCards.count {
            arrayOfCards[card].isHidden = false
        }
        arrayOfAnimalsNames = ["panda.png","panda.png","penguin.png","penguin.png"]
        arrayOfRandomAnimals = []
        randomAnimalNames()
        setImageToCard()
    }
    //-------------------
}












