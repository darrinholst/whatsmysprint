class APP.Models.Sprint extends Backbone.Model
  url: '/current-sprint'

  name: =>
    @get("name")

  starts: =>
    @_formatDate(new Date(@get("start")))

  ends: =>
    @_formatDate(new Date(@get("end")))

  _formatDate: (date) ->
    "#{date.getMonth() + 1}/#{date.getDate()}"

