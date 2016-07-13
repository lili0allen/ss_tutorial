<% include Banner %>
<div class="container">
    <div class="row">
        <div class="col-sm-12">
            <% with $SearchForm %>
                <form $AttributesHTML>
                <% with $Fields %>
                    <% with $dataFieldByName('Service') %>
                        <div class="col-md-3">
                            <fieldset class="form-group">
                                <label>Service:</label><br />$Me
                            </fieldset>
                        </div>
                    <% end_with %>
                    <% with $dataFieldByName('Postcode') %>
                        <div class="col-md-3">
                            <fieldset class="form-group">
                                <label>Postcode:</label><br />$Me
                            </fieldset>
                        </div>
                    <% end_with %>
                    <% with $dataFieldByName('Distance') %>
                        <div class="col-md-3">
                            <fieldset class="form-group">
                                <label>Distance:</label><br />$Me
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
    <div class="row">
        <div class="col-sm-12">
            <% if $ServiceEntries %>
                <% loop $ServiceEntries %>
                    $Title
                <% end_loop %>
            <% end_if %>
        </div>
    </div>
</div>