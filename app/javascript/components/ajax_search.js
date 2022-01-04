const ajaxSearch = () => {
  const indexResult = document.querySelector('.instrument-index-result-instruments');
  if (indexResult) {
    const nameForm = document.querySelector('#search-name');
    const nameFormInput = nameForm.querySelector('input');
    nameForm.addEventListener('keyup', (e) => {
      const url = `instruments?search%5Bname%5D=${nameFormInput.value}`
      fetch(url, { headers: { 'Accept': 'text/plain' } })
        .then(response => response.text())
        .then((data) => {
          // console.log(data)
      indexResult.innerHTML = data;
    })
    })
  }
};

export { ajaxSearch }
