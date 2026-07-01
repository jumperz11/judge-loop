const http = require("node:http");

function createServer() {
  return http.createServer((req, res) => {
    if (req.method === "GET" && req.url === "/health") {
      res.writeHead(200, { "content-type": "application/json" });
      res.end(JSON.stringify({
        status: "ok",
        uptime_s: Math.floor(process.uptime()),
      }));
      return;
    }

    if (req.method === "GET" && req.url === "/") {
      res.writeHead(200, { "content-type": "text/plain" });
      res.end("ok");
      return;
    }

    res.writeHead(404, { "content-type": "text/plain" });
    res.end("not found");
  });
}

if (require.main === module) {
  const port = Number(process.env.PORT || 3000);
  createServer().listen(port, () => {
    console.log(`pingbox listening on ${port}`);
  });
}

module.exports = { createServer };
