<% if $Success %>

    <p class="savedMessage">You have successfully registered!</p>

    <p>Your details are as follows: </p>
    <% with $CurrentMember %>
        <p>
            Name: $Name<br />
            Email: $Email<br />
        </p>
    <% end_with %>

    <a href="$Link">Edit details</a>

<% else %>

    <% if $Saved %>

        <p class="savedMessage">Your profile has been saved!</p>

    <% end_if %>
    <% if $CurrentMember %>
        $EditServiceForm

    <% else %>
        You must <a href="registration">registered</a> and logged in to edit your profile
    <% end_if %>

<% end_if %>
<script src="//cdn.tinymce.com/4/tinymce.min.js"></script>
<script>

    tinymce.init({
        selector: 'textarea',
        height: 500,
        theme: 'modern',
        plugins: [
            'advlist autolink lists link image charmap print preview hr anchor pagebreak',
            'searchreplace wordcount visualblocks visualchars code fullscreen',
            'insertdatetime media nonbreaking save table contextmenu directionality',
            'emoticons template paste textcolor colorpicker textpattern imagetools'
        ],
        toolbar1: 'insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image',
        toolbar2: 'print preview media | forecolor backcolor emoticons',
        image_advtab: true,
        templates: [
            { title: 'Test template 1', content: 'Test 1' },
            { title: 'Test template 2', content: 'Test 2' }
        ],
        content_css: [
            '//fast.fonts.net/cssapi/e6dc9b99-64fe-4292-ad98-6974f93cd2a2.css',
            '//www.tinymce.com/css/codepen.min.css'
        ]
    });
</script>