submitDDAdd = (dd, newDan) => {

  let seqs = $('.dd-new td.seq input');
  let mars = $('.dd-new td.mar input');
  let meas = $('.dd-new td.mea input');
  let dirs = $('.dd-new td.dir input');
  let poss = $('.dd-new td.pos input');

  let dir = {
    dance_id: newDan.id,
    sequence: seqs[dd].value,
    mark: mars[dd].value,
    measure: meas[dd].value,
    direction: dirs[dd].value,
    position: poss[dd].value
  };

  saveDirections = () => {
    $.ajax({
      method: 'POST',
      url: '/api/dance_directions',
      data: {dd: dir}
    }).done((response) => { returnDirection(response); });
  };

  returnDirection = (response) => {
    return response;
  };

  saveDirections();
};
