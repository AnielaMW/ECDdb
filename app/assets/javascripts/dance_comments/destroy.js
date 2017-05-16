deleteClick = (event) => {

  // NEED TO GET THE PREVENT DEFAULT TO WORK.
  event.preventDefault();
  //
  // console.log("Got it");
};

$(document).ready(() => {
  $('#dance-show').on('click', '#remove_comment', deleteClick);
});
