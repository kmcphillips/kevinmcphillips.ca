// Hello
console.log("%c👋👋👋", "font-size: 2em;");

// Any element with the class "obfuscate-email" and the attributes "data-email-name" and "data-email-domain" will be
// replaced with an anchor tag with the href set to "mailto:name@domain". Scientifically proven to be 100% spam-proof.
Array.from(document.getElementsByClassName("obfuscate-email")).forEach(function (element) {
  name = element.getAttribute("data-email-name");
  domain = element.getAttribute("data-email-domain");

  if(name == null || domain == null || name == "" || domain == "") {
    console.log("Error: data-email-name and data-email-domain attributes must be set on elements with the obfuscate-email class.");
  } else {
    replacement = document.createElement("a");
    replacement.href = "mailto:" + name + "@" + domain;
    replacement.innerHTML = element.innerHTML;
    element.replaceWith(replacement);
  }
});
