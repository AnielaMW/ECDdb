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
          <%= link_to ${this.user[1]}, user_path(${this.user[0]}) %> posted a <%= link_to ${this.comment_type[1]}, comment_type_path(${this.comment_type[0]}) %> for <%= link_to ${this.dance[1]}, dance_path(${this.dance[0]}) %>
        </h3>
        <p><%= link_to ${this.comment[1]}, dance_comment_path(${this.comment[0]}) %></p>

      </article>
    </li>`;
  }
}

let prependTarget = (target, text) => {
  target.prepend(text);
};

submitClick = (event) => {
  event.preventDefault();

  let tId = $('#dance_comment_comment_type_id').val();
  let com = $('#dance_comment_comment').val();
  let uId = $('#user-id').text();
  let dId = $('#dance-id').text();

  let saveComment = () => {
    $.ajax({
      method: 'POST',
      url: '/api/dance_comments',
      data: {dance_comment: {comment: com, comment_type_id: tId, user_id: uId, dance_id: dId}}
    }).done((response) => { createComment(response);});
  };

  let createComment = (response) => {
    let newCom = new NewComment(response);
    prependTarget($('#dance-comment-list'), newCom.toHTML());
  };

  saveComment();
};

$(document).ready(() => {
  $('#dance-show #dc-form').submit(submitClick);
});
