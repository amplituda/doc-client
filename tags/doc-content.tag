<doc-content>
  <div class="vclPanel docPart { vclDisplayNone: !this.hasContent }">
    <h1 id={ 'docpart-' + opts.content.name }>{ opts.content.title }</h1>
    <div name="readme" class="docText"></div>
  </div>

  <div class="docWelcome vclPanel { vclDisplayNone: this.hasContent }">
    <h3>Welcome to this generated Documentation</h3>
    <div class="">
      Some usefull tips to get you started:
      <ul>
        <li>
          Any Demo can be editing by switching to the code tab and then
          clicking the edit button in the top right corner.
        </li>
        <li>
          The search supports fuzzy matching. This means that you can search
          for <code>bttn</code> and still find <code>Button</code>.
        </li>
        <li>
          You can type in a search term at any time without focusing the
          search-field. (Unless you are typing in another input field)
        </li>
        <li>
          Pressing <code>Esc</code> at any time will clear the search field.
        </li>
      </ul>
    </div>
  </div>

  <script>

  var self = this;

  //this.content = opts.content;

  this.readme.innerHTML = opts.content.readme;
  this.hasContent = false;

  this.on('update', function() {
    if (opts.content === undefined) return this.hasContent = false;

    // clean up old demos
    _.each(this.demos, function(demo) {
      demo.unmount();
    });
    this.demos = [];

    // update readme
    this.readme.innerHTML = opts.content.readme;
    this.hasContent = true;

    // inject demos
    injectDemos(opts.content.demos, opts.content.style);
  });

  this.demos = [];


  function injectDemos(demos, style) {
    _.each(demos, function(code, id) {
      console.log('injecting %s', id);
      var el = document.getElementById('demo-' + id);

      var demo = riot.mount(el, 'doc-demo', {
        code: code,
        css: style
      });
      window.test = demo;
      self.demos.push(demo);
    });
  }
  //this.readme = opts.readme;
  </script>

</doc-content>
