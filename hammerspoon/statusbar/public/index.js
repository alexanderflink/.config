import { createSignal, onCleanup } from 'https://cdn.skypack.dev/solid-js'
import { render } from 'https://cdn.skypack.dev/solid-js/web'
import html from 'https://cdn.skypack.dev/solid-js/html'

window.updateState = () => {}

const App = () => {
  const [state, setState] = createSignal(0)

  window.updateState = function (data) {
    setState((prev) => ({ ...prev, ...data }))
  }

  return html`<main>
    <span class="icon">󰀶</span>
    <span> ${() => state().user} </span>
    <span>${() => state().time}</span>
    <div class="flex-grow" />
    <span>CPU: ${() => (Math.round(state().cpu * 10) / 10).toFixed(1)}%</span>
  </main>`
}

render(App, document.body)
