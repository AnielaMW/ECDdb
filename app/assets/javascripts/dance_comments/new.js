class NewComment{
  constructor(json) {
    this.comment = [json[0].id, json[0].comment];
    this.user = [json[0].user_id, json[1].user];
    this.dance = [json[0].dance_id, json[1].dance];
    this.comment_type = [json[0].comment_type_id, json[1].comment_type];
  }

  toHTML() {
    return `<li>
      <article class="comment-box">
        <h3>
          <a href="/users/${this.user[0]}">${this.user[1]}</a> posted a <a href="/comment_types/${this.comment_type[0]}">${this.comment_type[1]}</a> for <a href="/dances/${this.dance[0]}">${this.dance[1]}</a>
        </h3>
        <p><a href="/dance_comments/${this.comment[0]}">${this.comment[1]}</a></p>

        <footer>
          <ul>
            <li><a href="/dance_comments/${this.comment[0]}/edit">Edit</a></li>
            <li><a href="">Delete</a></li>
          </ul>
        </footer>
      </article>
    </li>`;
  }
}

submitDCClick = (event) => {
  event.preventDefault();

  let comment = {
    comment: $('#dance_comment_comment').val(),
    comment_type_id: $('#dance_comment_comment_type_id').val(),
    user_id: $('#user-id').text(),
    dance_id: $('#dance-id').text()
  };

  saveComment = () => {
    $.ajax({
      method: 'POST',
      url: '/api/dance_comments',
      data: {dance_comment: comment}
    }).done((response) => { createComment(response);});
  };

  createComment = (response) => {
    let newCom = new NewComment(response);
    prependTarget($('#dance-comment-list'), newCom.toHTML());

    $('#dc-form')[0].reset();
    $('#dc-form #actions>input').prop('disabled',false);
  };

  saveComment();
};

$(document).ready(() => {
  $('#dance-show #dc-form').submit(submitDCClick);
});
