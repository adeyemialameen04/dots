function extractFilenames() {
  const liElements = document.querySelectorAll('li');
  const filenames = [];

  liElements.forEach(element => {
    if (element.textContent.includes('File:')) {
      const codeElement = element.querySelector('code');
      if (codeElement) {
        const names = codeElement.textContent.split(',').map(name => name.trim());
        filenames.push(...names);
      }
    }
  });

  return filenames;
}

function saveToFile(data, filename) {
  const content = data.join('\n');

  const blob = new Blob([content], { type: 'text/plain' });

  const url = URL.createObjectURL(blob);

  const link = document.createElement('a');
  link.href = url;
  link.download = filename;

  document.body.appendChild(link);
  link.click();
  document.body.removeChild(link);

  URL.revokeObjectURL(url);
}

const extractedFilenames = extractFilenames();

saveToFile(extractedFilenames, 'filenames.txt');

console.log("File saved with", extractedFilenames.length, "filenames.");
