scriptencoding utf-8

function! unite#sources#u_nya_#define()
	return s:source
endfunction

let s:source = {
\	"name" : "moo",
\	"description" : "スーパー牛さんパワー",
\	"moo__counter" : 0
\}

let s:source = {
\	"name" : "u-nya-",
\	"description" : "(」・ω・)」うー！(／・ω・)／にゃー！",
\	"u_nya__counter" : 0,
\	"u_nya__cache" : ""
\}

function! s:source.async_gather_candidates(args, context)
	let u = "(」・ω・)」".get(a:args, 0, "うー")."！"
	let nya = "(／・ω・)／".get(a:args, 1, "にゃー")."！\n"
	let a:context.source.unite__cached_candidates = []
	let self.u_nya__cache .= (self.u_nya__counter % 2 == 0 ? u : nya)
	let self.u_nya__counter += 1

	return map(split(copy(self.u_nya__cache), '\n'), '{ "word" : v:val }')
endfunction



