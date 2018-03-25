class TidyFormBuilder < ActionView::Helpers::FormBuilder
# our country_select calls the default select helper with the
# choices already filled in
  def country_select(method, options={}, html_options={required: true})
    select(method, [['Canada', 'Canada' ],
                      ['Mexico', 'Mexico'],
                      ['United Kingdom', 'UK'],
                      ['United States of America', 'USA'],
                      ['Worse than Mexico','Europe']],
                        options, html_options)
  end
end