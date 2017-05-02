submitClick = (event) => {
  event.preventDefault();

};

$(document).ready(() => {
  $('#dance-show #actions').on('click', submitClick);
  // $('#dance-show #forms').on('submit', submitClick);
});
