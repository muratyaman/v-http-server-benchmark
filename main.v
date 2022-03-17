module main

import net.http { CommonHeader, Request, Response, Server }
import os
import time

struct MyHandler {}

fn (h MyHandler) handle(req Request) Response {
  mut res := Response{
    header: http.new_header_from_map({
      CommonHeader.content_type: 'text/plain'
    })
  }
  mut status_code := 200
  res.text = match req.url {
    '/' {
      'hello world\n'
    }
    else {
      status_code = 404
      'Not found\n'
    }
  }
  res.status_code = status_code
  return res
}

fn main() {
  println(os.args)
  now := time.now()
  println(now)
  mut server := Server{
    handler: MyHandler{}
  }
  // NOTE: listens using IPv6
  server.listen_and_serve() ?
}
