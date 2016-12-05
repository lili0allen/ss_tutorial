

    <!-- Slider -->
    <section class="slider-holder">
        <div class="flexslider">
            <ul class="slides">
                <% loop $Slides %>
                   <li>$Image</li>
                <% end_loop %>
            </ul>

            <div class="search-box">
                <div class="container">
                    <div class="search-box-inner">
                        <h2>$SiteConfig.Tagline</h2>
                        <% with $SearchForm %>
                        <form action="/services" method="get" role="form">
                            <div class="row">
                                <% with $Fields %>
                                    <% with $dataFieldByName('Service') %>
                                    <div class="col-md-3 col-md-offset-2">
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
        <!--                            <% with $dataFieldByName('Distance') %>-->
        <!--                            <div class="col-md-3">-->
        <!--                                <fieldset class="form-group">-->
        <!--                                    $Me-->
        <!--                                </fieldset>-->
        <!--                            </div>-->
        <!--                            <% end_with %>-->
                                <% end_with %>
                                <% loop $Actions %>
                                <div class="col-md-2">
                                    <button type="submit" class="btn btn-primary btn-block"><i class="fa fa-search"></i></button>
                                </div>
                                <% end_loop %>
                                $HiddenFields
                                $resetValidations
                            </div>
                        </form>
                        <% end_with %>


                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Slider / End -->

    <!-- Page Content -->
    <section class="page-content">
        <div class="container">

            <!-- Services -->
            <div class="title-bordered">
                <h2>Our Services <small>services we provided</small></h2>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="icon-box">
                        <div class="icon">
                            <i class="fa fa-bug"></i>
                        </div>
                        <div class="icon-box-body">
                            <h5>Pest Control</h5>
                            <p>We use the latest technology to test new and innovated products so we can protect.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="icon-box">
                        <div class="icon">
                            <i class="fa fa-cog"></i>
                        </div>
                        <div class="icon-box-body">
                            <h5>Engineering Consultant</h5>
                            <p>Consulting engineering is a professional service that provides independent expertise.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="icon-box">
                        <div class="icon">
                            <i class="fa fa-recycle"></i>
                        </div>
                        <div class="icon-box-body">
                            <h5>Environmental Consulting</h5>
                            <p>Managing, protecting and restoring the environment are integral to our services.</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="icon-box">
                        <div class="icon">
                            <i class="fa fa-suitcase"></i>
                        </div>
                        <div class="icon-box-body">
                            <h5>Handiwork</h5>
                            <p>We are professional tile installers who can install and repair tile in many areas of your home.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="icon-box">
                        <div class="icon">
                            <i class="fa fa-lightbulb-o"></i>
                        </div>
                        <div class="icon-box-body">
                            <h5>Lighting Design</h5>
                            <p>Professional lighting designers dedicate their careers exclusively to the art and science of lighting.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="icon-box">
                        <div class="icon">
                            <i class="fa fa-cube"></i>
                        </div>
                        <div class="icon-box-body">
                            <h5>Storage</h5>
                            <p>Hiring our professional handyman services ensures proper storage installation.</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="icon-box">
                        <div class="icon">
                            <i class="fa fa-tree"></i>
                        </div>
                        <div class="icon-box-body">
                            <h5>Tree Service</h5>
                            <p>Provides vegetation management, storm restoration, and work planning services.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="icon-box">
                        <div class="icon">
                            <i class="fa fa-car"></i>
                        </div>
                        <div class="icon-box-body">
                            <h5>Moving</h5>
                            <p>Whether you're moving down the street or across the country, we'll help you manage your relocation stress.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="icon-box">
                        <div class="icon">
                            <i class="entypo tools"></i>
                        </div>
                        <div class="icon-box-body">
                            <h5>General Contracting</h5>
                            <p>We develop special tailor-made solutions in collaboration with our customers.</p>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Services / End -->

        </div>
    </section>
    <!-- Page Content / End -->
