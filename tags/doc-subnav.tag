<doc-subnav>
  <li onclick={ toggle } role="sectionhead" class="docNavHeading" class={ active: active, vclDisplayNone: hidden }>
    <a class="vclIcogram" href="#">
      <span class="vclIcon fa {'fa-plus': !open, 'fa-minus': open}" aria-hidden="true" aria-label="angle-right" role="img"></span>
      <span>{ cat.title }</span>
    </a>
  </li>
  <div if={ open }>
    <li each={ item in items } role="presentation">
      <a class="vclIcogram" href={ '#' + item.name } >
        <span class="vclIcon fa fa-angle-right" aria-hidden="true" aria-label="angle-right" role="img"></span>
        <span class="vclText">{ item.title }</span>
      </a>
    </li>
  </div>
  <script>
    this.open = false;
    this.items = _.sortBy(opts.items, 'itemPriority');

    console.log('items');
    console.log(this.items);

    this.toggle = function() {
      this.open = !this.open;
    }
  </script>
</doc-subnav>
