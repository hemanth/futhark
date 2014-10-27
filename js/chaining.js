$ = (function (document) {
    var self = '';
    return {
        get: function (selector) {
            self = document.querySelector(selector);
            return this;
        },
        addClass: function (new_class) {
            self.classList.add(new_class);
            return this;
        },
        show: function () {
            var displayVal = window.getComputedStyle(self).display;
            if(displayVal === 'none') self.style.display = "inherit";
            return this;
        },
        hide: function () {
            var displayVal = window.getComputedStyle(self).display;
            if(displayVal !== 'none') self.style.display = 'none';
            return this;
        },
        toggle: function () {
            var displayVal = window.getComputedStyle(self).display;
            displayVal !== 'none' ? self.style.display = 'none' :
            self.style.display = "inherit";
            return this;
        }
    };
 
}(document));
