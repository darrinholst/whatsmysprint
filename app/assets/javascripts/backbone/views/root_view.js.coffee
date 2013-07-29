class APP.Views.RootView extends Backbone.View
  FLOWER_DELAY: 1500

  render: ->
    @show("loading")
    @fetchCurrentSprint()
    @

  fetchCurrentSprint: ->
    @model.fetch
      success: => _.delay(@show, @FLOWER_DELAY, "root", sprint: @model)
      error: => _.delay(@show, @FLOWER_DELAY, "dang")

  show: (view, context = {}) =>
    $(@el).html(JST["backbone/templates/#{view}"](context))
          .find('.bro').addClass('bounce')

