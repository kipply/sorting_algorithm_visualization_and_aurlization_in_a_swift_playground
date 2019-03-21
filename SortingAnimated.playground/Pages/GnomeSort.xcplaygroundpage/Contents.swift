//#-hidden-code
import Foundation
//#-end-hidden-code
/*:
 # Gnome Sort
 Gnome Sort, unfortunately also known as Stupid Sort, is another basic sort based on the way a gnome might sort his flower pots. It starts similarly to a bubble sort, by traversing the array and performing swaps. However, if a swap is required, Gnome Sort will perform the swap and then step backwards (and it'll step forward if no swap is required. Thus, it runs in one loop with increments and decrements to the index, and only does one pass. It runs in O(N^2).
*/
// Number of values in array
let N = /*#-editable-code*/15/*#-end-editable-code*/
// Speed of animation, from 0 - 9 (inclusive)
let speed = /*#-editable-code*/8/*#-end-editable-code*/
/*:
 ```
 34 2 10 -9 // Gnome at index
 2 34 10 -9 // swapped, returned to index 0
 2 34 10 -9 // step forward
 2 34 10 -9 // step forward to index 2 (element is 10)
 2 10 34 -9 // swapped, returned to index 1 (element is 10)
 2 10 34 -9 //step forward
 2 10 34 -9 //step forward to index 3 (element is -9)
 2 10 -9 34 // swap, return to index 2
 2 -9 10 34 // swap, return to index 1
 -9 2 10 34 // swap, return to index 0
 // The Gnome Sort knows it's complete because it swapped the last element
 ```
 * callout(Swift Code):
 ![Image of code with highlighting](gnome.png)
*/
//#-hidden-code
gnome(N: N, speed: 10 - speed)
//#-end-hidden-code
