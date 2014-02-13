showMessages = (->
	st =
		'button'	: 	'button'
		'body'		:	'body'
		'showMessages' : '.showMessages'
	dom = {}
	catchDom = ->
		dom.button = $(st.button)
		dom.body = $(st.body)
		return
	suscribeEvents = ->
		dom.button.on 'click' , showMessage
		return
	showMessage = (evet) ->
		$contentHtml = $('<div class="showMessages"><p>Que tengas un buen dia</p><a href="javascript:;">X</a></div>')
		dom.body.append($contentHtml).addClass('overflow')
		$(st.showMessages).animate(
			'marginBottom' : '-10px', ->
				$(st.showMessages).animate(
					'marginBottom' : '-20px'
				)
		)
		closeMessages()
		return
	closeMessages = ->
		$('.showMessages a').on 'click', ->
			$(st.showMessages).animate(
				'marginBottom' : '0px', ->
					$(st.showMessages).animate(
						'marginBottom' : '-80px', ->
							$(st.showMessages).remove()
							return
					)
			)
			dom.body.removeClass 'overflow'
	initialize = ->
		catchDom()
		suscribeEvents()
		return
	return {
		init : initialize
	}
)()

$(document).on 'ready', ->
	showMessages.init()
	return

