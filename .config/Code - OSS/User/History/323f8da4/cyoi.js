import fs from 'fs';
import path from 'path';

const CONTENT_DIR = path.join(process.cwd(), "content");
const OUTPUT_DIR = path.join(process.cwd(), "public");

const getFiles = () => {
    return fs.readdirSync(postsDir).filter(file => file.endsWith('.md'));
};

const readFile = (fileName) => {
    const filePath = path.join(postsDir, fileName);
    const content = fs.readFileSync(filePath, 'utf-8');
    return {
        title: fileName.replace('.md', ''),
        content: content
    };
};

const generateJsonFile = () => {
    const postFiles = getPostFiles();
    const posts = postFiles.map(readPostFile);
    fs.writeFileSync(outputFile, JSON.stringify(posts, null, 2));
    console.log('Posts JSON generated successfully.');
};

const generateJsonFiles = () => {
    const contentDirs = fs.readdirSync(CONTENT_DIR);
    contentDirs.forEach(directory => {
        const files = fs.readdirSync(path.join(process.cwd(), CONTENT_DIR, directory));
        files.forEach(file => {
            const parsedFile = file.map(readFile);
            fs.writeFileSync(path.join(OUTPUT_DIR, `${parsedFile.title}.json`), JSON.stringify(posts, null, 2));
            console.log(parsedFile.title);
        });
    });
}

generateJsonFiles();