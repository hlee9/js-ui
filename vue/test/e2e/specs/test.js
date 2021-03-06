// For authoring Nightwatch tests, see
// http://nightwatchjs.org/guide#usage

module.exports = {
  'default e2e tests': function (browser) {
    // automatically uses dev Server port from /config.index.js
    // default: http://localhost:8080
    // see nightwatch.conf.js
    const devServer = browser.globals.devServerURL
    const aboutPage = `${devServer}/about`

    browser
      .url(aboutPage)
      .waitForElementVisible('#app', 5000)
      .assert.elementPresent('#about')
      .assert.containsText('h1', 'Dockerian JsUi')
      .assert.elementCount('img', 3)
      .end()
  }
}
