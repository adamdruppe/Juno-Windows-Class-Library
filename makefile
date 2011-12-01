DEPS=juno\base\collections.d juno\base\core.d juno\base\environment.d juno\base\events.d juno\base\math.d juno\base\native.d juno\base\string.d juno\base\text.d juno\base\threading.d juno\base\time.d juno\locale\constants.d juno\locale\convert.d juno\locale\core.d juno\locale\numeric.d juno\locale\text.d juno\locale\time.d juno\io\core.d juno\io\filesystem.d juno\io\path.d juno\io\zip.d juno\com\core.d juno\com\client.d juno\com\server.d juno\com\bstr.d juno\com\reflect.d juno\xml\core.d juno\xml\xsl.d juno\xml\msxml.d juno\xml\streaming.d juno\net\all.d juno\net\core.d juno\net\client.d juno\security\crypto.d juno\utils\process.d juno\utils\registry.d juno\media\constants.d juno\media\geometry.d juno\media\core.d juno\media\imaging.d juno\media\native.d

juno: juno.lib juno/juno.args

dom.obj: juno/xml/dom.d
	dmd -c juno/xml/dom.d
mail.obj: juno/net/mail.d
	dmd -c juno/net/mail.d
juno.lib: dom.obj mail.obj $(DEPS)
	dmd -lib -ofjuno.lib $(args) @juno/juno.args dom.obj mail.obj

events: juno examples/com/events.d
	dmd $(args) examples/com/events.d juno.lib -Ijuno
latebinding: juno examples/com/latebinding.d
	dmd $(args) examples/com/latebinding.d juno.lib -Ijuno
messagebeep: juno
	dmd $(args) examples/dll/messagebeep.d juno.lib -Ijuno
relativepath: juno
	dmd $(args) examples/dll/relativepath.d juno.lib -Ijuno
