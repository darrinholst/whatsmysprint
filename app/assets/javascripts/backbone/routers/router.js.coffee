class APP.Routers.Router extends Backbone.Router
  routes:
    "" : "root"

  root: ->
    sprint = new APP.Models.Sprint()
    view = new APP.Views.RootView(model: sprint)
    $("#backbone").html(view.render().el)

APP.Routers.Router.onDomReady = ->
  window.router = new APP.Routers.Router()
  Backbone.history.start(pushState: true)

$(APP.Routers.Router.onDomReady)

