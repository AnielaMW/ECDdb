submitDDUpdate = (dd, newDan) => {

  let ids = $('.dd-editable td.id input');
  let seqs = $('.dd-editable td.seq input');
  let mars = $('.dd-editable td.mar input');
  let meas = $('.dd-editable td.mea input');
  let dirs = $('.dd-editable td.dir input');
  let poss = $('.dd-editable td.pos input');

  let dir = {
    id: ids[dd].value,
    dance_id: newDan.id,
    sequence: seqs[dd].value,
    mark: mars[dd].value,
    measure: meas[dd].value,
    direction: dirs[dd].value,
    position: poss[dd].value
  };

  saveDirections = () => {
    $.ajax({
      method: 'PUT',
      url: `/api/dance_directions/$(dir[:id])`,
      data: {dd: dir}
    }).done((response) => { return response; });
  };

  saveDirections();
};
