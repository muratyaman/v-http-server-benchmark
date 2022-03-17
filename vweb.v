module main

import time
import vweb

const (
	port = 8080
)

struct App {
	vweb.Context
mut:
	state shared State
}

struct State {
mut:
	cnt int
}

fn main() {
	println('vweb example')
	vweb.run(&App{}, port)
}

['/text']
pub fn (mut app App) text_response() vweb.Result {
	return app.text('hello world')
}

['/json']
pub fn (mut app App) json_response() vweb.Result {
	return app.json({
		'ts': time.now()
	})
}

pub fn (mut app App) show_text() vweb.Result {
	return app.text('Hello world from vweb')
}
