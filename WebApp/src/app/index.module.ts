/// <reference path="../../.tmp/typings/tsd.d.ts" />

import { config } from './index.config';
import { routerConfig } from './index.route';
import { runBlock } from './index.run';
import { MainController } from './main/main.controller';
import { DependenciesService } from '../app/components/dependencies/dependencies.service';
import { remediNavbar } from '../app/components/navbar/navbar.directive';
import { remediMalarkey } from '../app/components/malarkey/malarkey.directive';

declare var malarkey: any;
declare var moment: moment.MomentStatic;

angular.module('Remedi', ['ngAnimate', 'ngCookies', 'ngTouch', 'ngSanitize', 'ngMessages', 'ngAria', 'ngResource', 'ui.router', 'ngMaterial', 'toastr'])
    .constant('malarkey', malarkey)
    .constant('moment', moment)
    .config(config)
    .config(routerConfig)
    .run(runBlock)
    .service('DependenciesService', DependenciesService)
    .controller('MainController', MainController)
    .directive('remediNavbar', remediNavbar)
    .directive('remediMalarkey', remediMalarkey);

