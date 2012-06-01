// Generated by CoffeeScript 1.3.1
(function() {

  this.Plot = (function() {

    Plot.name = 'Plot';

    function Plot(type) {
      this.type = type;
    }

    Plot.prototype._htmlClass = function() {
      switch (this.type) {
        case 'G':
          return 'grass';
        case 'W':
          return 'water';
        default:
          return '';
      }
    };

    Plot.prototype.render = function() {
      return "<div class=\"" + (this._htmlClass()) + "\"></div>";
    };

    return Plot;

  })();

}).call(this);