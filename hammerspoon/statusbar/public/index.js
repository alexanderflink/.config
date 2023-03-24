import { createSignal } from 'https://cdn.skypack.dev/solid-js'
import { render } from 'https://cdn.skypack.dev/solid-js/web'
import html from 'https://cdn.skypack.dev/solid-js/html'

window.updateState = () => {}

const App = () => {
  const [state, setState] = createSignal({ pomodoroRunning: false })

  window.updateState = function (data) {
    setState((prev) => ({ ...prev, ...data }))
  }

  function handlePomodoroClick() {
    setState((prev) => ({ ...prev, pomodoroRunning: !prev.pomodoroRunning }))
  }

  return html`<main>
    <span style="font-size: 32px;">󰀶</span>

    <span class="separator"></span>

    <span class=${() => (state().pomodoroRunning ? 'rotate' : '')}>🍅</span>
    <span class="icon" onClick=${handlePomodoroClick}
      >${() => (state().pomodoroRunning ? '' : '')}</span
    >

    <span class="separator"></span>

    <span class="icon"></span>
    <span>
      ${() => state().nowPlaying?.[0]} ${' - '} ${() => state().nowPlaying?.[1]}
    </span>

    <div class="flex-grow" />
    <span>${() => state().date}</span>
    <span>${() => state().time}</span>
    <span class="separator"></span>
    <span> ${() => (Math.round(state().cpu * 10) / 10).toFixed(1)}%</span>
  </main>`
}

render(App, document.body)
