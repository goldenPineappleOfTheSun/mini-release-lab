import './style.css';

document.querySelector('#app').innerHTML = `
  <main>
    <h1>Mini Release Lab</h1>
    <p>Build area:
      ${import.meta.env.VITE_BUILD_AREA || 'local'}
    </p>
    <p>Built by our CI/CD pipeline.</p>
  </main>
`;