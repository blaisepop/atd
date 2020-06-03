import consumer from "./consumer";
  const tracksContainer = document.getElementById('tracks');
  if (tracksContainer) {
    const id = tracksContainer.dataset.playlistId;
    consumer.subscriptions.create({ channel: "PlaylistChannel", id: id }, {
      received(data) {
        tracksContainer.insertAdjacentHTML('afterbegin', data);
      }
    });
  }
