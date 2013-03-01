  #robot.respond /what(')?s my sprint(\?)?/i, (msg) ->
    #msg.http('http://still-atoll-1597.herokuapp.com/sprint/current').get() (err, res, body) ->
      #formatDate = (ts) ->
        #d = new Date(ts)
        #"#{d.getMonth() + 1}/#{d.getDate()}"

      #data = JSON.parse(body)
      #msg.send "Yo dawg, #{data.name} is your sprint. It started on #{formatDate(data.start)} and ends on #{formatDate(data.end)}."

class APP.Models.Sprint extends Backbone.Model
  url: 'http://still-atoll-1597.herokuapp.com/sprint/current'

  name: =>
    @get("name")

  starts: =>
    @_formatDate(new Date(@get("start")))

  ends: =>
    @_formatDate(new Date(@get("end")))

  _formatDate: (date) ->
    "#{date.getMonth() + 1}/#{date.getDate()}"

