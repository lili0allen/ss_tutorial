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
        less: {
            development: {
                options: {
                    paths: ['themes/one-ring/css/']
                },
                files: {
                    "themes/one-ring/css/style.css" : "themes/one-ring/css/style.less"
                }
            }
        }
        //put files together，but we can use silverstripe helper instead
        //concat: {
        //    options: {
        //        separator: "\n\n"
        //    },
        //    dist: {
        //        src: ['themes/one-ring/javascript/bootstrap-checkbox.js','themes/one-ring/javascript/agencies.js'],
        //        dest: 'bin/<%= pkg.name %>.js'
        //    },
        //    styles: {
        //        src: ['bower_components/bootstrap/dist/css/bootstrap.min.css',
        //                'css/custom.css'],
        //        dest: 'css/styles.css'
        //    }
        //},
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
    });
    grunt.loadNpmTasks('grunt-contrib-concat');
    grunt.loadNpmTasks('grunt-contrib-uglify');
    //grunt.loadNpmTasks('grunt-contrib-sass');
    grunt.loadNpmTasks('grunt-contrib-less');
    grunt.loadNpmTasks('grunt-contrib-watch');

    //tasks
    //grunt.registerTask('justJavaScript', ['concat', 'uglify']);
    grunt.registerTask('default', ['less', 'watch']);
}