class NewComment{

}

let prependTarget = (target, text) => {
  target.prepend(text);
};

submitClick = (event) => {
  event.preventDefault();

  let errorMessage = () => {
    alert('Comment cannot be blank.');
  };

  let tId = $('#dance_comment_comment_type_id').val();
  let com = $('#dance_comment_comment').val();
  let uId = $('#user-id').text();
  let dId = $('#dance-id').text();

  let newCom = new NewComment(
    // AJAX get request
    $.ajax({
      method: 'GET',
      url: '/api/dance_comments',
      data: {dance_comment: {comment: com, comment_type_id: tId, user_id: uId, dance_id: dId}}
    })
  );

  let saveComment = () => {
    $.ajax({
      method: 'POST',
      url: '/api/dance_comments',
      data: {dance_comment: {comment: com, comment_type_id: tId, user_id: uId, dance_id: dId}}
    });
    // .done();
  };

  saveComment();
  prependTarget($('#dance-comment-list'), newCom);
};

$(document).ready(() => {
  $('#dance-show #dc-form').submit(submitClick);
});
