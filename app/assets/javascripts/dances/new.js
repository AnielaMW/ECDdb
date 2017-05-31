class NewDance{
  constructor(json) {
    this.id = json[0].id;
    this.directions = [];
  }
}

dividNewDirections = (dds, newDan) => {
  dds.each((dd) => {
    newDan.directions.push(submitDDAdd(dd, newDan));
  });
};

submitDDDClick = (event) => {
  event.preventDefault();

  let dirListAdd = $('tr.dd-new');
  let dance = {
    title: $('#dance_title').val(),
    choreographer: $('#dance_choreographer').val(),
    publication: $('#dance_publication').val(),
    year: $('#dance_year').val(),
    formation_id: $('#dance_formation_id').val(),
    meter_id: $('#dance_meter_id').val(),
    key_id: $('#dance_key_id').val(),
    tempo_id: $('#dance_tempo_id').val(),
    dance_level_id: $('#dance_dance_level_id').val(),
    mood_id: $('#dance_mood_id').val(),
    user_id: $('#user-id').text()
  };

  saveDance = () => {
    $.ajax({
      method: 'POST',
      url: '/api/dances',
      data: {dance: dance}
    }).done((response) => { createDance(response); });
  };

  createDance = (response) => {
    newDan = new NewDance(response);
    dividNewDirections(dirListAdd, newDan);
    window.location = `/dances/${newDan.id}`;
  };

  saveDance();
};

$(document).ready(() => {
  $('form#new_dance').submit(submitDDDClick);
});
