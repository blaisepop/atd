window.dataLayer = window.dataLayer || []
function gtag() { dataLayer.push(arguments) }

gtag('js', new Date())

const trackGoogleAnalytics = (event) => {
  gtag('config', 'UA-41023689-4', {
    'cookie_flags': 'max-age=7200;secure;samesite=none'
  })
}

document.addEventListener('turbolinks:load', trackGoogleAnalytics)
