import fs from 'fs';
import path from 'path';

const CONTENT_DIR = path.join(process.cwd(), "content");
const OUTPUT_DIR = path.join(process.cwd(), "public/api");

const readFile = (name, directory) => {
    const content = fs.readFileSync(path.join(CONTENT_DIR, directory, name), 'utf-8');
    return {
        title: name.replace('.md', ''),
        content: content
    };
};

const generateJsonFiles = () => {
    const contentDirs = fs.readdirSync(CONTENT_DIR);
    contentDirs.forEach(directory => {
        const files = fs.readdirSync(path.join(CONTENT_DIR, directory)).filter(file => file.endsWith('.md'));
        let parsedFiles = [];

        files.forEach(file => {
            parsedFiles.push(readFile(file, directory));
        });

        fs.writeFileSync(path.join(OUTPUT_DIR, `${directory}.json`), JSON.stringify(parsedFiles, null, 2));
        console.log(`${directory}.json generated`);
    });
}

generateJsonFiles();