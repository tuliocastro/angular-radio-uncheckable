uncheckable = ()->
  link = (scope, element, attrs)->
    oldValue = null;

    element.bind 'click', (e)->
      value = attrs.value;

      if value is oldValue
        scope.$eval(attrs.ngModel + ' = null');
        scope.$apply();
        value = null;

      oldValue = value;
      e.stopPropagation();


  directive =
    priority: -1,
    restrict: 'A'
    scope: true
    link: link


  return directive

angular
.module(CONSTANTS.APP)
.directive('uncheckable', uncheckable)