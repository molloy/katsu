$('.tab-pane.active').empty()
active_tab = $('#menu-tabs .active a')
active_tab.html('<%= @menu_page.tab %>')
active_tab.attr('data-showurl', '<%= menu_path(@menu_page) %>')
if active_tab.hasClass('new-menu-page')
	active_tab.removeClass('new-menu-page')
	$('#menu-tabs').append('<%= escape_javascript(render(partial: 'tab', locals: { menu_page_id: (1 + Time.now.to_i ) })) %>')
	$('#menu-tab-panes').append('<%= escape_javascript(render(partial: 'tab_pane', locals: { menu_page_id: (1 + Time.now.to_i ) })) %>')

$('<%= escape_javascript(render(partial: "show", locals: { menu_page: @menu_page })) %>').appendTo('.tab-pane.active').fadeIn()