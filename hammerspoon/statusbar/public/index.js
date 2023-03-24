import { createSignal } from 'https://cdn.skypack.dev/solid-js'
import { render } from 'https://cdn.skypack.dev/solid-js/web'
import html from 'https://cdn.skypack.dev/solid-js/html'

window.updateState = () => { }

const App = () => {
  const [state, setState] = createSignal(0)

  window.updateState = function(data) {
    setState((prev) => ({ ...prev, ...data }))
  }

  return html`<main>
    <span class="icon">󰀶</span>
    <span class="rotate">🍅</span> <span>Pomodoro not running</span>
    <span></span>
    <span>
       ${() => state().nowPlaying?.[0]} ${' - '}
      ${() => state().nowPlaying?.[1]}
    </span>
    <div class="flex-grow" />
    <span>${() => state().time}</span>
    <span>${() => state().date}</span>
    <span> ${() => (Math.round(state().cpu * 10) / 10).toFixed(1)}%</span>
  </main>`
}

render(App, document.body)
