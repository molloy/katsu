$('.tab-pane.active').empty()
$('<%= escape_javascript(render(partial: "form", locals: { menu_page: @menu_page })) %>').appendTo('.tab-pane.active').hide().fadeIn()
