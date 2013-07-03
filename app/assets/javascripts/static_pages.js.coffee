# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
	if ($('#feature_slider').length > 0)
	    $(window).scroll ->
	        if ($(".navbar").offset().top>30)
	            $(".navbar-fixed-top > .navbar-inner").addClass("sticky")
	        else
	            $(".navbar-fixed-top > .navbar-inner").removeClass("sticky")

		feature_slider = $('#feature_slider').carousel({
			interval: 7000;
		});

		$('.left.carousel-control').click => $('#feature_slider').carousel('prev')
		$('.right.carousel-control').click => $('#feature_slider').carousel('next')
		feature_slider.on slid: ->
			$('.active > .info').fadeIn()
			$('.active > .info-right').fadeIn()
			if (!$('#mapCanvas').is(":hidden"))
				$('#mapCanvas').animate top: "+=460px", "slow"

		feature_slider.on slide: -> 
			$('.info').fadeOut()
			$('.info-right').fadeOut()
			if $('#mapCanvas').is(":visible")
				$('#mapCanvas').animate top: "-=460px", "slow"

	if ($('#feature_slider').length == 0)
		$(".navbar-fixed-top > .navbar-inner").addClass("sticky")


	if ($('#mapCanvas').length > 0)
		new google.maps.Geocoder().geocode { 'address': '302 Rosecrans Ave, Manhattan Beach, CA 90266' }, (results, status) ->
			if status == google.maps.GeocoderStatus.OK
				mapCanvas = $('#mapCanvas').get(0)
				mapCanvas2 = $('#mapCanvas2').get(0)

				position = results[0].geometry.location

				mapOptions =
					zoom: 15
					center: position
					mapTypeId: google.maps.MapTypeId.ROADMAP
				map = new google.maps.Map(mapCanvas, mapOptions)
				marker = new google.maps.Marker
					map: map
					position: position

				map2 = new google.maps.Map(mapCanvas2, mapOptions)
				marker2 = new google.maps.Marker
					map: map2
					position: position

				$('#mapCanvas').animate top: "+=460px", "slow" if $('#mapCanvas').position().top <= '-360'