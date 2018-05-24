/**
 * http://usejsdoc.org/
 */
var map;
var midas = {lat:37.400872, lng: 127.101356};

function initMap() {
    var cen ={lat:37.400872, lng: 127.101356};
	map = new google.maps.Map(document.getElementById('googlemap'), {
		center : cen,
		zoom: 17
	});
	marker = new google.maps.Marker({
		position : cen,
		map: map
	});
}