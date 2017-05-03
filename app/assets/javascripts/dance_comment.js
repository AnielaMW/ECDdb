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

  let saveComment = () => {
    $.ajax({
      method: 'POST',
      url: '/api/dance_comments',
      data: {dance_comment: {comment: com, comment_type_id: tId, user_id: uId, dance_id: dId}}
    }).done(console.log('yes'));

  };

  saveComment();
  let newCom = new NewComment(
    // AJAX get request
  );

  // console.log(`${tId}, ${com}, ${uId}, ${dId}`);
};

$(document).ready(() => {
  $('#dance-show #dc-form').submit(submitClick);
});
