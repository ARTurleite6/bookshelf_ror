import {Controller} from '@hotwired/stimulus'

export default class extends Controller {
    static targets = ["notice", "alert"]

    connect() {
        console.log('connected');
        this.hasNoticeTarget && this.dismiss(this.noticeTarget, 5000);
        this.hasAlertTarget && this.dismiss(this.alertTarget, 5000);
    }

    triggerDismiss(event) {
        event.preventDefault();
        const target = event.currentTarget;
        this.dismiss(target, 0);
    }

    dismiss(target, delay) {
        setTimeout(() => {
            target.classList.add('transition', 'ease-linear', 'delay-75', 'opacity-0', 'translate-x-full', 'duration-300')
        }, delay)
    }
}