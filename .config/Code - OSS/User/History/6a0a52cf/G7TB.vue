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
    <main class="animate-in motion-safe:fade-in-10">
        <slot />
    </main>
</template>