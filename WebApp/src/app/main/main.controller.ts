import { DependenciesService, IDependency } from '../components/dependencies/dependencies.service';
import {IRootScopeService } from '../index.run';

export interface ILastCameraStill{
    imageDataUri: string;
    timestamp: number;
}

export class MainController {
    public dependencies: Array<IDependency>;

    /* @ngInject */
    constructor(
        public $http: angular.IHttpService,
        public $log: angular.ILogService,
        public $rootScope: IRootScopeService,
        public $timeout: angular.ITimeoutService,
        public DependenciesService: DependenciesService,
        public toastr: any) {

        this.dependencies = this.DependenciesService.dependencies;

        this.loadLastCameraStill();
    }

    public loadLastCameraStill = () => {

        var firebaseRef = new Firebase("https://rxremedi.firebaseio.com/hubot");

        firebaseRef.child("last-camera-still").on("value", (snapshot) => {
            var lastCameraStill: ILastCameraStill = snapshot.val();
            this.$log.debug( ' lastCameraStill ', lastCameraStill);
            this.toastr.success(`Last still taken ${moment.unix(lastCameraStill.timestamp).fromNow()}`);
            $('section.jumbotron').css('background-image', `url(${lastCameraStill.imageDataUri})`);
        });

    }

    public captureStill = () => {
        this.$http.get('http://pi.remedi.io/api/v0/firebase/camera-still')
        .then( ()=> {
          this.toastr.success('Captured still.')
        })
    }


}
