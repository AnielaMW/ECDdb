class NewDance{
  constructor(json) {
    this.id = json[0].id;
    this.directions = [];
  }
}

let dividDirections = (dds, newDan) => {
  dds.each((dd) => {
    newDan.directions.push(submitDD(dd, newDan));
  });
  window.location = `/dances/${newDan.id}`;
};

submitDDDClick = (event) => {
  event.preventDefault();

  let dirList = $('tr.dd-new');
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
    dividDirections(dirList, newDan);
  };

  saveDance();

};

$(document).ready(() => {
  $('form#new_dance').submit(submitDDDClick);
});
