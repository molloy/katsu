# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
	feature_slider = $('#feature_slider')
	navbar_fixed_top = $('.navbar-fixed-top')
	mapCanvas = $('#mapCanvas')	
	mapCanvas.height((feature_slider.height() - navbar_fixed_top.height()) * 0.9)

	# draw the feature slider
	if (feature_slider.length > 0)

		$(window).scroll ->
			if ($(".navbar").offset().top > 30)
				$(".navbar-fixed-top > .navbar-inner").addClass("sticky")
			else
				$(".navbar-fixed-top > .navbar-inner").removeClass("sticky")

		subfeature_happyhour_icon1 = $('.subfeature-happyhour-icon1')
		subfeature_happyhour_icon2 = $('.subfeature-happyhour-icon2')
		feature_left = $('.info').first().offset().left
		mapCanvas_top = navbar_fixed_top.height() + Math.round((feature_slider.height() - navbar_fixed_top.height() - mapCanvas.height()) / 2)

		feature_slider_carousel = feature_slider.carousel({ interval: 7000; })

		$('.left.carousel-control').click => feature_slider.carousel('prev')
		$('.right.carousel-control').click => feature_slider.carousel('next')
		subfeature_happyhour_icon1_animation_distance = (subfeature_happyhour_icon1.width() + feature_left)
		subfeature_happyhour_icon2_animation_distance = (Math.round(subfeature_happyhour_icon1.width()*0.75) + subfeature_happyhour_icon2.width() + feature_left)

		feature_slider_carousel.on slid: ->
			$('.active > .info').fadeIn()
			$('.active > .info-right').fadeIn()

			if (mapCanvas.parent().hasClass('active'))
				mapCanvas.offset({top: -(mapCanvas.height())})
				mapCanvas.animate top: "+=" + (mapCanvas.height() + mapCanvas_top) + "px", "slow"

			if (subfeature_happyhour_icon1.parent().hasClass('active'))
				subfeature_happyhour_icon1.offset({left: -(subfeature_happyhour_icon1.width())})
				subfeature_happyhour_icon1.animate left: "+=" + (subfeature_happyhour_icon1.width() + feature_left) + "px"

			if (subfeature_happyhour_icon2.parent().hasClass('active'))
				subfeature_happyhour_icon2.offset({left: -(subfeature_happyhour_icon2.width())})
				subfeature_happyhour_icon2.animate left: "+=" + (Math.round(subfeature_happyhour_icon1.width()*0.75) + subfeature_happyhour_icon2.width() + feature_left) + "px"

		feature_slider_carousel.on slide: -> 
			$('.info').fadeOut()
			$('.info-right').fadeOut()

			if (mapCanvas.parent().hasClass('active'))
				mapCanvas.animate top: "-=" + (mapCanvas.height() + mapCanvas_top) + "px", "slow"

			if (subfeature_happyhour_icon1.parent().hasClass('active'))
				subfeature_happyhour_icon1.animate left: "-=" + (subfeature_happyhour_icon1.width() + feature_left) + "px"

			if (subfeature_happyhour_icon2.parent().hasClass('active'))
				subfeature_happyhour_icon2.animate left: "-=" + (Math.round(subfeature_happyhour_icon1.width()*0.75) + subfeature_happyhour_icon2.width() + feature_left) + "px"
	else
		$(".navbar-fixed-top > .navbar-inner").addClass("sticky")

	# draw the map
	if (mapCanvas.length > 0)
		# alert('here')
		new google.maps.Geocoder().geocode { 'address': '302 Rosecrans Ave, Manhattan Beach, CA 90266' }, (results, status) ->

			if status == google.maps.GeocoderStatus.OK
				# mapCanvas = mapCanvas.get(0)
				mapCanvas2 = $('#mapCanvas2')

				position = results[0].geometry.location

				mapOptions =
					zoom: 15
					center: position
					mapTypeId: google.maps.MapTypeId.ROADMAP
				map = new google.maps.Map(mapCanvas.get(0), mapOptions)
				marker = new google.maps.Marker
					map: map
					position: position

				map2 = new google.maps.Map(mapCanvas2.get(0), mapOptions)
				marker2 = new google.maps.Marker
					map: map2
					position: position

			mapCanvas.offset({top: -(mapCanvas.height())})
			mapCanvas_top = navbar_fixed_top.height() + Math.round((feature_slider.height() - navbar_fixed_top.height() - mapCanvas.height()) / 2)
			mapCanvas.animate top: "+=" + (mapCanvas.height() + mapCanvas_top) + "px", "slow"

	# if ('#menu-tabs').length > 0
	# 	$('#menu-tabs a:not(.disabled)').click (e) ->
	# 		e.preventDefault()
	# 		$(this).tab('show')

	# coming soon for disabled menus
	# 	$('#menu-tabs a.disabled').click (e) ->
	# 		e.preventDefault()
	# 		$('#coming-soon-dialog').modal('show')

	if $('#menu').length > 0
		jQuery.getJSON 'static_pages/menudata.json', (data) ->
			for menupage, menupage_idx in data.menu.page
				is_tab_active = if menupage_idx > 0 then '' else 'active'
				is_pane_active = if menupage_idx > 0 then '' else ' active'
				$('#menu-tabs').append "<li class=" + is_tab_active + "><a href='#menu-" + menupage_idx + "'>" + menupage.tablabel + "</a></li>"
				new_tab_pane = 			"<div class='tab-pane " + is_pane_active + "' id='menu-" + menupage_idx + "'>"
				new_tab_pane += 			"<div class='container menu'>"
				new_tab_pane += 				"<div class='row'>"
				new_tab_pane += 					"<div class='span12 menu-title-container'>"
				if menupage.title
					new_tab_pane += 					"<p class='menu-title'>" + menupage.title + "</p>"
				if menupage.info
					new_tab_pane += 					"<p class='menu-subtitle'>" + menupage.info + "</p>"
				new_tab_pane += 					"</div>"
				new_tab_pane += 				"</div>"
				new_tab_pane += 			"<div class='row'>"
				if menupage.column
					for menucolumn in menupage.column
						menucolumn_span = if menucolumn.span then menucolumn.span else 1
						new_tab_pane += 		"<div class='span" + (menucolumn_span * 4) + "'>"
						if menucolumn.section
							for menusection, menusection_idx in menucolumn.section
								new_tab_pane += 	"<div class='row'>"
								new_tab_pane += 		"<div class='span" + (menucolumn_span * 4) + " menu-section-title'>"
								new_tab_pane += 			"<p>" + menusection.title + "</p>"
								new_tab_pane += 		"</div>	"
								new_tab_pane += 	"</div>"
								if menusection.item
									for menuitem, menuitem_idx in menusection.item
										if menuitem_idx == 0
											new_tab_pane += 	"<div class='row menu-line'>"
										else if (menuitem_idx % menucolumn_span == 0)
											new_tab_pane += 	"</div>"
											new_tab_pane += 	"<div class='row menu-line'>"

										new_tab_pane += 			"<div class='span" + (if menuitem.subprice then 4 else 3) + " menu-item'>"
										new_tab_pane += 				"<p>" + menuitem.name + "</p>"
										new_tab_pane += 			"</div>"

										if !menuitem.subprice
											new_tab_pane += 		"<div class='span1 menu-price'>"
											new_tab_pane += 			"<p>" + menuitem.price + "</p>"
											new_tab_pane += 		"</div>"
										else
											new_tab_pane += 	"</div>"
											new_tab_pane += 	"<div class='row'>"
											new_tab_pane += 		"<div class='span3 menu-item'>"
											new_tab_pane += 			"<ul>"
											for menusubprice_item in menuitem.subprice
												new_tab_pane += 			"<li>" + menusubprice_item.name + "</li>"
											new_tab_pane += 			"</ul>"
											new_tab_pane += 		"</div>"
											new_tab_pane += 		"<div class='span1 menu-price'>"
											new_tab_pane += 			"<ul>"
											for menusubprice_item in menuitem.subprice
												new_tab_pane += 			"<li>" + menusubprice_item.price + "</li>"
											new_tab_pane += 			"</ul>"
											new_tab_pane += 		"</div>"
									if menuitem_idx > 0
										new_tab_pane += 		"</div>"

						new_tab_pane += 		"</div>"
				new_tab_pane += 			"</div>"
				new_tab_pane += 		"</div>"

				$('#menu-tab-panes').append new_tab_pane

				# draw pane contents


		$(document).on 'click', '#menu-tabs a:not(.disabled)', (e) ->
			e.preventDefault()
			$(this).tab('show')
