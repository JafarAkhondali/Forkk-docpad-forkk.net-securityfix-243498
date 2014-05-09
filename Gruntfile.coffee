# global module:false

module.exports = (grunt) ->
	fs = require("fs")
	pkginfo = grunt.file.readJSON("package.json")
	
	# Project configuration
	grunt.initConfig
		pkg: pkginfo

		banner: "/*! <%= pkg.title || pkg.name %> - v<%= pkg.version %> - " +
				"<%= grunt.template.today("yyyy-mm-dd") %>\n" +
				"<%= pkg.homepage ? "* " + pkg.homepage + "\\n" : "" %>" +
				"* Copyright (c) <%= grunt.template.today("yyyy") %> <%= pkg.author.name %>;" +
				" Licensed <%= _.pluck(pkg.licenses, "type").join(", ") %> */\n",

		copy:
			uikit:
				files: [
					expand: true
					cwd: "uikit/dist/js"
					src: ["uikit.min.js"]
					dest: "dist/assets/js"
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
			uikit:
				cwd: "uikit"
				command: "grunt"

			docpad:
				cwd: "docpad"
				command: "docpad generate --env static"

		watch:
			uikit:
				files: [ "uikit/src/**/*.less", "uikit/src/js/*.js" ]
				tasks: [ "exec:uikit", "copy:uikit" ]

			docpad:
		  		files: [ "docpad/src/**/*" ]
				tasks: [ "exec:docpad", "copy:docpad" ]

	# Load grunt tasks from NPM packages
	grunt.loadNpmTasks "grunt-uncss"
	grunt.loadNpmTasks "grunt-contrib-copy"
	grunt.loadNpmTasks "grunt-contrib-watch"
	grunt.loadNpmTasks "grunt-contrib-connect"
	grunt.loadNpmTasks "grunt-exec"

	# Default task.
	grunt.registerTask("default", ["connect", "watch"])
	grunt.registerTask("build", ["exec", "copy"])

