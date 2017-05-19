dividUpdateDirections = (dds, newDan) => {
  dds.each((dd) => {
    newDan.directions.push(submitDDUpdate(dd, newDan));
  });
};

submitDDDEditClick = (event) => {
  event.preventDefault();

  let dirListUpdate = $('tr.dd-editable');
  let dirListAdd = $('tr.dd-new');

  let dance = {
    id: $('#dance-id').text(),
    title: $('#dance_title').val(),
    author: $('#dance_author').val(),
    publication: $('#dance_publication').val(),
    year: $('#dance_year').val(),
    formation_id: $('#dance_formation_id').val(),
    meter_id: $('#dance_meter_id').val(),
    user_id: $('#user-id').text()
  };

  updateDance = () => {
    $.ajax({
      method: 'PUT',
      url: `/api/dances/$(dance[:id])`,
      data: {dance: dance}
    }).done((response) => { createDance(response); });
  };

  createDance = (response) => {
    let newDan = new NewDance(response);
    dividNewDirections(dirListAdd, newDan);
    dividUpdateDirections(dirListUpdate, newDan);
    window.location = `/dances/${newDan.id}`;
  };

  updateDance();
};

$(document).ready(() => {
  $('form.edit_dance').submit(submitDDDEditClick);
});