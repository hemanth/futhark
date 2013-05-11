module.exports = function (grunt) {
    'use strict';
 
    //initialize grunt with config
    grunt.initConfig({
        //configure grunt-reload
        reload: {
            port: 1337, // LR Port
            liveReload: {},
            proxy: {
                host: 'localhost'
            }
        },
        trigger: {
            watchFile: 'index.html'
        },
        server: {
            port: 8000,
            base: '/labs'
        },
        watch: {
            files: ['/labs/*.html'],
            tasks: 'reload'
        }
    });
 
    //Load the extra tasks from our npm modules
    grunt.loadNpmTasks('grunt-reload');
    grunt.registerTask("run", "server reload watch");
 
};
