// 4. prepend the new comment onto the list of comments utilizing the existing format and structure
// 5. post the new comment to the database.

submitClick = (event) => {
  event.preventDefault();

  let newCom = [];
  newCom.type = $('#dance_comment_comment_type_id').val();
  newCom.comment = $('#dance_comment_comment').val();
  newCom.userId = $('#dance_comment_user_id').val();
  newCom.danceId = $('#dance_comment_dance_id').val();

  let commentList = $('#dance-comment-list>li');

  console.log(commentList);
};

$(document).ready(() => {
  $('#dance-show #actions').on('click', submitClick);
});


// STEP 4 Using the partial

// submit form info to api and a new controller namespaced
//routes

// namespace :api do
//   resources :dance_comments
// end
//
// constrollers/api/dance_commments.rb
// class API::DanceCommentsController < ApplicationController

// render JSON render the partial as a string and return to javascript.
