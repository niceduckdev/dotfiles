import fs from 'fs';
import path from 'path';

const CONTENT_DIR = path.join(process.cwd(), "content");

const postsDir = path.join(process.cwd(), 'content/home');
const outputFile = path.join(process.cwd(), 'public/posts.json');

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
        const parsedFiles = files.map(readFile());
        fs.writeFileSync(outputFile, JSON.stringify(posts, null, 2));
    });
}

generateJsonFiles();