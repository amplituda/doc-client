<doc-subnav>
  <li onclick={ toggle } role="sectionhead" class="docNavHeading" class={ active: active, vclDisplayNone: hidden }>
    <a class="vclIcogram" href="#">
      <span class="vclIcon fa {'fa-angle-right': !open, 'fa-angle-down': open}" aria-hidden="true" aria-label="angle-right" role="img"></span>
      <span>{ cat.title }</span>
    </a>
  </li>
  <div class="vclAnimContainer" if={ open }>
    <li each={ item in items } class="docNavItem { vclSelected: item.active }" role="presentation">
      <a class="vclIcogram" href={ '#' + item.name } >
        <span class="vclText">{ item.title }</span>
      </a>
    </li>
  </div>
  <script>
    this.userChoice = false;
    this.open = false;
    this.items = _.sortBy(opts.items, 'itemPriority');

    // open main category if something in there is selected
    this.on('update', function() {
      var found = _.some(this.items, function(it){
        return it.active === true;
      });
      if (found && !this.userChoice) this.open = true;
    });

    this.toggle = function() {
      this.userChoice = true;
      this.open = !this.open;
    }
  </script>
</doc-subnav>
