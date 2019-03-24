//#-hidden-code
import Foundation
//#-end-hidden-code
/*:
 [Back to home](Home)
 ## Bogo Sort
 Bogo Sort is a comically ineffective sort that shuffles the array at random until it is sorted. Worst case complexity is infinite and average is O(N*N!).
*/
// Number of values in array
let N = /*#-editable-code*/6/*#-end-editable-code*/
// Speed of animation, from 0 - 9 (inclusive)
let speed = /*#-editable-code*/8/*#-end-editable-code*/

/*:
 * callout(Swift Code):
 ![Image of code with highlighting](bogo.png)
*/
//#-hidden-code
bogo(N: N, speed: 10 - speed)
//#-end-hidden-code
