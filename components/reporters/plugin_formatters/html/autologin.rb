=begin
    Copyright 2010-2014 Tasos Laskos <tasos.laskos@gmail.com>
    Please see the LICENSE file at the root directory of the project.
=end

class Arachni::Reporters::HTML

# HTML formatter for the results of the AutoLogin plugin
#
# @author Tasos "Zapotek" Laskos <tasos.laskos@gmail.com>
class PluginFormatters::AutoLogin < Arachni::Plugin::Formatter
    include TemplateUtilities

    def run
        ERB.new( tpl ).result( binding )
    end

    def tpl
        <<-HTML
            <% if results['status'] == 'ok' %>
                    <p class="alert alert-success">
                        <%= results['message'] %>
                    </p>

                    <h3>Cookies set to:</h3>

                    <dl class="dl-horizontal">
                        <% results['cookies'].each do |k, v| %>
                            <dt>
                                <code><%= escapeHTML( k ) %></code>
                            </dt>
                            <dd>
                                <code><%= escapeHTML( v ) %></code>
                            </dd>
                        <% end %>
                    </dl>
            <% else %>
                <p class="alert alert-danger">
                    <%= results['message'] %>
                </p>
            <% end %>
        HTML
    end

end

end