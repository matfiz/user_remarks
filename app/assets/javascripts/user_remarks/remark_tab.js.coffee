$ ->
  $ '#remark_tab #remarks_link'
  .val window.location

  $ '#remark_tab .remark_tab'
  .on 'click', ->
    $ '#remark_tab'
    .toggleClass 'open'

  $ '#remark_tab form'
  .on 'ajax:success',(event, data)->
    alert data
    $ '#remark_tab'
    .removeClass 'open'
    $ '#remark_tab [type="submit"]'
    .removeAttr('disabled')
    $('#remark_tab form')[0].reset()

  .on 'ajax:error',(data,response)->
    alert "("+response.status+") "+response.statusText
    $ '#remark_tab'
    .removeClass 'open'
    $ '#remark_tab [type="submit"]'
    .removeAttr('disabled')
    $('#remark_tab form')[0].reset()

  .on 'submit', ->
    $ '#remark_tab [type="submit"]'
    .attr('disabled', 'disabled')