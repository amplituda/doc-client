<doc-demo>
  <div class="docDemo">
    <div class="vclTabs">
      <ul role="tablist">
        <li class={ vclSelected: this.demoVisible } role="tab">
          <a onclick={ showDemo } href="#"><i class="fa fa-eye"></i> Demo</a>
        </li>
        <li class={ vclSelected: this.codeVisible } role="tab">
          <a onclick={ showCode }  href="#"><i class="fa fa-code"></i> Code</a>
        </li>
      </ul>
    </div>
    <div>
      <div name="ninja" class="docDemoContent shadow {vclDisplayNone: !this.demoVisible}"></div>
      <div class="code {vclDisplayNone: !this.codeVisible}">
        <form class="docEditDemo" action="http://codepen.io/pen/define" method="POST" target="_blank">
          <input type="hidden" name="data" value={ JSON.stringify(codePen) }>
          <button class="vclButtonStd vclHalfTransp">
              <div class="vclIcon fa fa-edit" aria-hidden="true" role="img"></div>
              <span class="vclText">Edit</span>
          </button>
        </form>
        <pre class="docDemoContent" name="source">{ code }</pre>
      </div>
    </div>
  </div>

  <script>

    // TODO: check url if code should be visible
    this.demoVisible = true;
    this.codeVisible = false;

    // stupid simple toggle
    showCode = function() {
      this.demoVisible = false;
      this.codeVisible = true;
    };

    showDemo = function() {
      this.demoVisible = true;
      this.codeVisible = false;
    }

    this.code = opts.code;
    var code = this.code;
    var css = opts.css;

    // for codepen
    this.codePen = {
      html: opts.code,
      css: opts.css
    };

    // This is the magic:
    var wrap = document.createElement('div');
    this.ninja.appendChild(wrap);

    var templateEl = document.createElement('template');
    var cssEl = document.createElement('style');
    cssEl.innerHTML = css;
    templateEl.innerHTML = cssEl.outerHTML + code;

    var shadowWrap = wrap.createShadowRoot();
    var clone = document.importNode(templateEl.content, true);
    shadowWrap.appendChild(clone);

    var sourceEl = this.source;
    this.on('mount update', function() {
      // highlight the source after update
      hljs.highlightBlock(sourceEl);
    });
  </script>
</doc-demo>
