$(document).on 'ready page:load', -&gt;
  exercises = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('value'),
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    remote: {
      url: '/search/query?q=%QUERY'
    }
  })
 
  exercises.initialize()
 
$('input.typeahead').typeahead(
  {
    hint: true,
    highlight: true,
    minLength: 1
  },
  {
    name: 'exercises',
    displayKey: 'name',
    source: exercises.ttAdapter()
  })