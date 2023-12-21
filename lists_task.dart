void main() {

//1- Take a list, say for example this one:
//   a = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]
// and write a program that prints out all the elements of the list that are less than 5.


  var list1 = <int>[1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89];
  for (var i in list1) {
    if (i < 5) {
      print(i);
      }
    }


// 2- Take two lists, for example:
//   a = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]
//   b = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
// and write a program that returns a list that contains only the elements that are common between them
// (without duplicates). Make sure your program works on two lists of different sizes.
    var a = <int>[1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89];
    var b = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    print(Set.from(a).intersection(Set.from(b)).toList());



//3-- Let’s say you are given a list saved in a variable:
// a = [1, 4, 9, 16, 25, 36, 49, 64, 81, 100].
// Write a Dart code that takes this list and makes a new list that has only the even elements of this list in it.
var a1=<int> [1, 4, 9, 16, 25, 36, 49, 64, 81, 100];
var evenList=[];
for(int i in a1){
  if(i.isEven){
    evenList.add(i);
  }
}
print(evenList);



//4- Write a program that takes a list of numbers for example
// a = [5, 10, 15, 20, 25]
// and makes a new list of only the first and last elements of the given list.
// For practice, write this code inside a function.
 var a2 =<int> [5, 10, 15, 20, 25];

 List newList(a){
   return [a2.first, a2.last];


 }


 }