
/*:
 
 # Sorting Sounds
 
 *For WWDC Judging, to keep everything under the three minutes, please see the Quick Sort, Cocktail Shaker Sort and Bitonic Sort without changing any code.*
 
 **Sorting Sounds is best experienced with headphones and rendered markup!**
 
 Below are links to 10 sorts. In each of these sorts, you'll find a brief explanation, Swift algorithm code, and of course the visualization itself! You'll also be able to change the number of items in the array and the speed of the animation in the sort.
 */
/*:
 ## Table of Contents
 
  0. [Bubble Sort](BubbleSort)
  1. [Merge Sort](MergeSort)
  2. [Quick Sort](QuickSort)
  3. [Insertion Sort](Insertion)
  4. [Selection Sort](SelectionSort)
  5. [Bogo Sort](BogoSort)
  6. [Bitonic Sort](BitonicSort)
  7. [Cocktail Shaker Sort (Bidirectional Bubble / Ripple Sort)](CocktailSort)
  8. [Gnome Sort (Stupid Sort)](GnomeSort)
  9.  [Heap Sort](HeapSort)
*/
//#-hidden-code
import UIKit
import PlaygroundSupport

class HomeViewController : UIViewController {
    
    var titleLabel : UILabel!
    var infoLabel : UILabel!

    override func loadView() {
        
        // UI
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 667, height: 500))
        PlaygroundPage.current.liveView = view
        view.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        
        titleLabel = UILabel()
        titleLabel.text = "SORTING SOUNDS"
        titleLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)


        infoLabel = UILabel()
        infoLabel.text = "Sorting Sounds is an awesomely fun way to learn 10 of the most popular sorting algorithms by seeing and hearing them in action!\n\n - A random array is generated and the sort is animated!\n - The item the sorting algorithm is looking is highlighted.\n - A flute sound will play to help you get a audible sense of where the algorithm is looking. Higher notes are to the right. Headphones are also recommended as the sounds pan!\n - A piano sound is played to represent the items in the array being moved. Lower sounds represent low values and higher sounds represent high values."
        infoLabel.contentMode = .scaleToFill
        infoLabel.numberOfLines = 13
        infoLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        infoLabel.font = UIFont.systemFont(ofSize: 20)
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(infoLabel)

        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            infoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            infoLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            infoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
        ])
        
        self.view = view
    }
}

PlaygroundPage.current.liveView = HomeViewController()
//#-end-hidden-code
