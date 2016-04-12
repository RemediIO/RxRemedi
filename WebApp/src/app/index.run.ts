

export interface IRemediConfig {
    AgentHost: string;
}

export interface IRootScopeService extends angular.IRootScopeService{
    Rx: IRemediConfig
}

/** @ngInject */
export function runBlock(
    $location: any,
    $log: angular.ILogService,
    $rootScope: IRootScopeService
    ) {
    $log.debug('runBlock end' );

    $rootScope.Rx = <any>{};

    switch ($location.$$host) {

        case 'app.remedi.io':
            $rootScope.Rx.AgentHost = 'Github'
            break;

        case 'rx.remedi.io':
            $rootScope.Rx.AgentHost = 'OpenShift'
            break;

        case 'pi.remedi.io':
            $rootScope.Rx.AgentHost = 'Raspberry Pi'
            break;

        default:
            $rootScope.Rx.AgentHost = 'Localhost';
            break;
    }

}
