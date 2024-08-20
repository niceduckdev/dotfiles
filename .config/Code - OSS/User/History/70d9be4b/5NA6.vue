<script setup>
defineProps({
    src: String,
    alt: String
});
</script>

<template>
    <img :src="`/afbeeldingen/${src}`" :alt="alt" />
</template>