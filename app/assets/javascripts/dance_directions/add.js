addBlankDirection = () => {
  let newDDForm = `<tr>
  <td class="seq hidden-label">
    <button type="button" id="dd-remove" class="ref-button">-</button>
    <label for="sequence">Sequence</label>
    <input type="text" name="sequence" required>
  </td>

  <td class="mar hidden-label">
    <label for="mark">Mark</label>
    <input type="text" name="mark">
  </td>

  <td class="mea hidden-label">
    <label for="measure">Measure</label>
    <input type="text" name="measure">
  </td>

  <td class="dir hidden-label">
    <label for="direction">Movement</label>
    <input type="text" name="direction" required>
  </td>

  <td class="pos hidden-label">
    <label for="position">Position</label>
    <input type="text" name="position">
  </td>
  </tr>`;

  let ddList = $('table#dd-form');

  appendTarget(ddList, newDDForm);
};

$(document).ready(() => {
  $('#dance-new').on('click', '#dd-add', addBlankDirection);
});