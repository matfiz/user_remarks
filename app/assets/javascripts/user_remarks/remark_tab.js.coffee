$ ->
  $ '#remark_tab #remarks_link'
  .val window.location

  $ '#remark_tab .remark_tab'
  .on 'click', ->
    $ '#remark_tab'
    .toggleClass 'open'
  $ '#remark_tab form'
  .on 'ajax:success',(data)->
    alert data
    $ '#remark_tab'
    .removeClass 'open'

  $ '#remark_tab form'
  .on 'ajax:error',(data,response)->
    alert "("+response.status+") "+response.statusText
    $ '#remark_tab'
    .removeClass 'open'