<doc-metadata>
  <div class="docMetadataControls">
    <button onclick={ toggle } class="vclButton vclHalfTransparent" type="button" name="button">
      <i if={ this.hidden } class="vclIcon fa fa-chevron-left"></i>
      <i if={ !this.hidden } class="vclIcon fa fa-chevron-right"></i>
      <i class="vclIcon fa fa-info"></i>
    </button>
  </div>
  <div class="vclDataList vclRowHoverHighlight {vclDisplayNone: this.hidden}">
    <header class="vclClearFix">
      <h2 class="vclFloatLeft">Package Information</h2>
    </header>
    <ul role="listbox">
      <li>
        <span class="vclGridSpan-gcb" role="gridcell"><b>Name</b></span>
        <span class="vclGridSpan-gca" role="gridcell">{ this.pack.name }</span>
      </li>
      <li if={ this.pack.repository }>
        <span class="vclGridSpan-gcb" role="gridcell"><b>Repository</b></span>
        <span class="vclGridSpan-gca" role="gridcell">
          <a href={ this.pack.repository }>{ this.pack.repository }</a>
        </span>
      </li>
      <li if={ this.pack.author }>
        <span class="vclGridSpan-gcb" role="gridcell"><b>Author</b></span>
        <span class="vclGridSpan-gca" role="gridcell">{ this.pack.author }</span>
      </li>
      <li if={ this.pack.version }>
        <span class="vclGridSpan-gcb" role="gridcell"><b>Version</b></span>
        <span class="vclGridSpan-gca" role="gridcell">{ this.pack.version }</span>
      </li>
      <li if={ this.pack.license }>
        <span class="vclGridSpan-gcb" role="gridcell"><b>License</b></span>
        <span class="vclGridSpan-gca" role="gridcell">{ this.pack.license }</span>
      </li>
      <li if={ false }>
        <span class="vclGridSpan-gcb" role="gridcell"><b>Aprox. size</b></span>
        <span class="vclGridSpan-gca" role="gridcell">2kb</span>
      </li>
      <li if={ this.pack.docgen }>
        <span class="vclGridSpan-gcb" role="gridcell"><b>VCL Categories</b></span>
        <span class="vclGridSpan-gca" role="gridcell">
          <span class="vclLabel" each={ cat in this.pack.docgen.categories }>{ cat.title }</span>
        </span>
      </li>
      <li if={ false }>
        <span class="vclGridSpan-gcb" role="gridcell"><b>Description</b></span>
        <span class="vclGridSpan-gca" role="gridcell">{ this.pack.description }</span>
      </li>
    </ul>
  </div>
  <script>
    this.hidden = true;
    this.pack = opts.pack || {};

    this.toggle = function() {
      this.hidden = !this.hidden;
    }

    this.on('update', function() {
      this.pack = opts.pack;
      if (!this.pack) return;

      if (this.pack.license && this.pack.license.type) {
        this.pack.license = this.pack.license.type;
      }

      if (this.pack.author && this.pack.author.name) {
        this.pack.author = this.pack.author.name;
      }

      if (this.pack.repository && this.pack.repository.url) {
        this.pack.repository = this.pack.repository.url;
      }

      if (_.startsWith(this.pack.repository, 'git://github.com')) {
        // replace with https
        this.pack.repository = this.pack.repository.replace('git', 'https');
      }
    });
  </script>
</doc-metadata>
