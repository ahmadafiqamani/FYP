document.addEventListener("DOMContentLoaded", () => {
    const actuatorStatusDiv = document.getElementById("actuator-status");
    const form = document.getElementById("manual-control-form");

    // Fetch actuator status for a node
    function fetchActuatorState(node) {
        fetch(`/actuator_control/state/${node}/`)
            .then(response => response.json())
            .then(data => {
                actuatorStatusDiv.innerHTML = `
                    <h2>Node: ${data.node}</h2>
                    <p>Red LED: ${data.red_led ? "On" : "Off"}</p>
                    <p>Green LED: ${data.green_led ? "On" : "Off"}</p>
                    <p>Buzzer: ${data.buzzer ? "On" : "Off"}</p>
                `;
            });
    }

    // Handle form submission for manual override
    form.addEventListener("submit", event => {
        event.preventDefault();
        const formData = new FormData(form);
        fetch(`/actuator_control/update/${formData.get("node")}/`, {
            method: "POST",
            body: new URLSearchParams(formData),
        })
            .then(response => response.json())
            .then(data => {
                alert(data.message);
                fetchActuatorState(formData.get("node"));
            });
    });

    // Periodically refresh actuator status
    setInterval(() => {
        fetchActuatorState("F");
        fetchActuatorState("G");
    }, 5000);
});
