// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import 'bootstrap'
import { Toast } from 'bootstrap/dist/js/bootstrap.bundle.js';
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"

Rails.start();
Turbolinks.start();
ActiveStorage.start();

document.addEventListener("turbolinks:load", () => {
    const toastElList = [].slice.call(document.querySelectorAll('.toast'))
    const toastList = toastElList.map(function (toastEl) {
        return new Toast(toastEl)
    });
    toastList.forEach((e)=>{
        e.show();
    });

    const toggle = document.getElementById("preprocessed_data-toggle");
    const data = document.getElementById("preprocessed_data");

    if (toggle !== null) {
        toggle.addEventListener("click", () => {
            if (data.classList.contains("small")) {
                return data.classList.remove("small")
            } else {
                return data.classList.add("small")
            }
        });
    }

    const copy = document.getElementById("preprocessed_data-copy");

    if (copy !== null) {
        copy.addEventListener("click", () => {
            navigator.clipboard.writeText(data.textContent);
            return copy.textContent = copy.getAttribute("data-copied");
        });
    }
});
