class Wherefolio.Views.ProjectsIndex extends Backbone.View
  initialize: ->
    _.bindAll @
    @initializeMap()
  
  initializeMap: ->
    map = new OpenLayers.Map "map"
    wms = new OpenLayers.Layer.WMS(
      "OpenLayers WMS", 
      "http://vmap0.tiles.osgeo.org/wms/vmap0", 
      layers: "basic"
    )
    vectorLayer = new OpenLayers.Layer.Vector "Overlay"
    feature = new OpenLayers.Feature.Vector(
      new OpenLayers.Geometry.Point -121.954185282518, 37.2803465074717
      some: "Campbell, CA"
    )
    vectorLayer.addFeatures feature
    map.addLayer vectorLayer
    map.addLayers [wms]
    map.setCenter(new OpenLayers.LonLat(-121.954185282518, 37.2803465074717), 6)
  
  events: 
    "click .js-new-project": "newProjectModal"
  
  newProjectModal: (event) ->
    event.preventDefault()
    $("#newProjectModal").modal('show')