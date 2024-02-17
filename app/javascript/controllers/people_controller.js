import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
    static values= {
        personId: String,
    }

    loadDetails(event) {
        event.preventDefault();

        fetch(`/people/${this.personIdValue}`)
            .then(response => response.text())
            .then(html => {
                document.getElementById('person-details-content').innerHTML = html;
            });
    }
}
