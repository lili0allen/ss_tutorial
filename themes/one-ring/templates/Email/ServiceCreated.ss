<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<!-- Facebook sharing information tags -->
<meta property="og:title" content="HandyService" />

<title>HandyService</title>
<style type="text/css">
/* Client-specific Styles */
#outlook a{padding:0;} /* Force Outlook to provide a "view in browser" button. */
body{width:100% !important;} .ReadMsgBody{width:100%;} .ExternalClass{width:100%;} /* Force Hotmail to display emails at full width */
body{-webkit-text-size-adjust:none;} /* Prevent Webkit platforms from changing default text sizes. */

/* Reset Styles */
body{margin:0; padding:0;}
img{border:0; height:auto; line-height:100%; outline:none; text-decoration:none;}
table td{border-collapse:collapse;}
#backgroundTable{height:100% !important; margin:0; padding:0; width:100% !important;}

/* Template Styles */

/* /\/\/\/\/\/\/\/\/\/\ STANDARD STYLING: COMMON PAGE ELEMENTS /\/\/\/\/\/\/\/\/\/\ */

/**
* @tab Page
* @section background color
* @tip Set the background color for your email. You may want to choose one that matches your company's branding.
* @theme page
*/
body, #backgroundTable{
    /*@editable*/ background-color:#FAFAFA;
}

/**
* @tab Page
* @section email border
* @tip Set the border for your email.
*/
#templateContainer{
    /*@editable*/ border: 1px solid #DDDDDD;
}

/**
* @tab Page
* @section heading 1
* @tip Set the styling for all first-level headings in your emails. These should be the largest of your headings.
* @style heading 1
*/
h1, .h1{
    /*@editable*/ color:#202020;
    display:block;
    /*@editable*/ font-family:Arial;
    /*@editable*/ font-size:34px;
    /*@editable*/ font-weight:bold;
    /*@editable*/ line-height:100%;
    margin-top:0;
    margin-right:0;
    margin-bottom:10px;
    margin-left:0;
    /*@editable*/ text-align:left;
}

/**
* @tab Page
* @section heading 2
* @tip Set the styling for all second-level headings in your emails.
* @style heading 2
*/
h2, .h2{
    /*@editable*/ color:#202020;
    display:block;
    /*@editable*/ font-family:Arial;
    /*@editable*/ font-size:18px;
    /*@editable*/ font-weight:bold;
    /*@editable*/ line-height:100%;
    margin-top:0;
    margin-right:0;
    margin-bottom:10px;
    margin-left:0;
    /*@editable*/ text-align:left;
}

/**
* @tab Page
* @section heading 3
* @tip Set the styling for all third-level headings in your emails.
* @style heading 3
*/
h3, .h3{
    /*@editable*/ color:#202020;
    display:block;
    /*@editable*/ font-family:Arial;
    /*@editable*/ font-size:26px;
    /*@editable*/ font-weight:bold;
    /*@editable*/ line-height:100%;
    margin-top:0;
    margin-right:0;
    margin-bottom:10px;
    margin-left:0;
    /*@editable*/ text-align:left;
}

/**
* @tab Page
* @section heading 4
* @tip Set the styling for all fourth-level headings in your emails. These should be the smallest of your headings.
* @style heading 4
*/
h4, .h4{
    /*@editable*/ color:#202020;
    display:block;
    /*@editable*/ font-family:Arial;
    /*@editable*/ font-size:22px;
    /*@editable*/ font-weight:bold;
    /*@editable*/ line-height:100%;
    margin-top:0;
    margin-right:0;
    margin-bottom:10px;
    margin-left:0;
    /*@editable*/ text-align:left;
}

/* /\/\/\/\/\/\/\/\/\/\ STANDARD STYLING: PREHEADER /\/\/\/\/\/\/\/\/\/\ */

/**
* @tab Header
* @section preheader style
* @tip Set the background color for your email's preheader area.
* @theme page
*/
#templatePreheader{
    /*@editable*/ background-color:#FAFAFA;
}

/**
* @tab Header
* @section preheader text
* @tip Set the styling for your email's preheader text. Choose a size and color that is easy to read.
*/
.preheaderContent div{
    /*@editable*/ color:#505050;
    /*@editable*/ font-family:Arial;
    /*@editable*/ font-size:10px;
    /*@editable*/ line-height:100%;
    /*@editable*/ text-align:left;
}

/**
* @tab Header
* @section preheader link
* @tip Set the styling for your email's preheader links. Choose a color that helps them stand out from your text.
*/
.preheaderContent div a:link, .preheaderContent div a:visited, /* Yahoo! Mail Override */ .preheaderContent div a .yshortcuts /* Yahoo! Mail Override */{
    /*@editable*/ color:#336699;
    /*@editable*/ font-weight:normal;
    /*@editable*/ text-decoration:underline;
}

/* /\/\/\/\/\/\/\/\/\/\ STANDARD STYLING: HEADER /\/\/\/\/\/\/\/\/\/\ */

/**
* @tab Header
* @section header style
* @tip Set the background color and border for your email's header area.
* @theme header
*/
#templateHeader{
    /*@editable*/ background-color:#FFFFFF;
    /*@editable*/ border-bottom:0;
}

/**
* @tab Header
* @section header text
* @tip Set the styling for your email's header text. Choose a size and color that is easy to read.
*/
.headerContent{
    /*@editable*/ color:#202020;
    /*@editable*/ font-family:Arial;
    /*@editable*/ font-size:34px;
    /*@editable*/ font-weight:bold;
    /*@editable*/ line-height:100%;
    /*@editable*/ padding:0;
    /*@editable*/ text-align:center;
    /*@editable*/ vertical-align:middle;
}


/**
* @tab Body
* @section body style
* @tip Set the background color for your email's body area.
*/
#templateContainer, .bodyContent{
    /*@editable*/ background-color:#FFFFFF;
}

/**
* @tab Body
* @section body text
* @tip Set the styling for your email's main content text. Choose a size and color that is easy to read.
* @theme main
*/
.bodyContent div, table td, table td span {
    /*@editable*/ color:#505050;
    /*@editable*/ font-family:Arial;
    /*@editable*/ font-size:14px;
    /*@editable*/ line-height:150%;
    /*@editable*/ text-align:left;
}
table td {
    /*@editable*/ line-height:1px;
}
.bodyContent div {
    /*@editable*/ line-height:100%;
}
/**
* @tab Body
* @section body link
* @tip Set the styling for your email's main content links. Choose a color that helps them stand out from your text.
*/
.bodyContent div a:link, .bodyContent div a:visited, /* Yahoo! Mail Override */ .bodyContent div a .yshortcuts /* Yahoo! Mail Override */{
    /*@editable*/ color:#336699;
    /*@editable*/ font-weight:normal;
    /*@editable*/ text-decoration:underline;
}

.black {
    color:#000;
    font-weight: 700;
}
a,a:visited, .pink {
    color:#cd2294;
}
</style>
</head>
<body leftmargin="0" marginwidth="0" topmargin="0" marginheight="0" offset="0">
<center>
    <table border="0" cellpadding="0" cellspacing="0" height="100%" width="100%" id="backgroundTable">
        <tr>
            <td align="left" valign="top">
                <table border="0" cellpadding="0" cellspacing="0" width="500" id="templateContainer">
                    <tr>
                        <td valign="top">
                            <!-- // Begin Template Header \\ -->
                            <br />
                            <br />
                            <table border="0" cellpadding="20" cellspacing="0" width="100%" id="templateHeader">
                                <tr>
                                    <td align="left" valign="top" width="100%"  class="headerContent">
                                        <img src="themes/one-ring/images/logo.png" width="" height="" style="float:left;margin-left:20px;vertical-align:top;"   />
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <!-- // End Template Header \\ -->
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top">
                            <!-- // Begin Template Body \\ -->
                            <table border="0" cellpadding="0" cellspacing="0" width="480" id="templateBody" align="left">
                                <tr>
                                    <td valign="top" class="bodyContent">
                                        <!-- // Begin Module: Standard Content \\ -->
                                        <table border="0" cellpadding="20" cellspacing="0" width="100%">
                                            <tr>
                                                <td align="left" valign="top">
                                                    <div>
                                                        <strong class="black">To:</strong> $FirstName $Surname
                                                        <br><br>
                                                        Thank you for entering the
                                                        <br>
                                                        <strong>$Title</strong>
                                                        <br><br>
                                                        Your service entry has been received.
                                                        <br><br><br>

                                                        Kind Regards,<br>
                                                        HandyService
                                                        <br/>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                            <!-- // End Template Body \\ -->
                        </td>
                    </tr>
                </table>
                <br />
            </td>
        </tr>
    </table>
</center>
</body>
</html>