"use strict";

window.addEventListener('load', (event) => {
  const element = event.target.getElementById('counter');
  element.addEventListener('click', (event) => {
    const children = event.target.getElementsByTagName('span');
    if (children.length === 1) {
      const child = children[0];
      child.innerHTML = parseInt(child.innerText, 10) + 1;
    }
  });
  element.focus();
});
