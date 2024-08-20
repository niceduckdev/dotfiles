import fs from 'fs';
import path from 'path';

const CONTENT_DIR = path.join(process.cwd(), "content");
const OUTPUT_DIR = path.join(process.cwd(), "public");

const readFile = (name) => {
    const content = fs.readFileSync(name, 'utf-8');
    return {
        title: path.replace('.md', ''),
        content: content
    };
};

const generateJsonFiles = () => {
    const contentDirs = fs.readdirSync(CONTENT_DIR);
    contentDirs.forEach(directory => {
        const files = fs.readdirSync(path.join(CONTENT_DIR, directory)).filter(file => file.endsWith('.md'));
        const parsedFiles = files.map(readFile);
        fs.writeFileSync(path.join(OUTPUT_DIR, `${directory}.json`), JSON.stringify(parsedFiles, null, 2));
        console.log(`${directory}.json generated`);
    });
}

generateJsonFiles();