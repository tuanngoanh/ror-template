WebApp.AngularUtils = new function(){
    var awaitingDataApplies = {};

    function pageDoneCallback() {
        var apply;
        for (apply in awaitingDataApplies) {
            if(awaitingDataApplies.hasOwnProperty(apply)){
                awaitingDataApplies[apply].call();
            }
        }
    }

    WebApp.pageDoneCallback = pageDoneCallback;

	this.applyData = function(elementSelector, itemToCheckScopeOn, scopeApplyFunction) {
		var element = $(elementSelector),
			scope = $(elementSelector).scope();

		function applyData(isValidScope) {
			if (typeof(isValidScope) === 'undefined' || !isValidScope) {
				element = $(elementSelector);
				scope = element.scope();
			}

			scope.$apply(function(){
  				scopeApplyFunction.call(element, scope);
  			});

			delete awaitingDataApplies[elementSelector];
		}

		if (scope && scope[itemToCheckScopeOn]) {
			applyData(true);
		} else {
			awaitingDataApplies[elementSelector] = applyData;
		}
	};
};
