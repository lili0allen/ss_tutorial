module.exports = function(grunt)
{
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        watch: {
            less: {
                files: 'themes/one-ring/css/style.less',
                tasks: ['less']
            }
        },
        copy: {
            main: {
                files: [
                    // makes all src relative to cwd
                    {expand: true, cwd: 'themes/one-ring/bower_components/bootstrap/dist/js/', src: 'bootstrap.min.js', dest: 'themes/one-ring/javascript'},
                    {expand: true, cwd: 'themes/one-ring/bower_components/bootstrap/dist/css/', src: 'bootstrap.min.css', dest: 'themes/one-ring/css'},
                    {expand: true, cwd: 'themes/one-ring/bower_components/bootstrap/dist/fonts/', src: ['**'], dest: 'themes/one-ring/fonts'},

                    {expand: true, cwd: 'themes/one-ring/bower_components/bootstrap3-typeahead/', src: 'bootstrap3-typeahead.min.js', dest: 'themes/one-ring/javascript'},

                    {expand: true, cwd: 'themes/one-ring/bower_components/fontawesome/css/', src: 'font-awesome.min.css', dest: 'themes/one-ring/css'},
                    {expand: true, cwd: 'themes/one-ring/bower_components/fontawesome/fonts/', src: ['**'], dest: 'themes/one-ring/fonts'},

                    {expand: true, cwd: 'themes/one-ring/bower_components/jquery/dist/', src: 'jquery.min.js', dest: 'themes/one-ring/javascript'},

                    {expand: true, cwd: 'themes/one-ring/bower_components/jquery-form/', src: 'jquery.form.js', dest: 'themes/one-ring/javascript'},

                    {expand: true, cwd: 'themes/one-ring/bower_components/jquery-validation/dist/', src: 'jquery.validate.min.js', dest: 'themes/one-ring/javascript'},

                    {expand: true, cwd: 'themes/one-ring/bower_components/modernizr/', src: 'modernizr.js', dest: 'themes/one-ring/javascript'},

                    {expand: true, cwd: 'themes/one-ring/bower_components/geocomplete/', src: 'jquery.geocomplete.min.js', dest: 'themes/one-ring/javascript'},

                    {expand: true, cwd: 'themes/one-ring/bower_components/flexslider/', src: 'flexslider.css', dest: 'themes/one-ring/css'},
                    {expand: true, cwd: 'themes/one-ring/bower_components/flexslider/', src: 'jquery.flexslider-min.js', dest: 'themes/one-ring/javascript'},

                    {expand: true, cwd: 'themes/one-ring/bower_components/flexnav/', src: 'jquery.flexnav.min.js', dest: 'themes/one-ring/javascript'},


                ]
            }
        }
//        less: {
//            development: {
//                options: {
//                    paths: ['themes/one-ring/css/']
//                },
//                files: {
//                    "themes/one-ring/css/style.css" : "themes/one-ring/css/style.less"
//                }
//            }
//        },
        //put files together，but we can use silverstripe helper instead
//        concat: {
//            options: {
//                separator: "\n\n"
//            },
//            dist: {
//                src: ['themes/one-ring/bower_components/bootstrap/dist/js/bootstrap.min.js','themes/one-ring/javascript/bootstrap.min.js'],
//                dest: 'bin/<%= pkg.name %>.js'
//            },
//            styles: {
//                src: ['bower_components/bootstrap/dist/css/bootstrap.min.css',
//                        'css/custom.css'],
//                dest: 'css/styles.css'
//            }
//        }
        //uglify: {
        //    options: {
        //        mangle: false
        //    },
        //    my_target: {
        //        files: {
        //            'bin/js/<%= pkg.name %>.min.js' : ['bin/<%= pkg.name %>.js']
        //        }
        //    }
        //},
        //sass: {
        //    dist: {
        //        files: {
        //            'css/custom.css' : 'sass/custom.scss'
        //        }
        //    }
        //}
//        modernizr_builder: {
//            build: {
//                options: {
//                    config: 'themes/one-ring/bower_components/modernizr/lib/config-all.json',
//                    dest: 'themes/one-ring/bower_components/modernizr/modernizr.js'
//                }
//            }
//        }
    });
    grunt.loadNpmTasks('grunt-contrib-copy');
    //grunt.loadNpmTasks("grunt-modernizr-builder");
    //grunt.loadNpmTasks('grunt-contrib-uglify');
    //grunt.loadNpmTasks('grunt-contrib-sass');
    //grunt.loadNpmTasks('grunt-contrib-less');
    grunt.loadNpmTasks('grunt-contrib-watch');

    grunt.registerTask('default', ['copy', 'watch']);
}