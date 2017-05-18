let submitDD = (dd, newDan) => {

  let seqs = $('td.seq input');
  let mars = $('td.mar input');
  let meas = $('td.mea input');
  let dirs = $('td.dir input');
  let poss = $('td.pos input');

  let dir = {
    dance_id: newDan.id,
    sequence: seqs[dd].value,
    mark: mars[dd].value,
    measure: meas[dd].value,
    direction: dirs[dd].value,
    position: poss[dd].value
  };

  let saveDirections = () => {
    $.ajax({
      method: 'POST',
      url: '/api/dance_directions',
      data: {dd: dir}
    }).done((response) => { returnDirection(response); });
  };

  let returnDirection = (response) => {
    return response;
  };

  saveDirections();
};
