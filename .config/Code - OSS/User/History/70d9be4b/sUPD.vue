<script setup>
defineProps({
    src: String,
    alt: String,
    border: Boolean
});
</script>

<template>
    <img :src="`/afbeeldingen/${src}`" :alt="alt" />
</template>