<script setup>
import Header from '@/components/header.vue';

defineProps({
    title: String,
    description: String,
    image: String
});
</script>

<template>
    <Header
        :title="title"
        :description="description"
        :image="image"
    />
    <main>
        <slot />
    </main>
</template>