import { Controller } from "@hotwired/stimulus"

class ProgressBar {
  constructor(progressbar, targets){
    this.progressBar = progressbar;
    this.targets = targets;
    this.progress = 0;
  }

  init(){
    const context = this;
    this.targets.forEach(function(target){
      target.addEventListener('click', function(e){
        context.changeProgress(e);
      });
    });
  }

  changeProgress(e){
    this.progress = e.target.getAttribute('data-progress');
    this.progressBar.style.width = this.progress + '%';
    this.progressBar.setAttribute('aria-valuenow', this.progress);
  }
}
