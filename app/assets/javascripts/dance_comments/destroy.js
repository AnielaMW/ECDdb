deleteClick = (event) => {
  event.preventDefault();

  console.log("It stopped the Default?");
};

$(document).ready(() => {
  $('#dance-show').on('click', '#remove_comment', deleteClick);
});
