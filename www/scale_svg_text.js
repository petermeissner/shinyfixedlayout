// initial resize 
setTimeout(function() {
    $('svg').each(function() {
      var svg  = $(this);
      var text = svg.find('text');
      var bbox = text.get(0).getBBox(); 
      
      bbox.x      = Math.floor(bbox.x);
      bbox.y      = Math.floor(bbox.y);
      bbox.width  = Math.floor(bbox.width);
      bbox.heihgt = Math.floor(bbox.height);
      
    svg.get(0).setAttribute(
      'viewBox', 
      [bbox.x,
       bbox.y,
       bbox.width,
       bbox.height].join(' ')
    );
  });
}, 1000);

// resize triggered by window resizing
$( window ).resize(
  function() {
    $('svg').each(function() {
      var svg  = $(this);
      var text = svg.find('text');
      var bbox = text.get(0).getBBox(); 
      
      bbox.x      = Math.floor(bbox.x);
      bbox.y      = Math.floor(bbox.y);
      bbox.width  = Math.floor(bbox.width);
      bbox.heihgt = Math.floor(bbox.height);
      
    svg.get(0).setAttribute(
      'viewBox', 
      [bbox.x,
       bbox.y,
       bbox.width,
       bbox.height].join(' ')
    );
  });
});
