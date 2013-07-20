module MenuHelper
	def add_menu_price_button(form, price_count)
		add_menu_price_id = 'add_menu_price' + rand(Time.now.to_i).to_s
	    inputHTML = button_tag('Add Price', id: add_menu_price_id, type: 'button', style: (price_count > 1) ? 'display: none;' : '')
	    menu_price_partial = escape_javascript( render(:partial => "new_menu_price", locals: { f: form }) )
	    scriptHTML = <<-HEREDOC
	    <script>
	    $(document).ready(function() {
	    	$('##{add_menu_price_id}').click(function() {
	    		var new_index = new Date() * 1 + parseInt(Math.random()*100000);
	    		var new_menu_price_html = '#{menu_price_partial}';
	    		var new_menu_price_name = 'menu_item\[menu_prices_attributes\]\[' + new_index + '\]';
	    		var new_menu_price_id = 'menu_item_menu_prices_attributes_' + new_index;
	    		new_menu_price_html = new_menu_price_html
	    			.replace(/menu_item\\[menu_prices_attributes\\]\\[\\d+\\]/g, new_menu_price_name)
	    			.replace(/menu_item_menu_prices_attributes_\\d+/g, new_menu_price_id);
	    		$(new_menu_price_html).insertBefore($(this));

				if ($('##{add_menu_price_id}').parent().find('.menu-price:visible').length >= 2) {
					$('##{add_menu_price_id}').hide();
				}
	    	});
	    });
	    </script>
	    HEREDOC
	    
	    raw(inputHTML) << raw(scriptHTML);
	end

	def add_menu_item_button(form)
		add_menu_item_id = 'add_menu_item' + rand(Time.now.to_i).to_s
	    inputHTML = button_tag('Add Menu Item', id: add_menu_item_id, type: 'button')
	    menu_item_partial = escape_javascript( render(:partial => "new_menu_item", locals: { f: form }) )

	    scriptHTML = <<-HEREDOC
	    <script>
	    $(function() {
	    	$('##{add_menu_item_id}').click(function() {
	    		var new_index = new Date() * 1 + parseInt(Math.random()*100000);
	    		var new_menu_item_html = '#{menu_item_partial}';
	    		var new_menu_item_name = 'menu_item\[menu_items_attributes\]\[' + new_index + '\]';
	    		var new_menu_item_id = 'menu_item_menu_items_attributes_' + new_index;
	    		new_menu_item_html = new_menu_item_html
	    			.replace(/menu_item\\[menu_items_attributes\\]\\[\\d+\\]/g, new_menu_item_name)
	    			.replace(/menu_item_menu_items_attributes_\\d+/g, new_menu_item_id);
	    		$(new_menu_item_html).insertBefore($(this));
	    	});
	    });
	    </script>
	    HEREDOC
	    
	    raw(inputHTML) << raw(scriptHTML);
	end

	def add_menu_section_button(form)
		add_menu_section_id = 'add_menu_section' + rand(Time.now.to_i).to_s
	    inputHTML = button_tag('Add Menu Section', id: add_menu_section_id, type: 'button')
	    menu_section_partial = escape_javascript( render(:partial => "new_menu_section", locals: { f: form }) )

	    scriptHTML = <<-HEREDOC
	    <script>
	    $(document).ready(function() {
	    	$('##{add_menu_section_id}').click(function() {
	    		var new_index = new Date() * 1 + parseInt(Math.random()*100000);
	    		var new_menu_section_html = '#{menu_section_partial}';
	    		var new_menu_section_name = 'menu_section\[menu_sections_attributes\]\[' + new_index + '\]';
	    		var new_menu_section_id = 'menu_section_menu_sections_attributes_' + new_index;
	    		new_menu_section_html = new_menu_section_html
	    			.replace(/menu_section\\[menu_sections_attributes\\]\\[\\d+\\]/g, new_menu_section_name)
	    			.replace(/menu_section_menu_sections_attributes_\\d+/g, new_menu_section_id);
	    		$(new_menu_section_html).insertBefore($(this));
	    	});
	    });
	    </script>
	    HEREDOC
	    
	    raw(inputHTML) << raw(scriptHTML);
	end
end
