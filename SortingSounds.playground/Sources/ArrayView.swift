import UIKit
import PlaygroundSupport
import Dispatch
import AVFoundation

public class ArrayView: UIView {
    private let updateOperations = OperationQueue()
    
    private let fluteEngine = AVAudioEngine()
    private let pianoEngine = AVAudioEngine()
    private let fluteMixer: AVAudioMixerNode = AVAudioMixerNode()
    private let pianoMixer: AVAudioMixerNode = AVAudioMixerNode()
    private let flutePitchControl = AVAudioUnitTimePitch()
    private let pianoPitchControl = AVAudioUnitTimePitch()

    private let barColour = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
    private let updateDelay:UInt32 = 50000
    private var speed: UInt32
    
    public init(speed: Int) {
        self.speed = UInt32(speed)
        super.init(frame: CGRect(x: 0, y: 0, width: 667, height: 500))
        backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        
        updateOperations.maxConcurrentOperationCount = 1
        updateOperations.isSuspended = true
        PlaygroundPage.current.liveView = self
        PlaygroundPage.current.needsIndefiniteExecution = true
        
        pianoEngine.attach(pianoMixer)
        pianoEngine.attach(pianoPitchControl)
        pianoEngine.connect(pianoMixer, to:pianoPitchControl, format: nil)
        pianoEngine.connect(pianoPitchControl, to: pianoEngine.mainMixerNode, format: nil)
        
        fluteEngine.attach(fluteMixer)
        fluteEngine.attach(flutePitchControl)
        fluteEngine.connect(fluteMixer, to:flutePitchControl, format: nil)
        fluteEngine.connect(flutePitchControl, to: fluteEngine.mainMixerNode, format: nil)

        do {
            try fluteEngine.start()
            try pianoEngine.start()
        } catch {
            print("Engine start failed")
        }

    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func update(with values: [Int], _ switched: Int) {
        let updateOperation = BlockOperation {
            [weak self] in self?.drawBars(with: values)
            usleep(self!.updateDelay * self!.speed)
        }

        let maxValue = values.max() ?? 0
        
        let soundOperation = BlockOperation {
            let value = values[switched]
            let percentage = CGFloat(value)/CGFloat(maxValue)

            do {
                try self.piano(percentage)
            } catch let error {
                print(error.localizedDescription)
            }
        }
        
        if switched != -1 {
            updateOperations.addOperation(soundOperation)
        }
        updateOperations.addOperation(updateOperation)
    }
    
    public func updateScan(with index: Int, _ numValues: Int) {
        let updateOperation = BlockOperation {
            [weak self] in self?.highlightBar(with: index)
            usleep(self!.updateDelay / 2 * self!.speed)
            self?.unHighlightBar(with: index)
            usleep(self!.updateDelay / 2 * self!.speed)
        }
    
        let percentage = Float(index) / Float(numValues)
        let soundOperation = BlockOperation {
            do {
                try self.flute(percentage)
            } catch let error {
                print(error.localizedDescription)
            }
        }
        updateOperations.addOperation(soundOperation)
        updateOperations.addOperation(updateOperation)
    }
    
    public func piano(_ percentage: CGFloat) throws {
        let audioPlayer = AVAudioPlayerNode()
        
        pianoEngine.attach(audioPlayer)
        pianoEngine.connect(audioPlayer, to: pianoMixer, format: nil)

        let maxPitch = 4500
        guard let url = Bundle.main.url(forResource: "piano", withExtension: "wav") else {
            print("Invalid file or filepath in resources")
            return
        }
        let file = try AVAudioFile(forReading: url)
        
        pianoPitchControl.pitch = Float(CGFloat(maxPitch) * percentage - 2000)
        audioPlayer.scheduleFile(file, at: nil)
        audioPlayer.play()
    }
    
    public func flute(_ percentage: Float) throws {
        let audioPlayer = AVAudioPlayerNode()
        fluteEngine.attach(audioPlayer)
        fluteEngine.connect(audioPlayer, to: fluteMixer, format: nil)

        let maxPitch = 3000
        guard let url = Bundle.main.url(forResource: "flute", withExtension: "wav") else {
            print("Invalid file or filepath in resources")
            return
        }
        let file = try AVAudioFile(forReading: url)
        
        flutePitchControl.pitch = Float(Float(maxPitch) * percentage - 2500)
        audioPlayer.pan = Float(percentage * 200 - 100)
        audioPlayer.scheduleFile(file, at: nil)
        audioPlayer.play()
    }
    
    public func go() {
        updateOperations.isSuspended = false
    }
    
    private func highlightBar(with idx: Int) {
        subviews[idx].backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        CATransaction.flush()
    }
    private func unHighlightBar(with idx: Int) {
        subviews[idx].backgroundColor = barColour
        CATransaction.flush()
    }
    
    private func drawBars(with values: [Int]) {
        if subviews.count != values.count {
            addSubviews(values.count)
        }
        
        for (index, bar) in subviews.enumerated() {
            configure(bar, at: index, values: values)
        }
        
        CATransaction.flush()
    }
    
    private func addSubviews(_ count: Int) {
        for view in subviews {
            view.removeFromSuperview()
        }
        
        for _ in 1...count {
            let bar = UIView()
            bar.translatesAutoresizingMaskIntoConstraints = false
            addSubview(bar)
        }
    }
    
    private func configure(_ bar: UIView, at index: Int, values: [Int]) {
        let barWidth = frame.width / CGFloat(values.count)

        let x = barWidth * CGFloat(index)
        
        let value = values[index]
        let maxValue = values.max() ?? 0
        let percentage = CGFloat(value)/CGFloat(maxValue)
        let height = frame.height * percentage
        
        bar.frame = CGRect(
            x: x,
            y: frame.height - height,
            width: barWidth,
            height: height)
        
        bar.backgroundColor = barColour
    }
}
