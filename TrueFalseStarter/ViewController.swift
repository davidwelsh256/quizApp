// David Welsh, originally Created by Pasan
// Treehouse Project 2
// updating a quiz app
// 8 July 2016



import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {
    
    let questionsPerRound = 4
    var questionsAsked = 0
    var correctQuestions = 0
    var indexOfSelectedQuestion: Int = 0
    var gameSound: SystemSoundID = 0
    var correctAnswer = ""
    var correctSound: SystemSoundID = 1
    var incorrectSound: SystemSoundID = 1
    
    
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!
    
    @IBOutlet weak var playAgainButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadGameStartSound()
        loadGameCorrectSound()
        loadGameIncorrectSound()
        
        // Start game
        playGameStartSound()
        displayQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayQuestion() {
        indexOfSelectedQuestion = GKRandomSource.sharedRandom().nextIntWithUpperBound(trivia.count)
        
        let questionDict = trivia[indexOfSelectedQuestion]
        questionField.text = questionDict.question
        answerButton1.setTitle(questionDict.answer1.answer, forState: .Normal)
        answerButton2.setTitle(questionDict.answer2.answer, forState: .Normal)
        answerButton3.setTitle(questionDict.answer3.answer, forState: .Normal)
        answerButton4.setTitle(questionDict.answer4.answer, forState: .Normal)
    
        playAgainButton.hidden = true
    
    }
    
    func displayScore() {
        // Hide the answer buttons **********
        answerButton1.hidden = true
        answerButton2.hidden = true
        answerButton3.hidden = true
        answerButton4.hidden = true
        
        
        // Display play again button
        playAgainButton.hidden = false
        
        questionField.text = "You got \(correctQuestions) out of \(questionsPerRound) correct!"
        
    }
  
    
    @IBAction func checkAnswer(sender: UIButton) {
        let selectedQuestionDict = trivia[indexOfSelectedQuestion]
        
        if selectedQuestionDict.answer1.correct == true {
            correctAnswer = selectedQuestionDict.answer1.answer
        }else if selectedQuestionDict.answer2.correct == true {
            correctAnswer = selectedQuestionDict.answer2.answer
        }else if selectedQuestionDict.answer3.correct == true {
            correctAnswer = selectedQuestionDict.answer3.answer
        }else if selectedQuestionDict.answer4.correct == true {
            correctAnswer = selectedQuestionDict.answer4.answer
        }
        if sender.titleLabel!.text == correctAnswer {
            correctQuestions += 1
            questionField.text = "Correct!"
            playGameCorrectSound()
            
        }else {
            questionField.text = "Sorry, that isn't correct"
            playGameIncorrectSound()
            
        }

        questionsAsked += 1
        trivia.removeAtIndex(indexOfSelectedQuestion)
        loadNextRoundWithDelay(seconds: 1)
    }

    func nextRound() {
        if questionsAsked == questionsPerRound {
            // Game is over
            displayScore()
        } else {
            // Continue game
            displayQuestion()
        }
    }

    
    @IBAction func playAgain(sender: UIButton) {
        // Show the answer buttons
        answerButton1.hidden = false
        answerButton2.hidden = false
        answerButton3.hidden = false
        answerButton4.hidden = false
        
        questionsAsked = 0
        correctQuestions = 0
        nextRound()
    }
    

    
    // MARK: Helper Methods
    
    func loadNextRoundWithDelay(seconds seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, delay)
        
        // Executes the nextRound method at the dispatch time on the main queue
        dispatch_after(dispatchTime, dispatch_get_main_queue()) {
            self.nextRound()
        }
    }
    
    func loadGameStartSound() {
        let pathToSoundFile = NSBundle.mainBundle().pathForResource("GameSound", ofType: "wav")
        let soundURL = NSURL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL, &gameSound)
    }
    func loadGameCorrectSound() {
        let pathToSoundFile = NSBundle.mainBundle().pathForResource("CorrectSound", ofType: "mp3")
        let soundURL = NSURL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL, &correctSound)
    }
    func loadGameIncorrectSound() {
        let pathToSoundFile = NSBundle.mainBundle().pathForResource("inCorrectSound", ofType: "mp3")
        let soundURL = NSURL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL, &incorrectSound)
    }
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
    func playGameCorrectSound() {
        AudioServicesPlaySystemSound(correctSound)
    }
    func playGameIncorrectSound() {
        AudioServicesPlaySystemSound(incorrectSound)
    }
}

