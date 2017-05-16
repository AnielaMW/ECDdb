deleteClick = (event) => {
  // THIS IS STILL NOT PREVENTING THE DEFAULT DELETE AND PAGVE RELOAD, THOUGH IT IS CONSOLE.LOGGING WHILE IT WAITS FOR YOU TO CONFIRM THE DELETE. IF I ELIMINATE THE CONFIRM IT DELETES IMEDIATLY WITH A PAGE RELOAD.
  event.preventDefault();

  console.log(event.target);
};

$(document).ready(() => {
  $('#dance-show').on('click', '#remove_comment', deleteClick);
});
