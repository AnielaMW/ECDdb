class NewDance{
  constructor(json) {
    this.id = json[0].id;
    this.title = json[0].title;
    this.author = json[0].author;
    this.publication = json[0].publication;
    this.year = json[0].year;
    this.formation = [json[0].formation_id, json[1].formation];
    this.meter = [json[0].meter_id, json[1].meter];
    this.user = [json[0].user_id, json[1].user];
    this.directions = [];
  }
}

submitDDDClick = (event) => {
  event.preventDefault();

  let dance = {
    title: $('#dance_title').val(),
    author: $('#dance_author').val(),
    publication: $('#dance_publication').val(),
    year: $('#dance_year').val(),
    formation_id: $('#dance_formation_id').val(),
    meter_id: $('#dance_meter_id').val(),
    user_id: $('#user-id').text()
  };

  let saveDance = () => {
    $.ajax({
      method: 'POST',
      url: '/api/dances',
      data: {dance: dance}
    }).done((response) => { createDance(response); });
  };

  let createDance = (response) => {
    let newDan = new NewDance(response);
  };

  saveDance();
};

$(document).ready(() => {
  $('#dance-new #d-dd-form').submit(submitDDDClick);
});
