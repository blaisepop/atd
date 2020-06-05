import consumer from "./consumer";
  const votesContainer = document.getElementById('tracks');
  if (votesContainer) {
    const id = votesContainer.dataset.playlistId;
    consumer.subscriptions.create({ channel: "TrackChannel", id: id }, {
      received(data) {
        console.log(data)
        votesContainer.insertAdjacentHTML('afterbegin', data);
      }
    });
  }
