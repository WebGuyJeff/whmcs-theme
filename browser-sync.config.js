module.exports = {
	proxy: 'http://localhost:1234',
	files: [
		{
			match: "bigupweb-theme/css/*.css",
			fn: function (event, file) {
				if (event === "change") {
					this.reload("*.css")
				}
			}
		},
		{
			match: "bigupweb-theme/js/*.js",
			fn: function () {
				this.reload()
			}
		},
		{
			match: "bigupweb-theme/**/*.tpl",
			fn: function () {
				this.reload()
			}
		}
	],
	watchOptions: {
		usePolling: true
	},
	watchOptions: {
		usePolling: true
	},
	open: 'local',
	browser: 'google-chrome',
	notify: false
}
