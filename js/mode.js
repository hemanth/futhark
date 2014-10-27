mode = (array) =>
    array.sort( (n1,n2) => 
        array.filter( (v) => v === n1 ).length - 
        array.filter( (v) => v === n2 ).length
    ).pop();
/*
ES6 way of finding mode.
mode(['apple','apple', 'orange', 'mango', 'pineapple', 'apple'])
"apple"
mode([1,2,3,3,2,1,42,24,42,32,42])
42
*/
