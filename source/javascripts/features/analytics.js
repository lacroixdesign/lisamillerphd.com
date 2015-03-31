window.trackOutboundLink = function (label) {
  ga('send', 'event', 'outbound', 'click', label);
};

$(document).on('click', '[data-track-outbound-preorder]', function() {
  var vendor = $(this).text();
  window.trackOutboundLink(vendor);
});
