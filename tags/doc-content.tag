<doc-content>
  <div class="vclPanel docPart { vclDisplayNone: !opts.content.name }">
    <h1 id={ 'docpart-' + opts.content.name }>{ opts.content.title }</h1>
    <div name="readme" class="docText"></div>
  </div>

  <div class="vclPanel">
    <h3>Welcome to this generated Documentation</h3>
    <div class="">
      Some usefull tips to get you started:
      <ul>
        <li>
          Any Demo can be editing by switching to the code tab and then
          clicking the edit button in the top right corner.
        </li>
        <li>
          The search supports fuzzy terms. This means that you can search
          for <code>bttn</code> and still find <code>Button</code>.

        </li>
      </ul>
    </div>
  </div>

  <script>

  //this.content = opts.content;

  this.readme.innerHTML = opts.content.readme;

  this.on('update', function() {
    console.log('alaaarm');
    console.log(opts.content);
    this.readme.innerHTML = opts.content.readme;

    // inject demos
    injectDemos(opts.content.demos, opts.content.style);
  });


  function injectDemos(demos, style) {
    _.each(demos, function(code, id) {
      console.log('injecting %s', id);
      var el = document.getElementById('demo-' + id);

      riot.mount(el, 'doc-demo', {
        code: code,
        css: style
      });
    });
  }
  //this.readme = opts.readme;
  </script>

</doc-content>
