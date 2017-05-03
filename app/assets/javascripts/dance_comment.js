class NewComment{

}

submitClick = (event) => {
  event.preventDefault();

  let errorMessage = () => {
    alert('Comment cannot be blank.');
  };

  let tId = $('#dance_comment_comment_type_id').val();
  let com = $('#dance_comment_comment').val();
  let uId = $('#user-id').text();
  let dId = $('#dance-id').text();

  let saveComment = (tId, com, uId, dId) => {
    // AJAX post request
  };

  let newCom = new NewComment(
    // AJAX get request
  );

  console.log(`${tId}, ${com}, ${uId}, ${dId}`);
  console.log();
};

$(document).ready(() => {
  $('#dance-show #dc-form').on('submit', submitClick);
});
