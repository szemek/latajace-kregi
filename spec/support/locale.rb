# https://github.com/enriclluelles/route_translator/issues/26
# http://stackoverflow.com/a/4471202

module LocaleExtension
  def process(action, http_method = 'GET', *args)
    parameters, session, flash = args

    parameters = {locale: 'pl'}.merge(parameters || {})

    super(action, http_method, parameters, session, flash)
  end
end

module ActionController
  class TestCase
    module Behavior
      prepend LocaleExtension
    end
  end
end
