var nyc_buidings_extent =
  [983837.625, 207499.46875,
  991858.9375, 218794.359375];

var vectorSource = new ol.source.Vector();
var vector = new ol.layer.Vector({
  source: vectorSource,
  style: new ol.style.Style({
    stroke: new ol.style.Stroke({
      color: 'rgba(0, 0, 255, 1.0)',
      width: 1
    })
  })
});

var features;
var formatWFS = new ol.format.WFS();
var featureRequest = new ol.format.WFS().writeGetFeature({
  srsName: 'EPSG:2908',
  featureNS: 'http://geoserver.org/nyc',
  featurePrefix: 'nyc',
  featureTypes: ['nyc_buildings_1'],
  outputFormat: 'application/json'
});


fetch('http://localhost:8080/geoserver/wfs', {
  method: 'POST',
  //crossDomain: true,
  body: new XMLSerializer().serializeToString(featureRequest)
}).then(function(response) {
  return response.json();
}).then(function(json) {
  features = new ol.format.GeoJSON().readFeatures(json);
  vectorSource.addFeatures(features);
  map.getView().fit(vectorSource.getExtent());
});


var layers = [
  vector
];
var projection = new ol.proj.Projection({
    code: 'EPSG:2908',
    units: 'm',
    axisOrientation: 'neu'
});
var map = new ol.Map({
  layers: layers,
  target: 'map'
});

var interaction;
var interactionDraw = new ol.interaction.Draw({
  source: vector.getSource(),
  type: 'MultiPolygon'
})
var interactionSelect = new ol.interaction.Select({
  style: new ol.style.Style({
    stroke: new ol.style.Stroke({
      color: '#FF2828'
    })
  })
  //layers: layers
});
var interactionModify = new ol.interaction.Modify({
  features: interactionSelect.getFeatures()
});
var interactionSnap = new ol.interaction.Snap({
  source: vectorSource
});


var formatGML = new ol.format.GML({
  projection: projection,
  featureNS : 'http://geoserver.org/nyc',
  //featurePrefix: 'nyc',
  featureType: 'nyc_buildings_1'

});

var xmlSerializer = new XMLSerializer();

var transactWFS = function(mode, feature) {
  var request;
  switch (mode) {
    case 'insert':
      try{
        //console.log("IN");
        //console.log("axis: "+ol.proj.get(projection).getAxisOrientation());
        request = formatWFS.writeTransaction([feature], null, null, formatGML);

      }
      catch(exception) {
        console.log(exception);
      }
      break;
    case 'update':
      //console.log("In transactWFS: feature: "+feature);
      request = formatWFS.writeTransaction(null, [feature], null, formatGML);
      console.log("In transactWFS: feature: "+feature);
      break;
    case 'delete':
      request = formatWFS.writeTransaction(null, null, [feature], formatGML);
      break;
  }
  var serializedRequest = xmlSerializer.serializeToString(request);
  console.log(serializedRequest);
  $.ajax('http://localhost:8080/geoserver/wfs', {
    service: 'WFS',
    type: 'POST',
    dataType: 'xml',
    processData: false,
    contentType: 'text/html',
    data: serializedRequest
  }).done(function() {
    vectorSource.clear();
    vectorSource.addFeatures(features);
  })
};

//map.addInteraction(selectInteraction);
//map.addInteraction(modifyInteraction);
//map.addInteraction(drawInteraction);

/*dirty = {};
selectInteraction.getFeatures().on('add', function(addedFeature){
  addedFeature.on('change', function(addedFeature){
    dirty[addedFeature.target.getId()] = true;
  })
});

selectInteraction.getFeatures().on('remove', function(removedFeature){
  var feature = removedFeature.target();
  if(feature.getId()) {
    delete dirty[feature.getId()];
    var featureProperties = feature.getProperties();
    delete featureProperties.boundedBy;
    var clone = new ol.Feature(featureProperties);
    clone.setId(feature.getId());
    transactWFS('update', clone);

  }
});*/
var view = new ol.View({
  //center: [0,0],
  zoom: 100,
  //extent: extent
  projection: projection
});

map.setView(view);
map.getView().fit(nyc_buidings_extent, map.getSize());
//map.getView().setZoom(100);
//map.getView().fit(extent, map.getSize());
//map.getView().setExtent(extent);

$('button').click(function() {
  $(this).siblings().removeClass('btn-active');
  $(this).addClass('btn-active');
  map.removeInteraction(interaction);
  interactionSelect.getFeatures().clear();
  map.removeInteraction(interactionSelect);

  switch ($(this).attr('id')) {
    case 'btnEdit':
      map.addInteraction(interactionSelect);
      interaction = new ol.interaction.Modify({
        features: interactionSelect.getFeatures()
      });
      map.addInteraction(interaction);
      map.addInteraction(interactionSnap);
      dirty = {}
      interactionSelect.getFeatures().on('add', function(addedFeature){
        addedFeature.element.on('change', function(addedFeature){
          dirty[addedFeature.target.getId()] = true;
          console.log("dirtyChangeFeature: " +addedFeature.target);
        })
      });
      interactionSelect.getFeatures().on('remove', function(removedFeature){
        console.log("dirtyRemoved: ");
        console.log("Id feature: " +removedFeature.element.getId());
        console.log("Properties: " +removedFeature.element.getProperties());
        var feature = removedFeature.element;
        if(feature.getId()) {
          delete dirty[feature.getId()];
          var featureProperties = feature.getProperties();
          delete featureProperties.boundedBy;
          var clone = new ol.Feature(featureProperties);
          clone.setId(feature.getId());
          feature.set('bin',0);
          clone.set('geometry', feature.getGeometry());
          //transactWFS('update', feature);

          transactWFS('update', clone);

        }
      });
      break;
    case 'btnAdd':
      map.removeInteraction(interaction);
      interaction = interactionDraw;
      interaction.on('drawend', function(element){
        var feature = element.feature;
        feature.set('bin',0);
        feature.set('geometry', feature.getGeometry());
        console.log("geometry: "+feature.getGeometry());
        transactWFS('insert', feature);
        //transaction(element.feature, 'http://localhost:8080/geoserver/wfs');
      });
      map.addInteraction(interaction);

      break;
    case 'btnDelete':
      map.removeInteraction(interaction);

      interactionSelect.getFeatures().on('add', function(toDelete){
        var feature = toDelete.element;
        console.log(feature);
        transactWFS('delete', feature);
      });
      interaction = interactionSelect;
      map.addInteraction(interaction);
      break;
    case 'btnDetail':
      map.removeInteraction(interaction);
      interaction = interactionSelect;
      interactionSelect.getFeatures().on('add', function(toDelete){
        var feature = toDelete.element;
        var attributs = feature.get('bin');
        console.log(attributs);
        transactWFS('delete', feature);
      });
      map.addInteraction(interaction);
      break;
  }
});
