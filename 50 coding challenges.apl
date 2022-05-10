⍝ Table of 7
↑[0.5] {(7×¨⍵)}⍳10
⍝ odd numbers less than 100
{(2|⍵)/⍵} ⍳100
⍝ All tables
↑{⍵×¨⍳10}¨⍳10 ⍝ OR (⍳10)∘.×(⍳10)
⍝ Sum of numbers 1-10
+/⍳10
⍝ Factorial 10
!10
⍝ Sum of even numbers between 2 numbers
s_even ← {{(~2|⍵)/⍵}(⍺)↓⍳(⍵-1)}
⍝ Sum of all numbers in matrix 'a'
+/+/a
⍝ average of numbers in an array
avg ← {(+/+/⍵)÷(×/⍴⍵)}
⍝ non-negative numbers
non_negative ← {{(⍵≥0)/⍵}(∊↓⍵)}
⍝ maximum number in an array
max←{(⌈/⍵)}

⍝ isPrime or not
⍝ isprime ← {{⌈⍵÷(⍵+1)}0∊((¯1↓1↓⍳⍵)|⍵)} : why did i do this ?
isprime ← {0∊((¯1↓1↓⍳⍵)|⍵)}

⍝ prime numbers till n
prime ← {(isprime¨⍳⍵)/⍳⍵}
⍝ shift-left
shift_left ← {⍵↓⍺,⍵↑⍺} ⍝ usage: arr shift_left 5
⍝ shift-right
shift_right ← {∊((-⍵)↑⍺)((-⍵)↓⍺)} ⍝ usage: arr shift_right 5
 ⍝...infinite-shiftright
        shiftRight ← {⍺ shift_right (≢⍺)|⍵} ⍝ usage: arr shift_right 5000
⍝ reverse an array
⌽arr
⍝ distinct elements
distinct←{∪⍵}
⍝ Sum of first 100 prime numbers
+/ prime 100
⍝ Add and return everything as strings
add_return_strings ← {⍕¨(⍺)(⍵)(⍺+⍵)}
⍝ Capitalize first letter of each word in a sentence
capitalize←{∊{⍺' '⍵}/⍪/↑[0.5](1(819⌶)⊃¨⍵)(1↓¨⍵)}{(' '≠¨⍵)⊆⍵}
⍝ Number of words in a sentence
words ← ≢(' '≠⊢)⊆⊢
⍝ Number of words in a sentence using regex
1+ ≢('. .'⎕S'0') string
⍝ add comma separated values input as string
add_comma ← +/⍎¨{(~','⍷⍵)/⍵}
⍝ random words
random ← {{(?≢⍵)⊃⍵}(∊(' '⎕A))}
random¨⍳50
⍝ Ceaser's cipher
    keys ← {∊((-3)↑⍵)((-3)↓⍵)}((819⌶)⎕A)
    A ← (819⌶) ⎕A
    ceasarsCipher ← {keys[⍵]}¨{({A⍳⍵}¨⍵)}

⍝ Every element is same or not
    (⊃⊢×≢=+/)
    (∧/⊃=⊢)
    (^/2=/⊢)
⍝ Check two circles given by their radius and point of centre are intersecting
{∨/(=/¨(⍺+⍵)(⍺-⍵))}
⍝ Binary number in string to decimal
2⊥⍎¨
⍝ Sum of numbers in an array
+/+/↑
⍝ Shuffle string/anything
shuffle ← {S←⍵⋄{⍵⌷S}¨(?⍨≢S)} ⍝ Here: ?⍨ generates random permutations
⍝ Factorial of 70
fact←{⍵≤1: 1⋄⍵×(⍵-1)} ⍝ Factorial function
!70
⍝ Count of distinct characters in a string
{⍺ ⍵}⌸ str
⍝ Maximum /adjacent/ sum : my stupid solution
{S←(↑{⍺,⍵}¨/((¯1↓¨(⍵)(1⌽⍵))))⋄K←{(~(-1)⍷(×(--/¨⍵)))}S⋄+/¨K/S} ⍝ First to group consective elements, eg in 1 2 4 5 , to group as (1 2)(2 4)(4 5), first a duplicate row is created with elements shifted by 1n then I grouped each column | After that, found individual sums of groups | Omitted negative values |
⍝ Sort
(⊂∘⍋⌷⊢)

⍝ find which number under one million produces the longest series.The series is defined by n=n/2 if n is even. if odd n= 3n+1       eg: 10 gives 5 16 8 4 2 1
    fn ← {⊃((~2|⍵)/⍵÷2),(1+3×⍵)}                              ⍝ applies the function to a given value
    ∇Z ← seq
    :Repeat ⋄ X ← fn X ⋄ Y, ← X ⋄ :Until (X≤1) ⋄ Z ← (1↓Y)        ⍝ function to create the functional sequence
    ∇
    count ← ({X ← ⍵⋄Y ← ⎕NULL⋄≢seq}¨⍳∘⊢)                 ⍝ generstes an array of sizes of the sequences
    maxcount ← {{⍸(⌈/⍵)⍷⍵}count ⍵}                   ⍝ returns the index/indices at which the highest element is found

    ⍝ Usage : maxcount 10 

⍝ check for valid parentheses in a string
∇X←isVR STR
    FIND ← {∊(⍺=⊢)⍵}                      ⍝ Returns  boolean array wrt positions
    even_braces ← {0=2|(+/∊(⍵=⊢)¨'()')}STR
    bracesordered ← ∨/0<+\0~⍨∊+/{(⊃⍵)(¯1×(2⊃⍵))}{((2⊃⍵) FIND ⊢)¨1⊃⍵}'()'STR
    ⍝ unnecessary : getElement ← STR⊆⍨~∊+/(STR FIND⊢)¨'()'
∇

⍝ search for palindrom substrings
    palfor ← {{((∧/⌽=⊢)¨⍵)/⍵}(⍵,/⊢)⍺}
    ⍝ Usage 'sassy as hell huh' palfor 3
    ⍝ Returns : sas huh
    listAll ← {↑,/(⍵ palfor⊢)¨((⍳≢⍵)~⍳2)}
    ⍝ Usage : listAll str
    longest ← {{((⌈/=⊢)(≢⊢)¨⍵)/⍵}listAll⍵}

⍝ spirally display elements in an array
spiral←{(≢↑⍵)=1:⍵ ⋄ ⎕←1↑⍵ ⋄ ∇⍉⌽(1↓⍵)}