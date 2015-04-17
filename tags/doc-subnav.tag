<doc-subnav>
  <li onclick={ toggle } role="sectionhead" class="vclHeading" class={ active: active, vclDisplayNone: hidden }>
    <span>{ cat.title }</span>
  </li>
  <div if={ open }>
    <li each={ item in items } role="presentation">
      <a href={ '#' + item.name } >{ item.title }</a>
    </li>
  </div>
  <script>
    this.open = false;
    this.items = opts.items;

    this.toggle = function() {
      this.open = !this.open;
    }
  </script>
</doc-subnav>
