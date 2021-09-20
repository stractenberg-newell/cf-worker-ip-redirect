addEventListener("fetch", (event) => {
  event.respondWith(
    handleRequest(event.request).catch(
      (err) => new Response(err.stack, { status: 500 })
    )
  );
});

async function handleRequest(request) {
  // Read the source IP
  const ip = request.headers.get("cf-connecting-ip");
  // Search the KV for that IP
  const allowed_ips = await ALLOWED_IPS.get(ip)

// If the IP isn't found in the KV, redirect to another site. Otherwise load the intended site
if (ip !== allowed_ips) {
    return Response.redirect("https://www.<domain>.com");
  } else {
    return fetch(request);
    }
}
