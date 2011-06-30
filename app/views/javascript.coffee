app = $.sammy ->
  @debug = true;
  @use Sammy.Cache
  @use Sammy.Template, 'erb'

  @get '#/', (context) ->
    $.get "/features", (features) ->
      context.partial '/templates/features.html.erb', (html) -> $(html).prependTo('#body');
      $.each features, (i, feature) ->
        context.partial '/templates/feature.html.erb', {feature: feature}, (html) ->
          $(html).data('feature', feature).prependTo '#features';

  @get /\#(.*)/, (context) ->
    $.get @params['splat'], (feature) ->
      context.partial '/templates/feature_detail.html.erb', {feature: feature}, (html) ->
        $(html).data('feature', feature).prependTo '#body'
        context.log feature


$ -> app.run()
