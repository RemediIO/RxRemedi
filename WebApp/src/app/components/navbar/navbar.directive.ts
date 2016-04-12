/** @ngInject */
export function remediNavbar(): angular.IDirective {

  return {
    restrict: 'E',
    scope: {
      captureStill: '='
    },
    templateUrl: 'app/components/navbar/navbar.html',
    controller: NavbarController,
    controllerAs: 'vm',
    bindToController: true
  };

}

/** @ngInject */
export class NavbarController {

  constructor(
    public $rootScope: any,
    public moment: moment.MomentStatic
  ) {

  }

}
