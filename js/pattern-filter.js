(function($) {
  $.fn.filterByPattern = function(string){
    var regex = new RegExp( string, "ig");
 
    return this.hide().filter(function(){
        return regex.test($(this).text());
    }).show();
};
}(jQuery));
