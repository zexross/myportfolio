{{flutter_js}}
{{flutter_build_config}}

const texts = [
"Swapping time and space...",
"Pushing pixels...",
"Still faster than Windows update...",
"Kindly hold on until I finish a cup of coffee...",
"Don't panic, Just count to infinity...",
];
const element = document.querySelector('p.loading-label');
let i=0;
const listener = e => {
i = i < texts.length - 1 ? i+1 : 0;
element.innerHTML  = texts[i];
};
element.innerHTML = texts[0];
element.addEventListener('animationiteration', listener, false);

window.addEventListener('load', function(ev) {
// Initialize Flutter configuration
_flutter.loader.load({
onEntrypointLoaded: function(engineInitializer) {
  engineInitializer.initializeEngine().then(function(appRunner) {
    const loader = document.getElementById("loader");
    loader.remove();
    appRunner.runApp();
  });
}
});
});