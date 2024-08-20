import fs from 'fs';
import path from 'path';

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
    
}

generatePostsJson();