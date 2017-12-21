(function() {
    var app = angular.module('app', []);

    $(document).on('turbolinks:load', function () {
        angular.bootstrap(document.body, ['app']);
    });

    app.filter('maskString', function () {
        return function (str) {
            if (!str) { return '******'; }

            return str.replace(/./g, '*').trim();
        };
    });

    app.filter('unsafe', function($sce) {
        return function(val) {
            return $sce.trustAsHtml(val);
        };
    });

    app.filter('formatPhone', function () {
        return function (tel) {
            if (!tel) { return ''; }

            var value = tel.toString().trim().replace(/^\+/, '');

            if (value.match(/[^0-9]/)) {
                return tel;
            }

            var country, city, number;

            switch (value.length) {
                case 10: // +1PPP####### -> C (PPP) ###-####
                    country = 1;
                    city = value.slice(0, 3);
                    number = value.slice(3);
                    break;

                case 11: // +CPPP####### -> CCC (PP) ###-####
                    country = value[0];
                    city = value.slice(1, 4);
                    number = value.slice(4);
                    break;

                case 12: // +CCCPP####### -> CCC (PP) ###-####
                    country = value.slice(0, 3);
                    city = value.slice(3, 5);
                    number = value.slice(5);
                    break;

                default:
                    return tel;
            }

            if (country == 1) {
                country = "";
            }

            number = number.slice(0, 3) + '-' + number.slice(3);

            return (country + " " + city + "-" + number).trim();
        };
    });

    app.filter('noFractionCurrency',
        [ '$filter', '$locale',
            function(filter, locale) {
                var currencyFilter = filter('currency');
                var formats = locale.NUMBER_FORMATS;
                return function(amount, currencySymbol) {
                    var value = currencyFilter(amount, currencySymbol);
                    var sep = value.indexOf(formats.DECIMAL_SEP);
                    if (value.substring(sep + 1) !== '00') {
                        return value;
                    }

                    if(amount >= 0) {
                        return value.substring(0, sep);
                    }
                    return value.substring(0, sep) + ')';
                };
            } ]
    );

    app.directive('onlyNum', function() {
        return function(scope, element, attrs) {

            var keyCode = [8,9,37,39,48,49,50,51,52,53,54,55,56,57,96,97,98,99,100,101,102,103,104,105,110];
            element.bind("keydown", function(event) {
                if($.inArray(event.which,keyCode) == -1) {
                    scope.$apply(function(){
                        scope.$eval(attrs.onlyNum);
                        event.preventDefault();
                    });
                    event.preventDefault();
                }

            });
        };
    });

    app.directive('onlyDecimal', function() {
        return function(scope, element, attrs) {

            var keyCode = [8,9,37,39,48,49,50,51,52,53,54,55,56,57,96,97,98,99,100,101,102,103,104,105,110, 190];
            element.bind("keydown", function(event) {
                if($.inArray(event.which,keyCode) == -1) {
                    scope.$apply(function(){
                        scope.$eval(attrs.onlyNum);
                        event.preventDefault();
                    });
                    event.preventDefault();
                }
            });
        };
    });

    app.directive('smartDecimal', function () {
        return {
            require: 'ngModel',
            link: function (scope, element, attrs, ngModel) {
                scope.$watch(attrs.ngModel, function(newValue, oldValue) {
                    var spiltArray = String(newValue).split("");

                    if (spiltArray.length === 0) return;
                    if (spiltArray.length === 1 && (spiltArray[0] == '-' || spiltArray[0] === '.' )) return;
                    if (spiltArray.length === 2 && newValue === '-.') return;

                    if(attrs.max) {
                        var maxValue = parseFloat(attrs.max);
                        if(maxValue < parseFloat(newValue)){
                            newValue = maxValue;
                            ngModel.$setViewValue(newValue);
                            ngModel.$render();
                        }
                    }

                    if(attrs.min) {
                        var minValue = parseFloat(attrs.min);
                        if(minValue > parseFloat(newValue)){
                            newValue = minValue;
                            ngModel.$setViewValue(newValue);
                            ngModel.$render();
                        }
                    }

                    if(attrs.allowNegative == "false") {
                        if(spiltArray[0] == '-') {
                            newValue = newValue.replace("-", "");
                            ngModel.$setViewValue(newValue);
                            ngModel.$render();
                        }
                    }

                    if(attrs.allowDecimal == "false") {
                        newValue = parseInt(newValue);
                        ngModel.$setViewValue(newValue);
                        ngModel.$render();
                    }

                    if(attrs.allowDecimal != "false") {
                        var fractionNumber = 2;
                        if(attrs.decimalUpto) {
                            fractionNumber = attrs.decimalUpto;
                        }

                        var n = String(newValue).split(".");
                        if(n[1]) {
                            var n2 = n[1].slice(0, fractionNumber);
                            newValue = [n[0], n2].join(".");
                            ngModel.$setViewValue(newValue);
                            ngModel.$render();
                        }
                    }

                    /*Check it is number or not.*/
                    if (isNaN(newValue)) {
                        ngModel.$setViewValue(oldValue);
                        ngModel.$render();
                    }
                });
            }
        };
    });

    app.directive('inputMaxLengthNumber', function() {
        return {
            require: 'ngModel',
            restrict: 'A',
            link: function (scope, element, attrs, ngModelCtrl) {
                function fromUser(text) {
                    var maxlength = Number(attrs.maxlength);
                    if (String(text).length > maxlength) {
                        ngModelCtrl.$setViewValue(ngModelCtrl.$modelValue);
                        ngModelCtrl.$render();
                        return ngModelCtrl.$modelValue;
                    }
                    return text;
                }
                ngModelCtrl.$parsers.push(fromUser);
            }
        };
    });

    app.directive('myMultipleDatesPicker', function($rootScope) {
        function link(scope, element, attrs) {
            var $element = $(element),
                selectableDates = null;

            $element.multiDatesPicker({
                onSelect: function(dateText, inst) {
                    var $this = $(this),
                        dates = $this.multiDatesPicker('getDates', 'object'),
                        i,
                        resultDates = [];

                    for(i = 0; i < dates.length; i++) {
                        resultDates.push(moment(dates[i]).format('YYYY-MM-DD'));
                    }

                    scope.$apply(function() {
                        scope.ngModel = resultDates;
                    });
                },
                beforeShowDay: function (date) {
                    var isSelectable = true,
                        normalizedDate;

                    if (selectableDates) {
                        normalizedDate = moment(date).format('YYYY-MM-DD');
                        isSelectable = $.inArray(normalizedDate, selectableDates) > -1;
                    }

                    return [isSelectable, ''];
                }
            });

            scope.$watch('myMultipleDatesPicker', function(value) {
                var firstDate,
                    today;

                selectableDates = value;
                $element.datepicker('refresh');
                if (selectableDates && selectableDates.length > 0) {
                    firstDate = moment(selectableDates[0]).toDate();
                    today = new Date();
                    // check if the first date has different month
                    if (firstDate > today &&
                        (firstDate.getMonth() != today.getMonth() ||
                         firstDate.getFullYear() != today.getFullYear())
                    ) {
                        // Go to the month having the first available date
                        $element.datepicker('setDate', firstDate);
                    }
                }
            });

            scope.$watch('ngModel', function(value) {
                var dates = [],
                    i;
                $element.multiDatesPicker('resetDates');
                if (value && value.length) {
                    for (i = 0; i < value.length; i++) {
                        dates.push( moment(value[i]).toDate() );
                    }

                    $element.multiDatesPicker('addDates', dates);
                    $element.datepicker('setDate', dates[0]);
                }
            });
        }

        return {
            require: ['^ngModel'],
            scope: {
                ngModel: '=',
                myMultipleDatesPicker: '=myMultipleDatesPicker'
            },
            link: link
        };
    });

    app.directive('tooltip', function() {
        return function(scope, element, attrs) {
            attrs.$observe('title',function(title){
                // Destroy any existing tooltips (otherwise new ones won't get initialized)
                element.tooltip('destroy');
                // Only initialize the tooltip if there's text (prevents empty tooltips)
                if (jQuery.trim(title)) element.tooltip();
            })
            element.on('$destroy', function() {
                element.tooltip('destroy');
                delete attrs.$$observers['title'];
            });
        }
    });

    app.directive('myDatePicker', function($rootScope) {
        function link(scope, element, attrs) {
            var $element = $(element),
                selectableDates = null,
                format_string = 'YYYY-MM-DD';

            $element.addClass("hasNormalDatePicker");

            $element.datepicker({
                dateFormat: 'yy-mm-dd',
                onSelect: function(dateText, inst) {
                    var selectedDate = moment(dateText).format(format_string);

                    scope.$apply(function() {
                        scope.ngModel = selectedDate;
                    });
                },
                beforeShowDay: function (date) {
                    var isSelectable = true,
                        normalizedDate;

                    if (selectableDates) {
                        normalizedDate = moment(date).format(format_string);
                        isSelectable = $.inArray(normalizedDate, selectableDates) > -1;
                    }

                    return [isSelectable, ''];
                }
            });

            scope.$watch('myDatePicker', function(value) {
                var firstDate, last_date, today;

                today = new Date();
                selectableDates = value;
                $element.datepicker('refresh');

                if (selectableDates && selectableDates.length > 0){
                    firstDate = moment(selectableDates[0]).toDate();
                    last_date = moment(selectableDates[selectableDates.length - 1]).toDate();
                    $element.datepicker("option", {
                        minDate: firstDate,
                        maxDate: last_date,
                        defaultDate: firstDate
                    });
                }

                // check if the first date has different month
                if (firstDate > today &&
                    (firstDate.getMonth() != today.getMonth() || firstDate.getFullYear() != today.getFullYear())) {
                    // Go to the month having the first available date
                    $element.datepicker('setDate', '');
                }

                // Remove today default selection
                $('.ui-datepicker-current-day', $element).removeClass('ui-datepicker-current-day');
            });

            scope.$watch('ngModel', function(value) {
                $element.datepicker('setDate', value ? moment(value).toDate() : null);
                $element.blur();
            });
        }

        return {
            require: ['^ngModel'],
            scope: {
                ngModel: '=',
                myDatePicker: '=myDatePicker'
            },
            link: link
        };
    });

    app.directive('customDatePicker', function($rootScope) {
        function link(scope, element, attrs) {
            var $element = $(element),
                selectableDates = null,
                format_string = 'dddd, MMM DD, YYYY';

            $element.addClass("hasNormalDatePicker");

            $element.datepicker({
                dateFormat: 'DD, M dd, yy',

                onSelect: function(dateText, inst) {
                    var selectedDate = moment(dateText).format(format_string);
                    scope.$apply(function() {
                        scope.ngModel = selectedDate;
                    });
                },
                beforeShowDay: function (date) {
                    var isSelectable = true,
                        normalizedDate;

                    if (selectableDates) {
                        normalizedDate = moment(date).format('YYYY-MM-DD');
                        isSelectable = $.inArray(normalizedDate, selectableDates) > -1;
                    }

                    return [isSelectable, ''];
                }
            });

            scope.$watch('customDatePicker', function(value) {
                var firstDate, today;

                today = new Date();
                selectableDates = value;
                $element.datepicker('refresh');

                if (selectableDates && selectableDates.length > 0)
                    firstDate = moment(selectableDates[0]).toDate();


                // check if the first date has different month
                if (firstDate > today &&
                    (firstDate.getMonth() != today.getMonth() || firstDate.getFullYear() != today.getFullYear())) {
                    // Go to the month having the first available date
                    $element.datepicker('setDate', '');
                }

                // Remove today default selection
                $('.ui-datepicker-current-day', $element).removeClass('ui-datepicker-current-day');
            });

            scope.$watch('ngModel', function(value) {
                $element.datepicker('setDate', value ? moment(value).toDate() : null);
            });
        }

        return {
            require: ['^ngModel'],
            scope: {
                ngModel: '=',
                customDatePicker: '=customDatePicker'
            },
            link: link
        };
    });

    app.directive('fallbackSource', function() {
        return {
            link: function(scope, element, attributes) {

                if (sourceIsEmpty()) { useFallbackSource(); }
                else { listenForSourceLoadingError(); }

                function sourceIsEmpty() {
                    var originalSource = element.attr('src');
                    return originalSource? false : true;
                }

                function useFallbackSource() {
                    element.attr('src', attributes.fallbackSource);
                }

                function listenForSourceLoadingError() {
                    element.bind('error', function() {
                        useFallbackSouce();
                    });
                }
            }
        }
    });

    // Require AngularJS, jQuery and autoNumeric.js from: https://gist.github.com/kwokhou/5964296
    app.directive('crNumeric', [function () {
        'use strict';
        // Declare a empty options object
        var options = {};
        return {
            // Require ng-model in the element attribute for watching changes.
            require: '?ngModel',
            // This directive only works when used in element's attribute (e.g: cr-numeric)
            restrict: 'A',
            compile: function (tElm, tAttrs) {

                var isTextInput = tElm.is('input:text');

                return function (scope, elm, attrs, controller) {
                    // Get instance-specific options.
                    var opts = angular.extend({}, options, scope.$eval(attrs.crNumeric));
                    // Helper method to update autoNumeric with new value.
                    var updateElement = function (element, newVal) {
                        // Only set value if value is numeric
                        if ($.isNumeric(newVal))
                            element.autoNumeric('set', newVal);
                    };

                    // Initialize element as autoNumeric with options.
                    elm.autoNumeric(opts);

                    // if element has controller, wire it (only for <input type="text" />)
                    if (controller && isTextInput) {
                        // watch for external changes to model and re-render element
                        scope.$watch(tAttrs.ngModel, function (current, old) {
                            controller.$render();
                        });
                        // render element as autoNumeric
                        controller.$render = function () {
                            updateElement(elm, controller.$viewValue);
                        }
                        // Detect changes on element and update model.
                        elm.on('change', function (e) {
                            scope.$apply(function () {
                                controller.$setViewValue(elm.autoNumeric('get'));
                            });
                        });
                    }
                    else {
                        // Listen for changes to value changes and re-render element.
                        // Useful when binding to a readonly input field.
                        if (isTextInput) {
                            attrs.$observe('value', function (val) {
                                updateElement(elm, val);
                            });
                        }
                    }
                }
            } // compile
        } // return
    }]);

    app.directive('myTable', function() {
        return {
            restrict: 'A',
            link: function (scope, el, attrs) {
                console.log($(el));
                $(el).dataTable({
                    "paging": false,
                    "lengthChange": false,
                    "searching": false,
                    "ordering": true,
                    "info": false,
                    "autoWidth": false,
                    'aoColumnDefs': [{
                        'bSortable': false,
                        'aTargets': ['no-sorter']
                    }]
                });
            }
        }
    });

    app.controller('GlobalCtrl', [
        "$scope", '$compile', function($scope, $compile) {
            $scope.compile_content = function(data) {
                $compile(data)($scope);
                $scope.$apply();
            };
        }
    ]);
    
    this.app = app;

}).call(this);