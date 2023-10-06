export class TimingControls extends HTMLElement {
    constructor() {
        super();
        //this._root = this.attachShadow({ mode: "closed" });
        const template = document.getElementById(
            "timing-controls-template",
        ).content;
        const shadowRoot = this.attachShadow({ mode: "closed" });
        shadowRoot.appendChild(template.cloneNode(true));        
    }

    connectedCallback() {
        const timer = this.querySelector("#timer");
        const btn_clear = this.querySelector("#btn-clear");
        const btn_consume = this.querySelector("#btn-consume");
        const btn_movement = this.querySelector("#btn-movement");

        if (!btn_consume || !btn_movement) {
            return;
        }

        swapOnClick(btn_consume, "Consume", btn_movement);
        swapOnClick(btn_movement, "Movement", btn_consume);

        function swapOnClick(element, name, other) {
            element.addEventListener("click", function() {
                if (element.innerText === name) {
                    element.innerText = "Stop";
                    other.disabled = true;
                } else {
                    element.innerText = name;
                    other.disabled = false;
                }
            });
        };
        
    }
    
}
