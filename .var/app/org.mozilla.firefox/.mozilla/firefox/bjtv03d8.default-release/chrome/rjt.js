const url = new URL('../cats', 'http://www.example.com/dogs');
console.log(url.hostname); // "www.example.com"
console.log(url.pathname); // "/cats"
console.log(url.href)
const urlWebApi = new URL('https://developer.mozilla.org/en-US/docs/Web/API/URL/href');
console.log(urlWebApi.href); // Logs: 'https://developer.mozilla.org/en-US/docs/Web/API/URL/href'

/* If the URL of your page is 
   https://example.com/?name=Jonathan%20Smith&age=18
   you could parse out the name and age parameters using:  ****/
let urlParams = new URL('https://example.com/myparser.pl?name=Robert%20Townley&FascismWorriesMe=TRUE')
let name = urlParams.get('name'); // is the string "Jonathan Smith".
let anxiety = urlParams.get('FascismWorriesMe');

let params = (new URL(document.location)).searchParams;
let name = params.get('name'); // is the string "Jonathan Smith".
let age = parseInt(params.get('age')); // is the number 18


