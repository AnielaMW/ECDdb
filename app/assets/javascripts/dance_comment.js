class NewComment{

}

submitClick = (event) => {
  event.preventDefault();

  let errorMessage = () => {
    alert('Comment cannot be blank.');
  };

  let tId = $('#dance_comment_comment_type_id').val();
  let com = $('#dance_comment_comment').val();
  // How do I extract the value of the next two variables as right now all I get is the element?
  let uId = $('#user-id');
  let dId = $('#dance-id');

  let newCom = new NewComment();

  console.log(`${tId}, ${com}, ${uId}, ${dId}`);
};

$(document).ready(() => {
  // How do I use the EventListener `onsubmit` instead of `onclick`? I want the existing required field errors to be the standard.
  $('#dance-show #actions').on('click', submitClick);
  // $('#dance-show #forms').on('submit', submitClick);
});
