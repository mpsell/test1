<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CCTV._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?v=3&amp;language=th-TH&amp;&sensor=false" type="text/javascript"></script>
        <!--<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyC2xyhmwAnRXWqiTc56gfnsUc41gA3oxuk&v=3&amp;language=th-TH&amp;sensor=false"></script>-->
        
        <!-- bootstrap -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <script type="text/javascript">
        // check DOM Ready
        $(document).ready(function() {
            // execute
            (function() {
                // map options
                var options = {
                    /*
                    zoom: 5,
                    center: new google.maps.LatLng(39.909736, -98.522109), // centered US
                    mapTypeId: google.maps.MapTypeId.TERRAIN,
                    mapTypeControl: false
                    */
                    zoom: 5,
                    scrollwheel: true,
                    center: new google.maps.LatLng(13.768679, 100.551333),
                    //mapTypeId: google.maps.MapTypeId.ROADMAP                    mapTypeId: google.maps.MapTypeId.TERRAIN
                };

                // init map
                var map = new google.maps.Map(document.getElementById('map_canvas'), options);

                // set traffic
                var trafficLayer = new google.maps.TrafficLayer();
                trafficLayer.setMap(map);

                // NY and CA sample Lat / Lng
                var southWest = new google.maps.LatLng(13.868679, 100.751333);
                var northEast = new google.maps.LatLng(13.568679, 100.351333);
                var lngSpan = northEast.lng() - southWest.lng();
                var latSpan = northEast.lat() - southWest.lat();

                //debugger;
                // set icon
                var image = new google.maps.MarkerImage('http://www.bmatraffic.com/images/pin-right.png',
                            new google.maps.Size(32, 42),
                            new google.maps.Point(0, 0));

                var objData = cctvData;
                debugger;
                // set multiple marker
                for (var i = 0; i < objData.length; i++) {
                                        // init markers  LocationName
                    var marker = new google.maps.Marker({
                        //position: new google.maps.LatLng(southWest.lat() + latSpan * Math.random(), southWest.lng() + lngSpan * Math.random()),
                        position: new google.maps.LatLng(objData[i].latitude, objData[i].longitude),
                        map: map,
                        icon: image,
                        title: objData[i].LocationName
                    });

                    // process multiple info windows
                    (function(marker, i) {
                        // add click event
                        google.maps.event.addListener(marker, 'click', function() {
                            infowindow = new google.maps.InfoWindow({
                                content: objData[i].LocationName
                            });
                            infowindow.open(map, marker);
                        });
                    })
                    (marker, i);
                }

                // This event listener will call addMarker() when the map is clicked.
                map.addListener('rightclick', function (event) {
                    var lat = event.latLng.lat();
                    var lng = event.latLng.lng();
                    addMarker(event.latLng);
                });

                // Adds a marker at the center of the map.
                addMarker(haightAshbury);

                // Adds a marker to the map and push to the array.
                function addMarker(location) {
                    /*
                    var marker = new google.maps.Marker({
                        position: location,
                        map: map,
                        icon: image
                    });
                    markers.push(marker);
                    */
                    createSymbol(location)
                }

                function createSymbol(resultdata) {

                    //for (var i = 0; i < resultdata.length; i++) {
                    var placeLoc = resultdata;
                    var lat = resultdata.lat();
                    var lng = resultdata.lng();
                    var image = new google.maps.MarkerImage('http://www.bmatraffic.com/images/pin-right.png',
                            new google.maps.Size(40, 40),
                            new google.maps.Point(0, 0));
                    var marker = new google.maps.Marker({
                        draggable: false,
                        position: placeLoc,
                        map: map,
                        icon: image,
                        //shadow: shadow,
                        title: '',
                        zIndex: 333
                    });
                    marker.setMap(map);
                    var str = "123456";                    var contentString = "<b>Add CCTV</b> <br/> Location Name : <input type='text' class='form-control' id='location_ID'>" +                        "Location Desc : <input type='text' class='form-control' id='location_desc'>" +                        "CameraID : <input type='text' class='form-control' id='CameraID'>" +                        "<button type='button' class='btn btn-warning' onclick='saveMark(" + lat + "," + lng + ");'>Save</button>";                    infowindow = new google.maps.InfoWindow({
                        content: contentString
                    });                    infowindow.open(map, marker);

                    //}
                }

            })();
        });
        </script>

    <div class="jumbotron">
        <h1>ASP.NET</h1>
        <p class="lead">ASP.NET is a free web framework for building great Web sites and Web applications using HTML, CSS, and JavaScript.</p>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Getting started</h2>
            <p>
                ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
            A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Get more libraries</h2>
            <p>
                NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Web Hosting</h2>
            <p>
                You can easily find a web hosting company that offers the right mix of features and price for your applications.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>
            
        </div>
        
    </div>
    <div id="map_canvas" style="width: 1000px; height:600px;"></div>

    <script>
        function saveMark(lat,lng) {
            debugger;
            alert(lat + "," + lng + "/" + $("#location_ID").val());
        }


        var cctvData = [{
            "latitude": "13.847147121486968",
            "longitude": "100.73941039619967",
            "LocationName" : "คลองสามวา"

        }, {
            "latitude": "13.815143800738266",
            "longitude": "100.46200559008867",
            "LocationName": "ตลิ่งชัน"

        }, {
            "latitude": "13.635043515668912",
            "longitude": "100.61306760180742",
            "LocationName": "บางนา"

        }, {
            "latitude": "13.580319095752516",
            "longitude": "100.46887204516679",
            "LocationName": "บางขุนเทียน"

        }];
    </script>
</asp:Content>
