module MenuHelper
	def add_menu_price_button(form, price_count)
	    menu_price_partial = escape_javascript( render(:partial => "menu_price", locals: { mi: form, create_new_record: true }) )

	    functionHTML = <<-HEREDOC
		var new_index = new Date() * 1 + parseInt(Math.random()*100000);
		var new_menu_price_html = '#{menu_price_partial}';
		var new_menu_price_name = '\[menu_prices_attributes\]\[' + new_index + '\]';
		var new_menu_price_id = 'menu_prices_attributes_' + new_index;
		new_menu_price_html = new_menu_price_html
			.replace(/\\[menu_prices_attributes\\]\\[\\d+\\]/g, new_menu_price_name)
			.replace(/menu_prices_attributes_\\d+/g, new_menu_price_id);
		$(new_menu_price_html).insertBefore($(this));

		if ($(this).parent().find('.menu-container-price:visible').length > 1) {
			$(this).hide();
		}

		var firstchild = $(this).prev().find('input:first-child');
		firstchild.focus();
	    HEREDOC
	    
	    button_to_function 'Add Price', functionHTML, style: ((price_count > 1) ? 'display: none;' : '')
	end

	def add_menu_item_button(form)
	    menu_item_partial = escape_javascript( render(partial: 'menu_item', locals: { ms: form, create_new_record: true }) )

	    functionHTML = <<-HEREDOC
		var new_index = new Date() * 1 + parseInt(Math.random()*100000);
		var new_menu_item_html = '#{menu_item_partial}';
		var new_menu_item_name = '\[menu_items_attributes\]\[' + new_index + '\]';
		var new_menu_item_id = 'menu_items_attributes_' + new_index;
		new_menu_item_html = new_menu_item_html
			.replace(/\\[menu_items_attributes\\]\\[\\d+\\]/g, new_menu_item_name)
			.replace(/menu_items_attributes_\\d+/g, new_menu_item_id);
		$(new_menu_item_html).insertBefore($(this));

		var firstchild = $(this).prev().find('input[type="text"]');
		firstchild.first().focus();
	    HEREDOC

	    button_to_function 'Add Menu Item', functionHTML
	end

	def add_menu_section_button(form)
	    menu_section_partial = escape_javascript( render(:partial => "menu_section", locals: { mc: form, create_new_record: true }) )

	    functionHTML = <<-HEREDOC
		var new_index = new Date() * 1 + parseInt(Math.random()*100000);
		var new_menu_section_html = '#{menu_section_partial}';
		var new_menu_section_name = '\[menu_sections_attributes\]\[' + new_index + '\]';
		var new_menu_section_id = 'menu_sections_attributes_' + new_index;
		new_menu_section_html = new_menu_section_html
			.replace(/\\[menu_sections_attributes\\]\\[\\d+\\]/g, new_menu_section_name)
			.replace(/menu_sections_attributes_\\d+/g, new_menu_section_id);
		$(new_menu_section_html).insertBefore($(this));

		var firstchild = $(this).prev().find('input[type="text"]');
		firstchild.first().focus();
	    HEREDOC
	    
	    button_to_function 'Add Menu Section',functionHTML
	end

	def add_menu_column_button(form)
	    menu_column_partial = escape_javascript( render(:partial => "menu_column", locals: { mp: form, create_new_record: true }) )

	    functionHTML = <<-HEREDOC
		var new_index = new Date() * 1 + parseInt(Math.random()*100000);
		var new_menu_column_html = '#{menu_column_partial}';
		var new_menu_column_name = '\[menu_columns_attributes\]\[' + new_index + '\]';
		var new_menu_column_id = 'menu_columns_attributes_' + new_index;
		new_menu_column_html = new_menu_column_html
			.replace(/\\[menu_columns_attributes\\]\\[\\d+\\]/g, new_menu_column_name)
			.replace(/menu_columns_attributes_\\d+/g, new_menu_column_id);
		$(new_menu_column_html).insertBefore($(this));

		var firstchild = $(this).prev().find('input[type="text"]');
		firstchild.first().focus();
	    HEREDOC
	    
	    button_to_function 'Add Menu Column',functionHTML
	end
end
