# v-http-server-benchmark

Comparison of performance - requests per second - using V HTTP server, text, JSON, PostgreSQL query results.

## Requirements

* [V](https://github.com/vlang/v)

## Results

`main.v` uses default module `net.http` but it listens on IPv6. [autocannon](https://www.npmjs.com/package/autocannon) and [hey](https://github.com/rakyll/hey) did not work with that.

`vweb.v` used HTTP framework `vweb` but it does not look stable! :(
