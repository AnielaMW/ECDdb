class NewComment{

}

submitClick = (event) => {
  event.preventDefault();

  let errorMessage = () => {
    alert('Comment cannot be blank.');
  };

  let newCom = new NewComment();

  console.log('hello');
};

$(document).ready(() => {
  // How do I use the EventListener `onsubmit` instead of `onclick`? I want the existing required field errors to be the standard.
  $('#dance-show #actions').on('click', submitClick);
  // $('#dance-show #forms').on('submit', submitClick);
});
