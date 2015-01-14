class APP.Models.Sprint extends Backbone.Model
  url: '/current-sprint'

  name: =>
    @get('name')

  starts: =>
    @get('starts')

  ends: =>
    @get('ends')

