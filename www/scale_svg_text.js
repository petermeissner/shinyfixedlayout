// initial resize 
setTimeout(function() {
    $('svg').each(function() {
      var svg  = $(this);
      var text = svg.find('text');
      var bbox = text.get(0).getBBox(); 
      
      bbox.x      = Math.floor(bbox.x);
      bbox.y      = Math.floor(bbox.y);
      bbox.width  = Math.max(Math.floor(bbox.width  + 10), 1);
      bbox.heihgt = Math.max(Math.floor(bbox.height + 10), 1);
      
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
      bbox.width  = Math.floor(bbox.width  + 10 );
      bbox.heihgt = Math.floor(bbox.height + 10 );
      
    svg.get(0).setAttribute(
      'viewBox', 
      [bbox.x,
       bbox.y,
       bbox.width,
       bbox.height].join(' ')
    );
  });
});
