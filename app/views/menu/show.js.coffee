$('.tab-pane.active').empty()
$('#menu-tabs .active a').html('<%= @menu_page.tab %>')
$('<%= escape_javascript(render("show")) %>').appendTo('.tab-pane.active').hide().fadeIn()