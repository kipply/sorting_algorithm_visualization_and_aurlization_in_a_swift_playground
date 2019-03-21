//#-hidden-code
import Foundation
//#-end-hidden-code
/*:
 # Cocktail Sort
 Cocktail Sort is a variation of the Bubble Sort. Cocktail sort traverses the array in one direction, then again in the other direction, essentially running a bubble sort from both sides.
*/
// Number of values in array
let N = /*#-editable-code*/30/*#-end-editable-code*/
// Speed of animation, from 0 - 9 (inclusive)
let speed = /*#-editable-code*/9/*#-end-editable-code*/
/*:
 ```
 // First Forward Pass (same as bubble sort first pass)
 5 1 4 2 8 0 2
 1 5 4 2 8 0 2
 1 4 5 2 8 0 2
 1 4 2 5 8 0 2
 1 4 2 5 8 0 2
 1 4 2 5 0 8 2
 
 // First Backward Pass
 1 4 2 5 0 2 8 // swap 8 and 2, as 8 is greater
 1 4 2 5 0 2 8 // no action as 2 > 0
 1 4 2 0 5 2 8 // swap 0 and 5, as 5 is greater
 1 4 0 2 5 2 8
 1 0 4 2 5 2 8
 
 // Second Forward Pass
 0 1 4 2 5 2 8
 0 1 4 2 5 2 8
 0 1 2 4 5 2 8
 0 1 2 4 5 2 8
 
 // Second Backward Pass
 0 1 2 4 2 5 8
 0 1 2 2 4 5 8
 
 // Like bubble sort, Cocktail Sort needs a whole pass with no swaps to assert that the array is sorted.
 ```
 * callout(Swift Code):
 ![Image of code with highlighting](cocktail.png)
 */
//#-hidden-code
cocktail(N: N, speed: 10 - speed)
//#-end-hidden-code
