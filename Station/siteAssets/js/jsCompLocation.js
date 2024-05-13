
google.maps.event.addDomListener(window, "load", function () {
    //**************Company Location**************//
    var $compLatitude = $("#loc_Latitude").html();
    var $compLongitude = $("#loc_Longitude").html();
    GetCompLocation($compLatitude, $compLongitude);
    //**************Get Branches **************//
    GetBranchLocation();
});

function GetCompLocation(compLatitude, compLongitude) {
    var map = new google.maps.Map(document.getElementById("map_div"), {
        center: new google.maps.LatLng(compLatitude, compLongitude),
        zoom: 16,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    });

    var infoWindow = new google.maps.InfoWindow();

    function createMarker(options, html) {
        var marker = new google.maps.Marker(options);
        if (html) {
            google.maps.event.addListener(marker, "click", function () {
                infoWindow.setContent(html);
                infoWindow.open(options.map, this);
            });
        }
        return marker;
    }

    var marker0 = createMarker({
        position: new google.maps.LatLng(compLatitude, compLongitude),
        map: map,
        //icon: "http://1.bp.blogspot.com/_GZzKwf6g1o8/S6xwK6CSghI/AAAAAAAAA98/_iA3r4Ehclk/s1600/marker-green.png"
        //icon: "../../SiteAssets/images/marker-green.png"
    }, "<div style='margin: 10px;'><h5>" + $("#companyName").html() + "<br/><h6>الفرع الرئيسي<br/>" + $("#companyAddress").html() + "</h6></h5></div>");

    //var marker1 = createMarker({
    //    position: new google.maps.LatLng(compLatitude, compLongitude),
    //    map: map
    //}, "<h3>" + $("#compName").html() + "</h3>");
    //var marker2 = createMarker({
    //    position: new google.maps.LatLng(compLatitude, compLongitude),
    //    map: map
    //}, "<h1>Marker 2</h1><p>This is marker 2</p>");
}

function GetBranchLocation() {
    $.ajax({
        type: "POST",
        url: "../../web/site/contact.aspx/GetBranches",
        //data: "{itemId:'" + itemId + "'}",
        contentType: "application/json; charset=utf-8",
        cache: false,
        dataType: "json",
        success: function (response) {
            let data = JSON.parse(response.d);
            var output = "";
            data.map(loc => {
                output += ` <div class="col-lg-3">
                            <div class="contact-map"><h6>${loc.BranchName}</h6>
                                    <span id="br_Lat-${loc.Id}" class="hide">${loc.Loc_Latitude}</span>
                                    <sapn id="br_Long-${loc.Id}" class="hide">${loc.Loc_Longitude}</sapn>
                                    <div id="map_div-${loc.Id}" style="height: 200px;"></div>
                                    <script>
                                        var map = new google.maps.Map(document.getElementById("map_div-${loc.Id}"), {
                                            center: new google.maps.LatLng(${loc.Loc_Latitude}, ${loc.Loc_Longitude}),
                                            zoom: 14,
                                            mapTypeId: google.maps.MapTypeId.ROADMAP
                                        });
                                        var infoWindow = new google.maps.InfoWindow();
                                        function createMarker(options, html) {
                                        var marker = new google.maps.Marker(options);
                                        if (html) {
                                            google.maps.event.addListener(marker, "click", function () {
                                                infoWindow.setContent(html);
                                                infoWindow.open(options.map, this);
                                            });
                                        }
                                        return marker;
                                        }
                                        var marker = createMarker({
                                            position: new google.maps.LatLng(${loc.Loc_Latitude}, ${loc.Loc_Longitude}),
                                            map: map,
                                            //icon: "../../SiteAssets/images/marker-green.png"
                                        }, "<div style='margin: 10px;'><h5>" + $("#companyName").html() + "<br/><h6>${loc.BranchName}</h6></h5></div>");
                                    </script>
                                </div>
                                </div>
                        <!--<div class="col-lg-3">
                                <div class="branch-card">
                                    <img src="../../SiteAssets/images/map.jpg" alt="branch">
                                    <div class="branch-overlay">
                                        <h3>${loc.BranchName}</h3>
                                        <p>${loc.BranchMobile}</p>
                                        <p>${loc.BranchAddress}</p>
                                    </div>
                                </div>
                            </div>-->`;
            });

            $('#mapCard').html("");
            $('#mapCard').html(output);
        },
        error: function (response) {
            var r = jQuery.parseJSON(response.responseText);
            alert("Message: " + r.Message);
        }
    });
}
