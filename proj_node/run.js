var http = require('http');

http.createServer(function (req, res) {
    res.writeHead(200, {'Content-Type': 'text/html'});
    res.end('Hello World!');
}).listen(3000);

spam();

async function spam () {
    for (let i = 0; i < 100; i++) {
        await sleep(3003);
        console.log(i*2);
    }
}
function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}
