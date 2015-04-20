<doc-nav>
  <nav class="docNav vclNavigation vclVertical">
    <input
      type="search"
      oninput={ searchUpdate }
      placeholder="Search..."
      name="search" value=""
    autofocus>
    <ul if={ !searching } id="nav-items">
      <div each={ cat in cats }>
        <doc-subnav items={ cat.items }></doc-subnav>
      </div>
    </ul>
    <ul if={ searching } id="nav-items">
      <li each={ item in searchResults } role="presentation">
        <a class="vclIcogram" href={ '#' + item.name } >
          <span class="vclText">{ item.title }</span>
        </a>
      </li>
    </ul>
  </nav>

  <script>
    var self = this;
    this.searching = false;
    this.items = opts.items;
    this.categories = _.sortBy(opts.categories, 'priority');
    this.selected = opts.selected;

    this.selectedItem = null;

    this.searchResults = _.clone(this.items);

    var staticList = {};

    _.each(this.categories, function(cat) {
      var catName = cat.title;
      if (!staticList[catName]){
        staticList[catName] = {};
        staticList[catName].items = [];
        staticList[catName].title = cat.title;
        staticList[catName].priority = cat.priority;
      }
      //staticList[catName].push(cat);
    });

    this.cats = _.values(staticList);

    _.each(this.items, function(item){
      var primaryCat = item.primaryCategory;
      staticList[primaryCat].items.push(item);
    });

    this.on('update', function() {
      // unset last selected item
      if (this.selectedItem !== null){
        this.selectedItem.active = false;
      }
      var selectedItem = _.find(this.items, {name: this.selected});
      if (!selectedItem) return;
      selectedItem.active = true;
      this.selectedItem = selectedItem;
    });

    this.searchUpdate = function() {
      var searchVal = self.search.value;
      if (searchVal === '') {
        // all visible again
        this.searching = false;
        this.update();
        return;
      }

      this.searching = true;

      var options = {
        keys: ['title', 'description']   // keys to search in
      };
      var f = new Fuse(this.items, options);
      var result = f.search(searchVal);

      this.searchResults = _.clone(result);
      this.update();
    }
  </script>
</doc-nav>
