<% include Banner %>
<div class="container servicepage">
    <div class="row margin-row">
        <div class="col-sm-12">
            <% with $SearchForm %>
                <form $AttributesHTML>
                <% with $Fields %>
                    <% with $dataFieldByName('Service') %>
                        <div class="col-md-3">
                            <fieldset class="form-group">
                                $Me
                            </fieldset>
                        </div>
                    <% end_with %>
                    <% with $dataFieldByName('Postcode') %>
                        <div class="col-md-3">
                            <fieldset class="form-group">
                                $Me
                            </fieldset>
                        </div>
                    <% end_with %>
                    <% with $dataFieldByName('Distance') %>
                        <div class="col-md-3">
                            <fieldset class="form-group">
                                搜索半径: $Me
                            </fieldset>
                        </div>
                    <% end_with %>
                <% end_with %>
                <% loop $Actions %>
                    <div class="col-md-3">
                        $Me
                    </div>
                <% end_loop %>
                $HiddenFields
                $resetValidations
                </form>
            <% end_with %>
        </div>
    </div>
    <div class="results">
        <% include SearchResults %>
    </div>

</div>