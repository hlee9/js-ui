# JsUi Web Console

> Vue.js demo project


<br/><a name="contents"></a>
## Contents

  * [About](#about)
    - [Recommendations](#spec)
    - [Quick Start](#start)
  * [Perspectives](#p)
    - [HelloWorld](#p-hello)
    - [Search](#p-search)
  * [Settings and Preference](#options)
  * [Message Board](#appInfo)
  * [Contact](#contact)


<a name="about"><br/></a>
## About

  JsUi Web Console is a demo project in use of Vue.js.


<a name="spec"><br/></a>
### Recommendations

  * Browser support: Chrome, FireFox, Opera, Vivaldi (decktop)
  * Browser window size: 1024 x 768 (minimum 800 x 600)


<a name="start"><br/></a>
### Quick Start

  * App Menu (at top-left of the header section) provides a full list to
    access all features in JsUi Web Console. Select and click the item will
    redirect and open the specific page.

  * On the left edge of the browser window, the menu slider (taking one-third
    strip of the view port in gray color) allows mouse hovering to open the
    App Menu without having to reaching the top menu button.

  * On the right side, the edge slider (in dark turquoise color) can sense the
    mouse hovering (for about half second) to open Settings pane on the right,
    as a quicker and easier method than opening the full Settings page.

<a name="p"><br/></a>
## Perspectives

  JsUi Web Console main workspace includes the following featured perspectives.
  - [Hello World](#p-hello)
  - [Search](#p-search)


<a name="p-hello"><br/></a>
### Hello World

<br/>&raquo; ***TBD***


<a name="p-search"><br/></a>
### Federated Search

<br/>&raquo; ***TBD***


<a name="options"><br/></a>
## Settings

  Following items are available on Settings page to allow user to choose for
  preference. Changed values are saved in browser cookie store for
  restoring these settings when the app is reloaded on next time.
  <br/><br/>

  * Color Theme and Appearance
    - **Use dark theme for App menu**
      <br/><i>&#x25B2;</i>
      Dark theme color is default for the app menu. Unchecking this option will
      render the app menu in white background.

    - **Details expander on the right (reload required)**<a name="settings-expander"></a>
      <br/><i>&#x25B2;</i>
      On data grid view, setting the most right column as expander for
      details view. By default, the expander is on the most left. This setting
      requires reloading the page to take effect.

    - **Pagination position at the bottom of the data table**
      <br/><i>&#x25B2;</i>
      On data grid view, set pagination controls at the bottom position;
      otherwise, on the top. Default is 'bottom' for this option.

    - **Show Export button next to pagination**
      <br/><i>&#x25B2;</i>
      On data grid view, the Export (to `json`, `csv` or clipboard) button is
      placed next to the pagination controls. Uncheck this option if the
      app is in a narrow-width screen or browser window to show more pagination
      selectors, especially when there are many pages of data to display.

    - **Show both "Clear All" and "Apply" buttons next to Filters**
      <br/><i>&#x25B2;</i>
      Filter action buttons are by default displayed next to the Filters Pane.
      Uncheck this option if the app is in a narrow-width screen or browser window
      so that more filter tags will be displayed within the Filters Pane.

    - **Show Filters Pane with inline Search**
      <br/><i>&#x25B2;</i>
      Search input will be under (other than inside) the Filters Pane, if this
      option is checked.

    - **Show clock at footer**
      <br/><i>&#x25B2;</i>
      Uncheck this option will display the app version (other than a real time
      clock) at the bottom-right corner with the footer.

  * User Actions
    - **Allow re-arranging perspective tabs (with some issue)**
      <br/><i>&#x25B2;</i>
      Currently this feature is under-development. The function may not behave
      as expected.

  * System
    - **SPA mode without browser history**
      <br/><i>&#x25B2;</i>
      SPA mode will replace the URL in the browser to leave no browser history.
      Uncheck this option if navigation (back and forward between pages) in the
      browser is desired.

    - **Show next release progress**
      <br/><i>&#x25B2;</i>
      Option only available in non-production environment, to display a project
      progress chart on Usage and Help.


<a name="appInfo"><br/></a>
## Message Board

  Message Board is the notification center to view and acknowledge system info,
  operation messages, warnings, and errors.

  * Message Types

    * Message can have following types:
      - `<info>` - general information (in light blue background color)
      - `<warn>` - warning messages (in light orange background color)
      - `<error>` or `<fatal>` - error message (in light red background color)
      - `<debug>` - debugging information (in light grey background color)

    * Message can also have following attributes:
      - `important` or `sticky`: always remained on Message Board (with paper-airplane icon).
      - `notAcknowledged`: acknowledgeable message (with flag icon), must be acknowledged before being able to remove or clear out from Message Board.
      - `successful`: success information (in light green background color).

  * Open Notifications

    * Message Board can be opened and viewed by
      - Header Notifications indicator (a bell icon) when there is acknowledgeable or error messages
      - Footer Notifications indicator (a 3-dot icon, or animated dots icons when there is acknowledgeable or error messages)
      - App Menu (to open up Message Board page)

    * Message Board opened from Header or Footer will be displayed as a modal dialog.

  * Operations

    * Message Board operations:
      - **Clear All**: clear all messages except not-acknowledged and important (sticky) ones.
      - **Acknowledge All**: acknowledge all acknowledgeable messages.
      - **Copy**: copy all messages to clipboard.

    * Message operations:
      - **Close**: close and remove message from Message Board.
      - **Acknowledge**: acknowledge the message (if it is not acknowledged yet)
      - **Copy**: copy message to clipboard.


<a name="contact"><br/></a>
## Contact

For any questions, please contact the [dev](mailto:jason.zhuyx@gmail.com).


<br/>
<br/>
<br/><div>
<a href="https://github.com/dockerian" style="text-decoration:none;"><img src="https://avatars.githubusercontent.com/u/22064108" style="border:0;height:50;width:50px;" height="50" alt="dockerian" border="0" title="Dockerian" align="right" valign="top" /></a>
</div>

&raquo; Back to <a href="#contents">Table Of Contents</a> &laquo;