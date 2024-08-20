import fs from 'fs';
import path from 'path';

const CONTENT_DIR = path.join(process.cwd(), "content");
const OUTPUT_DIR = path.join(process.cwd(), "public");

const readFile = (fileName) => {
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

const generateJsonFiles = () => {
    const contentDirs = fs.readdirSync(CONTENT_DIR);
    contentDirs.forEach(directory => {
        const files = fs.readdirSync(path.join(CONTENT_DIR, directory));
        files.forEach(file => {
            const parsedFiles = file.map(readFile);
            fs.writeFileSync(path.join(OUTPUT_DIR, `${parsedFile.title}.json`), JSON.stringify(posts, null, 2));
            console.log(parsedFile.title);
        });
    });
}

generateJsonFiles();