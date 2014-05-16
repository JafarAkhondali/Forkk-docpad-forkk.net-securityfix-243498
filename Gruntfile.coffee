# global module:false

module.exports = (grunt) ->
	fs = require("fs")
	pkginfo = grunt.file.readJSON("package.json")
	
	# Project configuration
	grunt.initConfig
		pkg: pkginfo

		copy:
			uikit:
				files: [
					expand: true
					cwd: "uikit/themes/custom/forkk/dist"
					src: ["uikit.forkk.min.css"]
					dest: "dist/assets/css"
				,
					expand: true
					cwd: "uikit/dist/js"
					src: ["uikit.min.js"]
					dest: "dist/assets/js"
				,
					expand: true
					cwd: "uikit/dist/fonts"
					src: ["*"]
					dest: "dist/assets/fonts"
				]
			docpad:
				files: [
					expand: true
					cwd: "docpad/out"
					src: ["**/*.html", "**/*.ico", "**/*.png", "**/*.js", "**/*.xml", "**/*.css"]
					dest: "dist"
				]

		connect:
			server:
				options:
					port: 8082
					base: "dist"

		exec:
			githash:
				command: "git rev-parse --verify HEAD > last_commit.html"

			uikit:
				cwd: "uikit"
				command: "grunt"

			docpad:
				cwd: "docpad"
				command: "docpad generate --env static"

		watch:
			uikit:
				files: [ "uikit/**/*.less", "uikit/js/*.js" ]
				tasks: [ "exec:uikit", "copy:uikit" ]

			docpad:
				files: [ "docpad/src/**/*" ]
				tasks: [ "exec:docpad", "copy:docpad" ]
		uncss:
			dist:
				files:
					"dist/assets/css/uikit.multimc.min.css": [ "dist/*.html" ]

	# Load grunt tasks from NPM packages
	grunt.loadNpmTasks "grunt-uncss"
	grunt.loadNpmTasks "grunt-contrib-copy"
	grunt.loadNpmTasks "grunt-contrib-watch"
	grunt.loadNpmTasks "grunt-contrib-connect"
	grunt.loadNpmTasks "grunt-exec"

	# Default task.
	grunt.registerTask "default", ["connect", "watch"]
	grunt.registerTask "build", ["exec", "copy"]

