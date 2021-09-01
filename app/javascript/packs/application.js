// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener("turbolinks:load", () => {
    const toggle = document.getElementById("preprocessed_data-toggle");
    const expandable = document.getElementById("preprocessed_data");

    if (toggle !== undefined) {
        toggle.addEventListener("click", () => {
            if (expandable.classList.contains("small")) {
                return expandable.classList.remove("small")
            } else {
                return expandable.classList.add("small")
            }
        });
    }
});
