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
        <a href={ '#' + item.name } >{ item.title }</a>
      </li>
    </ul>
  </nav>

  <script>
    var self = this;
    this.searching = false;
    this.items = opts.items;
    this.categories = _.sortBy(opts.categories, 'priority');

    this.searchResults = _.clone(this.items);

    console.log(this.items);

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

    console.log(this.cats);

    _.each(this.items, function(item){
      var primaryCat = item.primaryCategory;
      staticList[primaryCat].items.push(item);
      console.log('primary cat: ' + primaryCat);
    });

    console.log(this.categories);

    this.searchUpdate = function() {
      var searchVal = self.search.value;
      if (searchVal === '') {
        // all visible again
        //this.visibleCategories = this.categories;
        this.searching = false;
        this.update();
        return;
      }

      this.searching = true;

      var options = {
        keys: ['title', 'description']   // keys to search in
      };
      var f = new Fuse(this.items, options);
      var result = f.search(searchVal); // Fuzzy-search for pattern 'brwn'

      this.searchResults = _.clone(result);
      this.update();
    }
  </script>
</doc-nav>
