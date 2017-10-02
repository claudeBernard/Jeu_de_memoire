//=======================================
import UIKit
import AVFoundation
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
    @IBOutlet weak var trofeu:       UIImageView!
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
    @IBOutlet weak var Congratulation: UIView!
    

    var arrayOfImageViews:     [UIImageView]!
    var arrayOfAnimalsNames  = ["castor.png","castor.png","cavalo.png","cavalo.png","coruja.png","coruja.png","leao.png","leao.png","panda.png","panda.png","pato.png","pato.png",
                                "penguin.png","penguin.png","sapo.png","sapo.png","squirrel.png","squirrel.png","tartaruga.png","tartaruga.png"]
    var arrayOfRandomAnimals = [String]()
    var arrayOfChosenCards   = [String]()
    var arrayOfChosenViews   = [UIView]()
    var arrayOfShowInBacks   = [UIView]()
    var arrayOfHidingFronts  = [UIView]()
    var arrayOfCards         = [UIView]()
    
    var resetUsage = true
    var win = 0
    var actionWin = false
    var applause: AVAudioPlayer?
    var loseCard: AVAudioPlayer?
    var winCard:  AVAudioPlayer?
    var controllSound = 0
    
    //-------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayOfCards = [card_1, card_2, card_3, card_4, card_5, card_6, card_7, card_8, card_9, card_10, card_11, card_12, card_13, card_14, card_15, card_16, card_17, card_18, card_19, card_20]
        arrayOfImageViews = [ImageView_1, ImageView_2, ImageView_3, ImageView_4, ImageView_5, ImageView_6, ImageView_7, ImageView_8, ImageView_9, ImageView_10, ImageView_11, ImageView_12,
                             ImageView_13, ImageView_14, ImageView_15, ImageView_16, ImageView_17, ImageView_18, ImageView_19, ImageView_20]
        randomAnimalNames ()
        setImageToCard ()
        
        guard let url_applause = Bundle.main.url(forResource: "applause", withExtension: "mp3") else { return }
        guard let url_loseCard = Bundle.main.url(forResource: "loseCard", withExtension: "mp3") else { return }
        guard let url_winCard  = Bundle.main.url(forResource: "winCard",  withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            applause = try AVAudioPlayer(contentsOf: url_applause)
            loseCard = try AVAudioPlayer(contentsOf: url_loseCard)
            winCard  = try AVAudioPlayer(contentsOf: url_winCard)
        } catch let error {
            print(error.localizedDescription)
        }
    }
    //-------------------
    @IBAction func showCard(_ sender: UIButton) {
        resetUsage = false
        if arrayOfHidingFronts.count == 2 {
            return
        }
        
        switch sender.tag {
            case 0:
                cardClicked(front: front_1, back: back_1, indexChosenCards: sender.tag, cardView: card_1)
            case 1:
                cardClicked(front: front_2, back: back_2, indexChosenCards: sender.tag, cardView: card_2)
            case 2:
                cardClicked(front: front_3, back: back_3, indexChosenCards: sender.tag, cardView: card_3)
            case 3:
                cardClicked(front: front_4, back: back_4, indexChosenCards: sender.tag, cardView: card_4)
            case 4:
                cardClicked(front: front_5, back: back_5, indexChosenCards: sender.tag, cardView: card_5)
            case 5:
                cardClicked(front: front_6, back: back_6, indexChosenCards: sender.tag, cardView: card_6)
            case 6:
                cardClicked(front: front_7, back: back_7, indexChosenCards: sender.tag, cardView: card_7)
            case 7:
                cardClicked(front: front_8, back: back_8, indexChosenCards: sender.tag, cardView: card_8)
            case 8:
                cardClicked(front: front_9, back: back_9, indexChosenCards: sender.tag, cardView: card_9)
            case 9:
                cardClicked(front: front_10, back: back_10, indexChosenCards: sender.tag, cardView: card_10)
            case 10:
                cardClicked(front: front_11, back: back_11, indexChosenCards: sender.tag, cardView: card_11)
            case 11:
                cardClicked(front: front_12, back: back_12, indexChosenCards: sender.tag, cardView: card_12)
            case 12:
                cardClicked(front: front_13, back: back_13, indexChosenCards: sender.tag, cardView: card_13)
            case 13:
                cardClicked(front: front_14, back: back_14, indexChosenCards: sender.tag, cardView: card_14)
            case 14:
                cardClicked(front: front_15, back: back_15, indexChosenCards: sender.tag, cardView: card_15)
            case 15:
                cardClicked(front: front_16, back: back_16, indexChosenCards: sender.tag, cardView: card_16)
            case 16:
                cardClicked(front: front_17, back: back_17, indexChosenCards: sender.tag, cardView: card_17)
            case 17:
                cardClicked(front: front_18, back: back_18, indexChosenCards: sender.tag, cardView: card_18)
            case 18:
                cardClicked(front: front_19, back: back_19, indexChosenCards: sender.tag, cardView: card_19)
            case 19:
                cardClicked(front: front_20, back: back_20, indexChosenCards: sender.tag, cardView: card_20)
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
        for index in 0..<arrayOfShowInBacks.count {flipCard(from: arrayOfShowInBacks[index], to: arrayOfHidingFronts[index])}
        arrayOfShowInBacks  = []
        arrayOfHidingFronts = []
        resetUsage = true
        if (controllSound == 1) {
            winCard?.play()
        } else {
            loseCard?.play()
        }
        if win == 10 {
            actionWin = true
            youWin()
        }
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
                win = win + 1
                controllSound = 1
            } else {
                arrayOfChosenViews = []
                controllSound = 2
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
        if resetUsage {
            for card in 0..<arrayOfCards.count {
                arrayOfCards[card].isHidden = false
            }
            arrayOfAnimalsNames = ["castor.png","castor.png","cavalo.png","cavalo.png","coruja.png","coruja.png","leao.png","leao.png","panda.png","panda.png","pato.png","pato.png",
                                   "penguin.png","penguin.png","sapo.png","sapo.png","squirrel.png","squirrel.png","tartaruga.png","tartaruga.png"]
            arrayOfRandomAnimals = []
            randomAnimalNames()
            setImageToCard()
            actionWin = false
            Congratulation.isHidden = true
        }
    }
    //-------------------
    func youWin() {
        if actionWin {
            Congratulation.isHidden = false
            animationWinUp()
            animationWinDown()
            applause?.play()
        }
    }
    //-------------------
    func animationWinUp() {
        UIView.animate(withDuration: 1, delay: 0, options: [.curveEaseInOut], animations: {self.trofeu.transform = CGAffineTransform(scaleX:2, y:2)},completion: {(true) in self.animationWinDown()})
    }
    //-------------------
    func animationWinDown() {
        UIView.animate(withDuration: 1, delay: 0, options: [.curveEaseInOut], animations: {self.trofeu.transform = CGAffineTransform(scaleX:1, y:1)},completion: {(true) in self.animationWinUp()})
    }
    //-------------------
}
