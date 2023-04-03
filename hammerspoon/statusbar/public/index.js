import { createSignal } from 'https://cdn.jsdelivr.net/npm/solid-js@1.6.16/+esm'
import { render } from 'https://cdn.jsdelivr.net/npm/solid-js@1.6.16/web/+esm'
import html from 'https://cdn.jsdelivr.net/npm/solid-js@1.6.16/html/+esm'

window.updateState = () => {}

const App = () => {
  const [state, setState] = createSignal({ pomodoroRunning: false })

  window.updateState = function (data) {
    setState((prev) => ({ ...prev, ...data }))
  }

  return html`<main>
    <span style="font-size: 32px;">󰀶</span>

    <span class="separator"></span>

    <span
      >${() => (state().pomodoro?.mode === 'W' ? '🍅' : '☕️')}${() =>
        state().pomodoro?.paused ? '⏸️' : ''}</span
    >
    <span>${() => state().pomodoro?.time}</span>

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
