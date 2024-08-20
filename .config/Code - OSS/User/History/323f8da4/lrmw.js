import fs from 'fs';
import path from 'path';

const postsDir = "../content/home"
const outputFile = "../public/posts.json"

const getPostFiles = () => {
    return fs.readdirSync(postsDir).filter(file => file.endsWith('.md'));
};

const readPostFile = (fileName) => {
    const filePath = path.join(postsDir, fileName);
    const content = fs.readFileSync(filePath, 'utf-8');
    return {
        title: fileName.replace('.md', ''),
        content: content
    };
};

const generatePostsJson = () => {
    const postFiles = getPostFiles();
    const posts = postFiles.map(readPostFile);
    fs.writeFileSync(outputFile, JSON.stringify(posts, null, 2));
    console.log('Posts JSON generated successfully.');
};

generatePostsJson();