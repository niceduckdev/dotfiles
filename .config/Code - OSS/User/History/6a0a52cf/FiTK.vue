<script setup>
import Header from '@/components/header.vue';

defineProps({
    title: String,
    description: String,
    image: String
});
</script>

<template>
    <header className="h-52 mb-3 flex flex-col items-center justify-center bg-bottom bg-cover rounded-md"
        :style="`background-image: url('/images/${image}')`">
        <h1 className="font-extrabold text-5xl text-white text-center">{{ title }}</h1>
        <h5 className="font-bold text-lg text-white text-center px-5">{{ description }}</h5>
    </header>
    <slot />
</template>