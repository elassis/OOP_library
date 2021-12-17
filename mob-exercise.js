let arrOne = arr,arrTwo = [arrOne.length],arrThree = [];
 let min = Math.min(...arrOne);
 while(arrOne.length > 1){
     arrOne.map((num)=>{
         num -= min;
         if(num > 0){
             arrThree.push(num);
         }
     });
     min = Math.min(...arrThree);
     arrOne = arrThree;
     if(arrThree.length > 0){
        arrTwo.push(arrThree.length);
     }
     arrThree = [];
 }
 return arrTwo;
