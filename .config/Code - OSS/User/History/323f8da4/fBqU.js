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
    const CONTENT_DIRS = fs.readdirSync(CONTENT_DIR);
    CONTENT_DIRS.forEach(directory => {
        const FILES = fs.readdirSync(path.join(process.cwd(), CONTENT_DIR, directory));
        
    });
}

generateJsonFiles();