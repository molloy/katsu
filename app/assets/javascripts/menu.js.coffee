# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
	$(document).on 'click', '#menu-tabs a:not(.disabled)', (e) ->
		e.preventDefault()
		$(this).tab('show')
		$.ajax {
			url: $(this).attr('data-showurl')
		}

	$(document).on 'click', '.menu-delete-column, .menu-delete-section, .menu-delete-item, .menu-delete-price', (e) ->
		e.preventDefault()
		prev_node = $(this).prev()
		if prev_node.attr('type') == 'hidden'
			prev_node.val('true')
			$(this).closest('[class^=menu-container]').hide()

		if $(this).closest('[class^=menu-container]').parent().find('.menu-container-price') && ($(this).closest('.menu-container-price').parent().find('.menu-container-price:visible').length < 2)
			$(this).closest('.menu-container-price').parent().find('button').show();
