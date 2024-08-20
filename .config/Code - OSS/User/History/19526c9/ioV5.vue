<script setup lang="ts">
import Card from '@/components/card.vue';
import Image from '@/components/image.vue';
import Page from '@/components/page.vue';
</script>

<template>
    <Page title="Chiro Stam" subtitle="Als je't mij vraagt?! Chiro!" image="groepsfoto.webp">
        <Card title="Lorem ipsum dolor" subtitle="Lorem ipsum dolor sit amet consectetur">
            <Image src="trooper.webp" :border="true" />
            <p>
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Nesciunt, non fugit repellat veniam laudantium,
                voluptatibus odit sit qui deleniti repudiandae eius necessitatibus dolor architecto sed minus amet. Ab
                assumenda, fugiat voluptatem illum ducimus dolorum nobis. Totam ex sint unde earum. Eos vel, voluptate
                dolore facilis nihil sed illo corrupti voluptas.
            </p>
        </Card>
        <ul>
            <li v-for="post in posts" :key="post.title">
                <router-link :to="{ name: 'post', params: { title: post.title } }">{{ post.title }}</router-link>
            </li>
        </ul>
    </Page>
</template>

<script lang="ts">
export default {
    data() {
        return {
            posts: []
        };
    },
    async created() {
        try {
            const response = await fetch('/posts.json');
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            this.posts = await response.json();
        } catch (error) {
            console.error('Error fetching posts:', error);
        }
    }
};
</script>